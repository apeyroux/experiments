let
  pkgs = import <nixpkgs> {};
  haskellPackages = pkgs.haskellPackages.override {
    overrides = self: super: {
      pandoc = self.callHackage "pandoc" "2.2" {};
      pandoc-types = self.callHackage "pandoc-types" "1.17.4.2" {};
    };
  };
in pkgs.runCommand "dummy" {
  buildInputs = [ haskellPackages.pandoc ];
} ""
