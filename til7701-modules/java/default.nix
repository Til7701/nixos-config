{ lib, config, pkgs, ... }:

let
  cfg = config.til7701.java;
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };

  setPriority = index: pkg:
    pkg.overrideAttrs (oldAttrs: {
      meta.priority = index + 1;
    });
  createLinks = pkg: {
    "${pkg}/lib/openjdk" = lib.cleanSource pkg;
  };

  JDKsWithPriority = lib.lists.map setPriority cfg.packages;
  links = lib.lists.map createLinks JDKsWithPriority;
  defaultJDK = lib.head JDKsWithPriority;
in {

  options.til7701.java = {
    enable = lib.mkEnableOption "java";
    packages = lib.mkOption {
      type = lib.types.listOf lib.types.package;
      default = [
        pkgs.jdk21
        pkgs.jdk17
      ];
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = JDKsWithPriority;

    environment.etc."_til7701/java" = {
      inherit links;
    };

    environment.variables = {
      JAVA_HOME = "${defaultJDK}/lib/openjdk";
    };
  };
}
