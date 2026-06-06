{
  description = "a flake for a development shell with zig";
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
        in
        {
          default = pkgs.mkShell {
            packages = [
              pkgs.zig
              pkgs.zls
            ];
          };
        }
      );
    };
}
