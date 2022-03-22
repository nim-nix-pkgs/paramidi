{
  description = ''A library for making MIDI music'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-paramidi-master.flake = false;
  inputs.src-paramidi-master.owner = "paranim";
  inputs.src-paramidi-master.ref   = "master";
  inputs.src-paramidi-master.repo  = "paramidi";
  inputs.src-paramidi-master.type  = "github";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-paramidi-master"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-paramidi-master";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}