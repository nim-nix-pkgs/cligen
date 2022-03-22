{
  description = ''Infer & generate command-line interace/option/argument parser'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-cligen-v0_9_42.flake = false;
  inputs.src-cligen-v0_9_42.owner = "c-blake";
  inputs.src-cligen-v0_9_42.ref   = "v0_9_42";
  inputs.src-cligen-v0_9_42.repo  = "cligen.git";
  inputs.src-cligen-v0_9_42.type  = "github";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-cligen-v0_9_42"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-cligen-v0_9_42";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}