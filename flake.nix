{
  description = "Develop Elixir on Nix";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs =
    { nixpkgs, ... }:
    let
      inherit (nixpkgs) lib;
      forAllSystems = lib.genAttrs lib.systems.flakeExposed;
    in
    {
      devShells = forAllSystems (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
          elixir = pkgs.beam.packages.erlang.elixir;
        in
        {
          default = pkgs.mkShell {
            packages = with pkgs; [
              elixir
            ];

            shellHook = '''';
          };
        }
      );
    };
}
