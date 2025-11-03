{
  description = "Develop Elixir on Nix";

  inputs = {
    nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/0.1.886100.tar.gz";
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
              beamMinimal27Packages.elixir-ls
              tmux
            ];

            shellHook = '''';
          };
        }
      );
    };
}
