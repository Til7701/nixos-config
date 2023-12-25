{ lib, config, pkgs, ... }:

let
  cfg = config.til7701.rust;
in {
  options.til7701.rust = {
    enable = lib.mkEnableOption "rust";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [
      pkgs.jetbrains.rust-rover
      pkgs.rustup
      pkgs.rustc
      pkgs.rustfmt
      pkgs.clippy
      pkgs.cargo
      pkgs.gcc
      pkgs.llvmPackages_latest.bintools
      pkgs.openssl
      pkgs.pkg-config
    ];
    environment.variables = {
      OPENSSL_DIR = "${pkgs.openssl.dev}";
      OPENSSL_LIB_DIR = "${pkgs.openssl.out}/lib";
      RUST_BACKTRACE = "1";
    };
  };
}
