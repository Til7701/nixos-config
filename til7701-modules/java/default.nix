{ lib, config, pkgs, ... }:

let
  cfg = config.til7701.java;

  custom-jdks = lib.concatMapAttrs
    (name: value: {
      ${name} = {
        priority = value.priority;
        package = value.package.overrideAttrs (oldAttrs: {
          meta.priority = value.priority;
        });
      };
    })
    cfg.jdks;

  links = lib.concatMapAttrs
    (name: value: {
      "_til7701/java/${name}".source = "${value.package}/lib/openjdk";
    })
    custom-jdks;

  default-jdk = (lib.head (lib.sort (a: b: a.priority < b.priority) (lib.attrValues custom-jdks))).package;
in
{
  options.til7701.java = {
    enable = lib.mkEnableOption "java";
    jdks = lib.mkOption {
      default = { };
      type = with lib.types; attrsOf (submodule (
        { name, config, options, ... }:
        {
          options = {
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
    environment.systemPackages = lib.attrValues (lib.concatMapAttrs
      (name: value: {
        ${name} = value.package;
      })
      custom-jdks);

    environment.variables = {
      JAVA_HOME = "${default-jdk}/lib/openjdk";
    };

    environment.etc = links;
  };
}
