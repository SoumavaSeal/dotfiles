
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
  
  # Enable Bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Kolkata";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_IN";
    LC_IDENTIFICATION = "en_IN";
    LC_MEASUREMENT = "en_IN";
    LC_MONETARY = "en_IN";
    LC_NAME = "en_IN";
    LC_NUMERIC = "en_IN";
    LC_PAPER = "en_IN";
    LC_TELEPHONE = "en_IN";
    LC_TIME = "en_IN";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
  
  programs.zsh.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.soumava = {
    isNormalUser = true;
    description = "Soumava";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" ];
    shell = pkgs.zsh;
    packages = with pkgs; [
      clang
      bitwarden-desktop
      github-desktop
      heroic
      emacs-pgtk
      (python3.withPackages (python-pkgs: with python-pkgs; [
       jedi-language-server
     ]))
     nodejs
     lua-language-server
     vscodium
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # Basic system utilities
    wget
    git
    wl-clipboard
    neovim
    tmux
    foot
    alacritty
    firefox
    pcmanfm
    btop
    qbittorrent
    zathura
    mpv
    imv
    ntfs3g
    nixd
    yazi
    ripgrep
    dnsmasq # for libvirt networking
    
    # System Customization Utilities
    hyprpaper
    waybar
    wofi
    swaynotificationcenter
    hyprshot
    hyprlock
    hypridle
    wlogout
    nwg-look
  ];
  
  #Virt Manager
  programs.virt-manager.enable = true;
  virtualisation.libvirtd.enable = true;

  # Display Manager
  services.displayManager.ly.enable = true;

  # Desktop Environment
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # Environment Variables
  environment = {
    
    #session vairables
    sessionVariables = {
      SUDO_EDITOR = "nvim";
      NIXOS_OZONE_WL = "1";
    };
    
    #system-wide variables
    variables.AMD_VULKAN_ICD = "RADV";

  };

  # Hardware Accelaration & setting up the drivers
  hardware.graphics = {
    enable = true;
    # extraPackages = [ pkgs.amdvlk ]; --> Got Deprecated
    enable32Bit = true;
    # extraPackages32 = [ pkgs.driversi686Linux.amdvlk ]; --> Got Deprecated
  };
  
  #GameScope
  programs.gamescope = {
    enable = true;
    #capSysNice = true;
  };
  
  #gameMode
  programs.gamemode.enable = true;

  # Auto Mount Drives
  fileSystems."/mnt/Softwares" = 
    { device = "/dev/disk/by-uuid/B8BCB0F4BCB0AE6E";
      fsType = "ntfs";
    };

  fileSystems."/mnt/Backups" = 
    { device = "/dev/disk/by-uuid/DC6AFBC96AFB9E88";
      fsType = "ntfs";
    };
  
  fileSystems."/mnt/Games and Movies" = 
    { device = "/dev/disk/by-uuid/E49EE9FE9EE9C8DE";
      fsType = "ntfs";
    };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true; # if not already enabled
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment the following
    #jack.enable = true;
  };

  
  system.autoUpgrade.enable = true;
  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}
