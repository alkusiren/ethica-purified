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

||| Axiom 2: That which cannot be conceived through anything else must be conceived through itself.
public export
ax2 : PropDecl
ax2 = MkPropDecl
  (MkItemRef Book1 Ax 2)
  (Forall Type (\t => Logic.Not (Exists Type (\other => And (Logic.Not (t = other)) (ConceivedThrough t other))) -> ConceivedThrough t t))
  []
  ["note-a2-1"]

||| Axiom 3: From a given definite cause an effect necessarily follows.
public export
ax3 : PropDecl
ax3 = MkPropDecl
  (MkItemRef Book1 Ax 3)
  (Forall Type (\c => Forall Type (\e => Causes c e -> e)))
  []
  ["note-a3-1"]

||| Axiom 4: The knowledge of an effect depends on and involves the knowledge of a cause.
public export
ax4 : PropDecl
ax4 = MkPropDecl
  (MkItemRef Book1 Ax 4)
  (Forall Type (\c => Forall Type (\e => Causes c e -> (Knowledge e -> Knowledge c))))
  []
  ["note-a4-1"]

||| Axiom 5: Things which have nothing in common cannot be understood, the one by means of the other.
public export
ax5 : PropDecl
ax5 = MkPropDecl
  (MkItemRef Book1 Ax 5)
  (Forall Substance (\a => Forall Substance (\b => 
    Logic.Not (Exists Mode (\common => And (In common a) (In common b))) -> 
    Logic.Not (ConceivedThrough a b))))
  []
  ["note-a5-1"]

||| Axiom 6: A true idea must correspond with its ideate or object.
public export
ax6 : PropDecl
ax6 = MkPropDecl
  (MkItemRef Book1 Ax 6)
  (Forall Idea (\i => Forall Object (\o => Correspond i o -> ())))
  []
  ["note-a6-1"]

||| Axiom 7: If a thing can be conceived as non-existing, its essence does not involve existence.
public export
ax7 : PropDecl
ax7 = MkPropDecl
  (MkItemRef Book1 Ax 7)
  (Forall Type (\t => Logic.Not (Eternal t) -> Logic.Not (God))) -- Simplified structural claim
  []
  ["note-a7-1"]

||| All Book I axioms
public export
allBook1Axioms : List PropDecl
allBook1Axioms = [ax1, ax2, ax3, ax4, ax5, ax6, ax7]
