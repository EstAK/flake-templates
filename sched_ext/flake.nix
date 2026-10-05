{
  description = "a flake for a development shell with rust";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
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

          bpfPackages = with pkgs; [
            bpftools
            libbpf
            linuxHeaders
          ];

          llvmPkgs = pkgs.llvmPackages_23;
          llvmStuff = with llvmPkgs; [
            clang-tools
            clang
            libclang
            llvm
          ];
        in
        {
          default = pkgs.mkShell {
            hardeningDisable = [ "all" ];
            packages = [
              pkgs.rustc
              pkgs.cargo
              pkgs.bear

              pkgs.rustfmt
              pkgs.rust-analyzer
              pkgs.tmux

            ];

            nativeBuildInputs = [
              pkgs.pkg-config
              pkgs.zlib
              pkgs.elfutils
            ]
            ++ bpfPackages
            ++ llvmStuff;
            LIBCLANG_PATH = "${llvmPkgs.libclang.lib}/lib";
          };
        }
      );
    };
}
