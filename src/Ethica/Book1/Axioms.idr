||| Book I Axioms.
||| Structural axioms referenced by propositions.
module Ethica.Book1.Axioms

import Ethica.Core.Ref
import Ethica.Core.Meta
import Ethica.Core.Logic
import Ethica.Book1.Props

%default total

||| Axiom 1: Everything which exists is either in itself or in another.
||| Minimal structural axiom: everything is either self-contained or in another.
||| This is a fundamental structural claim about existence.
public export
ax1 : PropDecl
ax1 = MkPropDecl
  (MkItemRef Book1 Ax 1)
  (Forall Substance (\s => Or (s) (Exists Substance (\s' => Causes s' s))))  -- Everything is in itself or caused by another
  []
  ["note-a1-1"]

||| All Book I axioms
public export
allBook1Axioms : List PropDecl
allBook1Axioms = [ax1]

