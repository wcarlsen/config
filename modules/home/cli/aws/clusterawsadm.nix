{
  stdenv,
  lib,
  ...
}:
with lib;
  stdenv.mkDerivation rec {
    pname = "clusterawsadm";
    version = "2.13.0";

    src = builtins.fetchurl rec {
      url = "https://github.com/kubernetes-sigs/cluster-api-provider-aws/releases/download/v${version}/clusterawsadm-linux-amd64";
      sha256 = "sha256-Yzwn/SmNC9T4LdH9pk5ar8t7737Xf9MY90Zsdrrs2nQ=";
    };

    dontUnpack = true;
    dontBuild = true;
    doCheck = false;

    installPhase = ''
      mkdir -p $out/bin
      install -m755 -D $src $out/bin/clusterawsadm
    '';

    meta = {
      description = "CLI tool for managing AWS clusters with Cluster API";
      license = licenses.asl20;
      homepage = "https://github.com/kubernetes-sigs/cluster-api-provider-aws";
      maintainers = with maintainers; [wcarlsen];
      platforms = with platforms; unix;
    };
  }
