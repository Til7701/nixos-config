{ lib, config, pkgs, ... }:

let
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };

  # set priorities for jdks. lower priorities win
  java17 = pkgs.jdk17.overrideAttrs (oldAttrs: {
    meta.priority = 1;
  });
  java21 = unstable.jdk21.overrideAttrs (oldAttrs: {
    meta.priority = 10;
  });
in {

  options.tilman.common = {
    
  };

  config = {
    environment.systemPackages = [
      java17
      java21
    ];

    environment.variables = {
      JAVA_HOME = "${java17.home}/lib/openjdk";
    };

    environment.etc."java/jdk17".source = "${java17}";
    environment.etc."java/jdk21".source = "${java21}";
  };
}
