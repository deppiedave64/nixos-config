{
    services.xserver.desktopManager.plasma5.enable = true;
    services.xserver.displayManager.sddm.enable = true;

    # Ibus
    i18n.inputMethod.ibus.panel = "${pkgs.plasma5.plasma-desktop}/lib/libexec/kimpanel-ibus-panel";
 
}