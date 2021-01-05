{
    
############
# Hardware #
############

hardware.bluetooth.enable = true;
hardware.steam-hardware.enable = true;
hardware.bluetooth.package = pkgs.bluezFull;
hardware.pulseaudio.enable = true;
hardware.pulseaudio.package = pkgs.pulseaudioFull;

################
# Localization #
################

i18n.defaultLocale = "de_DE.UTF-8";
console.keyMap = "de";
time.timeZone = "Europe/Berlin";

##########
# System #
##########

system.stateVersion = "20.09";

# Automatically delete old packages:
nix.gc.automatic = true;
nix.gc.options = "--delete-older-than 30d";

###########
# Desktop #
###########

services.xserver.layout = "de";
services.xserver.xkbVariant = "nodeadkeys";

# Ibus
i18n.inputMethod.enabled = "ibus";
i18n.inputMethod.ibus.engines = with pkgs.ibus-engines; [ mozc uniemoji typing-booster ];

# Fancy fonts
fonts.enableFontDir = true; # create a directory with links to all fonts in /run/current-system/sw/share/X11-fonts
fonts.fonts = with pkgs; [
  inconsolata
  fira-mono
  ipaexfont
];

############
# Software #
############

nixpkgs.config.allowUnfree = true;

programs.zsh.enable = true;
programs.zsh.setOptions = [
  "globdots"
  "extendedglob"
  "nocaseglob"
  "nocheckjobs"
  "numericglobsort"
  "nobeep"
  "appendhistory"
  "histignorealldups"
  "autocd"
];
programs.zsh.ohMyZsh.enable = true;
programs.zsh.enableCompletion = true;
programs.zsh.autosuggestions.enable = true;
programs.zsh.syntaxHighlighting.enable = true;

programs.less.enable = true;
programs.tmux.enable = true;
programs.tmux.clock24 = true;
programs.tmux.keyMode = "vi";
programs.tmux.shortcut = "a";
programs.tmux.terminal = "screen-256color";
programs.tmux.baseIndex = 1;
programs.tmux.escapeTime = 0;

programs.vim.defaultEditor = true;

programs.java.enable = true;

programs.thefuck.enable = true;
programs.thefuck.alias = "fuck";

programs.nm-applet.enable = true;

# List packages installed in system profile. To search, run:
# \$ nix search wget
environment.systemPackages = with pkgs; [
];

###############
# User config #
###############

users.extraUsers.david = {
  isNormalUser = true;
  home = "/home/david";
  description = "David";
  extraGroups = [ "wheel" "networkmanager" "vboxusers" "docker"];
  createHome = true;
  shell = pkgs.zsh;
};

}
