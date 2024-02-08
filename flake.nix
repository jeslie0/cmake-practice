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
        packageName = with builtins; head (match "^.*PROJECT\\(([^\ ]+).*$" (readFile ./CMakeLists.txt));
        version' = with builtins; head (match "^.*PROJECT\\(${packageName}.*VERSION\ ([^\)]+).*$" (readFile ./CMakeLists.txt));

      in
        {
          packages.${packageName} = pkgs.stdenv.mkDerivation rec {
            pname = packageName;
            version = version';
            src = ./.;
            fmt = pkgs.fetchFromGitHub {
              owner = "fmtlib";
              repo = "fmt";
              rev = "64965bdc969deca4746022e6b9d0dcfc0037fa66";
              sha256 = "sha256-mWziw1Yf3I2vNckb64IMdsVWrbXAwucxgq1nwlbJ/IE=";
            };
            dontUseCmakeConfigure=true;
            nativeBuildInputs = dependencies;
            buildPhase = ''
                         cp -r ${fmt} ./lib/fmt;
                         cmake . -B build -DUSE_LOCAL_PACKAGES=true;
                         cd build;
                         make
                         '';
            installPhase = ''
                         mkdir -p $out/bin
                         cd src
                         cp ${packageName} $out/bin
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
