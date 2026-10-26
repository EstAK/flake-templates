{
  description = "A flake to compile the kernel";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }:
    let
      supportedSystems = [
        "aarch64-darwin"
        "aarch64-linux"
        "x86_64-darwin"
        "x86_64-linux"
      ];
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
    in
    {
      devShells = forAllSystems (system:
        let
          pkgs = import nixpkgs {
            inherit system;
            config = { };
          };

          # Cross-toolchain package set targeting aarch64 Linux
          pkgsCrossAarch64 = pkgs.pkgsCross.aarch64-multiplatform;

          hostBuildTools = with pkgs; [
            bc
            bison
            flex
            openssl
            elfutils
            libelf
            pkg-config
            ncurses
            gnumake
            perl
            python3
            kmod
            pahole
            zstd
            zlib
          ];
        in
        {
          default = pkgs.mkShell {
            nativeBuildInputs = hostBuildTools ++ [
              # Native host compiler
              pkgs.buildPackages.gcc

              # Target aarch64 cross-compiler (runs on host, targets aarch64)
              pkgsCrossAarch64.buildPackages.gcc
            ];

            shellHook = ''
              export CONFIG_LOCALVERSION="-v8-final_kernel_mtedf"
              export KERNEL=kernel_2712
              export ARCH=arm64
              export CROSS_COMPILE=aarch64-unknown-linux-gnu-
            '';
          };
        }
      );
    };
}
