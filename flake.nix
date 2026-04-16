{
  description = "Jupyter env";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs";

  outputs = { self, nixpkgs }: {
    devShells.x86_64-linux.default =
      let pkgs = import nixpkgs { system = "x86_64-linux"; };
      in pkgs.mkShell {
        packages = [
          (pkgs.python3.withPackages (ps: with ps; [
            notebook
            numpy
            pandas
            matplotlib
	    scikit-learn
	    seaborn
	    xgboost
          ]))
        ];
      };
  };
}
