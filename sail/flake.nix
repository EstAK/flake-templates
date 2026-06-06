{
  description = "Minimal OCaml dev shell";

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
            shellHook = ''
              export SAIL_DIR=${pkgs.ocamlPackages.sail}/share/sail
            '';
            buildInputs =
              with pkgs;
              [
                pkgs.z3
                pkgs.zlib
              ]
              ++ (with pkgs.ocamlPackages; [
                ocaml
                ocamlformat
                ocaml-lsp

                opam
                dune

                sail
              ]);
          };
        }
      );

    };
}
