{ lib, config, pkgs, ... }:

let
  cfg = config.til7701.rust;
in {
  options.til7701.rust = {
    enable = lib.mkEnableOption "rust";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      jetbrains.rust-rover
      rustup
      rustc
      rustfmt
      clippy
      cargo
      gcc
      llvmPackages_latest.bintools
      openssl
      pkg-config
    ];
    environment.variables = {
      OPENSSL_DIR = "${pkgs.openssl.dev}";
      OPENSSL_LIB_DIR = "${pkgs.openssl.out}/lib";
      RUST_BACKTRACE = "1";
    };
  };
}
