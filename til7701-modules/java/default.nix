{ lib, config, pkgs, ... }:

let
  cfg = config.til7701.java;

  custom-jdks = lib.concatMapAttrs (name: value: {
    ${name} = {
      default = value.default;
      package = value.package.overrideAttrs (oldAttrs: {
        meta.priority = value.priority;
      });
    };
  }) cfg.jdks;

  links = lib.concatMapAttrs (name: value: {
    "_til7701/java/${name}".source = "${value.package}/lib/openjdk";
  }) custom-jdks;

  envVar = lib.concatMapAttrs (name: value: {
    JAVA_HOME = "${value.package}/lib/openjdk";
  }) (lib.filterAttrs (n: v: v.default) custom-jdks);
in {
  options.til7701.java = {
    enable = lib.mkEnableOption "java";
    jdks = lib.mkOption {
      default = {
        jdk21 = {
          default = true;
          package = pkgs.jdk21;
          priority = 1;
        };
      };
      type = with lib.types; attrsOf (submodule (
        { name, config, options, ... }:
        { 
          options = {
            default = lib.mkOption {
              type = lib.types.bool;
              default = false;
              description = lib.mdDoc "Whether this jdk should be the default";
            };
            package = lib.mkOption {
              type = lib.types.package;
              description = lib.mdDoc "Package to install for this jdk";
            };
            priority = lib.mkOption {
              default = 5;
              type = lib.types.int;
              description = lib.mdDoc "Priority of this jdk. Lower number is higher priority";
            };
          };
        }
      ));
    };  
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = lib.attrValues (lib.concatMapAttrs (name: value: {
      ${name} = value.package;
    }) custom-jdks);
    environment.variables = envVar;
    environment.etc = links;
  };
}
