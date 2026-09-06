{ pkgs ? import <nixpkgs> { 
    config = {
      allowUnfree = true;
      allowUnfreePredicate = pkg: builtins.elem (pkgs.lib.getName pkg) [
        "corefonts"
      ];
    };
  } 
}:

pkgs.mkShell {
  packages = [
    pkgs.gnumake
    (pkgs.agda.withPackages (p: [ p.cubical ]))
    pkgs.texlive.combined.scheme-full
    pkgs.corefonts
    pkgs.inconsolata
  ];
}
