{
  imports = [
    ./hyprpaper.nix
  ]; 
 
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      "$mod" = "SUPER";
      "$terminal" = "kitty";
      "$def_opacity" = "1.0";
      "$def_dim_strength" = "0.5";
 
      general = {
        gaps_in = 10; 
        gaps_out = 30; 
	border_size = 0;
        # "col.inactive_border" = "0xff444444";
        # "col.active_border"   = "0xff444444";
        # "col.nogroup_border"  = "0xffffaaff";
        layout = "dwindle";
        no_focus_fallback = true;
        resize_on_border = true;
        extend_border_grab_area = 20; 
        hover_icon_on_border = true; 
        allow_tearing = true;
        resize_corner = 5; 
      };

      dwindle = {
        pseudotile = true;
      };

      decoration = {
        rounding = 20;
        active_opacity = "$def_opacity";
        inactive_opacity = "$def_opacity";
        fullscreen_opacity = "1.0";
        dim_inactive = false;
        dim_strength = "$def_dim_strength";
        dim_special = "$def_dim_strength";
        dim_around = "$def_dim_strength";
        screen_shader = builtins.toFile "hyprland_shader.frag" "
          precision mediump float;
          varying vec2 v_texcoord;
          uniform sampler2D tex;


          void main( void )
          { 
              gl_FragColor = texture2D(tex, v_texcoord); 
          }";
      

        blur = {
          enabled = false;
          size = 1; 
          passes = 3; 
          new_optimizations = true;
          xray = true;
          noise = "0.0117";
          contrast = "0.8916"; 
          brightness = "0.8172";
          vibrancy = "0.2222";
          vibrancy_darkness = "0.0";
          special = true; 
          popups = true; 
          popups_ignorealpha = "0.2"; 
        };
      }; 

      misc = {
        middle_click_paste = false;
        font_family = "IBM Plex Mono";
      };
      
      windowrulev2 = 
      [
        # clipse rules
	"float,class:(clipse)"
        "size 900 600, class:(clipse)"

	# Kitty rules
	"opacity 0.85, class:(kitty)"
	
	# default windows rule
        # dim around floating windows
	"dimaround, floating:1"
      ];

      env = [
        "QT_QPA_PLATFORM,wayland"
	"HYPRLAND_TRACE=1"
	"HYPRLAND_NO_SD_NOTIFY=0"
	"HYPRLAND_NO_SD_VARS=0"
	"GDK_BACKEND,wayland,x11,*"
	"QT_QPA_PLATFORM,wayland;xcb"
	"SDL_VIDEODRIVER,wayland"
	"CLUTTER_BACKEND,wayland"
      ];
      
      exec-once = 
      [
        "clipse -listen"
	"hyprctl setcursor ~/.icons/default 20"
	"waybar"
	"hyprpaper"
	"walker --gapplication-service"
      ];

      exec = 
      [
      ];
       
      animation = 
      [
        "windows,1,8,default,popin 50%"
      ];
      
      monitor = 
      [
        "HDMI-A-1, 3840x1080@60, 0x0, 1"
        "DP-1, 3840x1080@60, 0x-1080, 1"
      ];
      
      bind = 
        [
          # run programs - set class if using kitty as terminal
          "$mod, Return, exec, $terminal --class kitty"
          "$mod, V, exec, $terminal --class clipse clipse"
          "$mod, R, exec, walker"  
	  
	  # kill active window
	  "$mod, C, killactive"

	  "$mod, right, movewindow, r"
	  "$mod, left, movewindow, l"
	  "$mod, up, movewindow, u"
	  "$mod, down, movewindow, d"
        ]
        ++ (
        
        builtins.concatLists (
          builtins.genList(
              x: let
              ws = let
              c = (x + 1) / 10;
            
              in 
                builtins.toString (x + 1 - (c * 10));

                in 
                  [
                    "$mod, ${ws}, workspace, ${toString(x + 1)}"
                    "$mod SHIFT, ${ws}, movetoworkspace, ${toString(x + 1)}"
                  ]   
          )10
        )
      );
    };
  };
}
