## Java

Install multiple JDKs with different priorities.

```nix
til7701 = {
    java = {
      enable = true;
      jdks = {
        jdk21 = {
          package = pkgs.jdk21;
          priority = 1;
        };
        jdk17 = {
          package = pkgs.jdk17;
          priority = 2;
        };
        jdk-latest-lts = {
          package = pkgs.jdk21;
          priority = 3;
        };
        jdk-stable = {
          package = pkgs.jdk;
          priority = 4;
        };
      };
    };
};
```
