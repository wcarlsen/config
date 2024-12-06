{pkgs, ...}: {
  # Smartcard reader
  services.pcscd.enable = true;

  services.udev.packages = [pkgs.yubikey-personalization];

  # Lock session when yubi key unplugged
  # services.udev.extraRules = ''
  #   ACTION=="remove",\
  #   ENV{ID_BUS}=="usb",\
  #   ENV{ID_MODEL_ID}=="0407",\
  #   ENV{ID_VENDOR_ID}=="1050",\
  #   ENV{ID_VENDOR}=="Yubico",\
  #   RUN+="${pkgs.systemd}/bin/loginctl lock-sessions"
  # '';

  # Login, lockscreen and sudo with yubi key
  security.pam.services = {
    login.u2fAuth = true;
    sudo.u2fAuth = true;
    kde.u2fAuth = true;
  };

  environment.systemPackages = with pkgs; [
    cryptsetup
    gnupg
    pinentry-qt
  ];

  # Enable gpg-agent
  programs = {
    ssh.startAgent = false;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
      enableExtraSocket = true;
      pinentryPackage = pkgs.pinentry-qt;
    };
  };

  # Required for gpg ssh stuff
  environment.shellInit = ''
    export GPG_TTY="$(tty)"
    export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
    gpgconf --launch gpg-agent
  '';
}
