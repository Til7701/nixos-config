{ lib, config, pkgs, ... }:

let
  cfg = config.til7701.java;

  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };

  # set priorities for jdks. lower priorities win
  java17 = pkgs.jdk17.overrideAttrs (oldAttrs: {
    meta.priority = 1;
  });
  java21 = pkgs.jdk21.overrideAttrs (oldAttrs: {
    meta.priority = 10;
  });
  java-unstable = unstable.jdk.overrideAttrs (oldAttrs: {
    meta.priority = 100;
  });
  java-stable = pkgs.jdk.overrideAttrs (oldAttrs: {
    meta.priority = 1000;
  });
  java-latest-lts = java21;
in {

  options.til7701.java = {
    enable = lib.mkEnableOption "java";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [
      java17
      java21
      java-unstable
      java-stable
    ];

    environment.variables = {
      JAVA_HOME = "${java21.home}/lib/openjdk";
    };

    environment.etc."_til7701/java/jdk17".source = "${java17}/lib/openjdk";
    environment.etc."_til7701/java/jdk21".source = "${java21}/lib/openjdk";
    environment.etc."_til7701/java/java-unstable".source = "${java-unstable}/lib/openjdk";
    environment.etc."_til7701/java/java-stable".source = "${java-stable}/lib/openjdk";
    environment.etc."_til7701/java/java-latest-lts".source = "${java-latest-lts}/lib/openjdk";
  };
}
