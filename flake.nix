{
  description = "überlay: a collection of overlays by lboklin";

  inputs = {
    zbalermorna.url = "github:lboklin/zbalermorna";
    tersmu.url = "gitlab:zugz/tersmu";
    ogblobs.url = "github:lboklin/noto-emoji-ogblobs";
  };

  outputs = { self, nixpkgs, ogblobs, tersmu, zbalermorna }: {
    overlay = final: prev: {
      inherit ogblobs;
      inherit (tersmu.packages.x86_64-linux) pappy tersmu;
    } // zbalermorna.overlay final prev;
  };
}
