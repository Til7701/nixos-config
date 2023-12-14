{ lib, config, pkgs, ... }:

let
  cfg = config.tilman.python;

  my-python-packages = ps: with ps; [
    matplotlib
    numpy
    deap
  ];
  my-python3 = (pkgs.python3.withPackages my-python-packages);
in {

  options.tilman.python = {
    enable = lib.mkEnableOption "python";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [
      my-python3
    ];

    environment.variables = {
      PYCHARM_PYTHON_PATH = "${my-python3}/bin/python";
    };

    environment.etc."python/python3".source = "${my-python3}/";
  };
}
