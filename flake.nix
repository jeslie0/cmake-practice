{
  description = "A very basic C++ flake template, providing a devshell.";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        dependencies = with pkgs; [ cmake nlohmann_json ]; # Input the build dependencies here
        packageName = "CMakeTest";
      in
        {
          packages.${packageName} = pkgs.stdenv.mkDerivation {
            pname = packageName;
            version = "0.0.1";
            src = ./.;
            dontUseCmakeConfigure=true;
            nativeBuildInputs = dependencies;
            buildPhase = ''
                         cmake . -B build -DUSE_LOCAL_PACKAGES=true;
                         cd build;
                         make
                         '';
            installPhase = ''
                         mkdir -p $out/bin
                         cd src
                         cp TEST $out/bin
                         '';
          };

          defaultPackage = self.packages.${system}.${packageName};

          devShell = pkgs.mkShell {
            inputsFrom = [ self.packages.${system}.${packageName}
                         ];
            buildInputs = with pkgs;
              [ clang-tools
                cmake
              ];
          };
        }
    );
}
