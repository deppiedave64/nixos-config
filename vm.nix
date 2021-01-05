# Config for installing NixOS on a virtual machine

{ config, pkgs, ... }:

{
  
imports = [ 
  ./common-desktop.nix
  ./plasma.nix
];

##############
# Networking #
##############

networking.hostName = "nixos-vm";
networking.networkmanager.enable = true;
# networking.wireless.enable = true;
networking.hosts = {
  "127.0.0.1" = [ "localhost.localdomain" "localhost" "callister" ];
  "::1" = [ "localhost.localdomain" "localhost" "callister" ];
  "192.168.1.200" = ["idenna"];
  "207.180.195.240" = ["enterprise"];
};

############
# Hardware #
############

# hardware.cpu.amd.updateMicrocode = true;
# hardware.cpu.intel.updateMicrocode = true;

# virtualisation.docker.enable = true;

# virtualisation.virtualbox.host.enable = true;
# virtualisation.virtualbox.host.enableExtensionPack = true;
virtualisation.virtualbox.guest.enable = true;
virtualisation.virtualbox.guest.x11 = true;

# Enable the OpenSSH daemon.
# services.openssh.enable = true;

}
