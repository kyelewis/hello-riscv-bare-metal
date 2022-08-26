{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/007ccf2f";
  };
  outputs = { self, nixpkgs }: 
  let 
    pkgs = nixpkgs.legacyPackages.x86_64-linux;
    in with pkgs; {
      devShells.x86_64-linux.default = pkgsCross.riscv64-embedded.mkShell {
      #devShells.x86_64-linux.default = pkgsCross.riscv64.mkShell {
        buildInputs = [ qemu dtc ];
      };
    };
}
    
