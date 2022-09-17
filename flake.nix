{
  description = "Tools for the google cloud platform (customized components)";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, ... }@inputs:
  let
    sdk = inputs.nixpkgs.legacyPackages.x86_64-linux.google-cloud-sdk;
  in
  {
    defaultPackage = {
      x86_64-linux = sdk.withExtraComponents ([
          sdk.components.gke-gcloud-auth-plugin
      ]);
    };
  };
}
