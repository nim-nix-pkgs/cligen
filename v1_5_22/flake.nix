{
  description = ''Infer & generate command-line interface/option/argument parser'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-cligen-v1_5_22.flake = false;
  inputs.src-cligen-v1_5_22.owner = "c-blake";
  inputs.src-cligen-v1_5_22.ref   = "v1_5_22";
  inputs.src-cligen-v1_5_22.repo  = "cligen.git";
  inputs.src-cligen-v1_5_22.type  = "github";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-cligen-v1_5_22"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-cligen-v1_5_22";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}