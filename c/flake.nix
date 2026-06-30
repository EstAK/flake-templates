{
  description = "A C flake";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
  };

  outputs =
    {
      self,
      nixpkgs,
      ...
    }:
    let
      eachSystem = nixpkgs.lib.genAttrs [
        "aarch64-darwin"
        "aarch64-linux"
        "x86_64-darwin"
        "x86_64-linux"
      ];

    in
    {
      devShells = eachSystem (
        system:
        let
          pkgs = import nixpkgs {
            inherit system;
            config = { };
          };
        in
        {
          default = pkgs.mkShell {
            buildInputs = [
              pkgs.llvmPackages_22.clang-tools

              pkgs.gcc
              pkgs.bear
              pkgs.gnumake
              pkgs.pkg-config

              pkgs.gdb
            ];
          };
        }
      );
    };
}
