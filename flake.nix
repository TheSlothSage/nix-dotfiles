{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    hyprland = {
      url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    };

    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  
    walker = {
      url = "github:abenz1267/walker";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:danth/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

 };

outputs = { nixpkgs, home-manager, ... }@inputs:

  let 
    
    username = "kaley";
    hostname = "kaley-desktop";
    system = "x86_64-linux";
    
    pkgs = import nixpkgs {

      inherit system;
      config.allowUnfree = true; 
    };

  in 
  
  {
    nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; }; 
      modules = [

        kaley-desktop/hyprland.nix
	kaley-desktop/configuration.nix
      ];
    }; 
    
    homeConfigurations."${username}" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      extraSpecialArgs = { inherit inputs; };
      modules = [
        inputs.hyprland.homeManagerModules.default
        inputs.nixvim.homeManagerModules.nixvim
	inputs.walker.homeManagerModules.default 
	inputs.stylix.homeManagerModules.stylix
        ./kaley
      ];
    };
  };
}
