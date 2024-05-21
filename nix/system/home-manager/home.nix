{ config, pkgs, ... }: {
    home = {
        username = "homaander";
        homeDirectory = "/home/homaander";
        stateVersion = "23.11";

        # packages = with pkgs; [
        #     
        # ]
    };

    imports = [
        ./bash.nix
    ];

    programs.git = {
        enable = true;
        userName = "";
        userEmail = "";
    };
}