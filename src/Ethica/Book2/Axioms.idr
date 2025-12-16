||| Book II Axioms.
module Ethica.Book2.Axioms

import Ethica.Core.Ref
import Ethica.Core.Meta
import Ethica.Core.Logic
import Ethica.Book1.Props
import Ethica.Book2.Defs

%default total

||| Axiom 1: The essence of man does not involve necessary existence, that is, it may as well happen that this or that man should exist, as that he should not exist.
public export
ax1 : PropDecl
ax1 = MkPropDecl
  (MkItemRef Book2 Ax 1)
  (Forall Type (\man => Logic.Not (Eternal man))) -- Man is not eternal/necessary in essence
  []
  ["note-b2-a1"]

||| Axiom 2: Man thinks.
public export
ax2 : PropDecl
ax2 = MkPropDecl
  (MkItemRef Book2 Ax 2)
  (() -> ()) -- Existence of thought in man
  []
  ["note-b2-a2"]

||| Axiom 3: Modes of thinking, such as love, desire, or any other of the passions, do not take place, unless there be in the same individual an idea of the thing loved, desired, &c. But the idea can exist without the presence of any other mode of thinking.
public export
ax3 : PropDecl
ax3 = MkPropDecl
  (MkItemRef Book2 Ax 3)
  (Forall Idea (\i => ())) -- Dependency of affect on idea
  []
  ["note-b2-a3"]

||| Axiom 4: We perceive that a certain body is affected in many ways.
public export
ax4 : PropDecl
ax4 = MkPropDecl
  (MkItemRef Book2 Ax 4)
  (() -> ()) -- Perception of body affection
  []
  ["note-b2-a4"]

||| Axiom 5: We feel and perceive no other individual things but bodies and modes of thought.
public export
ax5 : PropDecl
ax5 = MkPropDecl
  (MkItemRef Book2 Ax 5)
  (() -> ()) -- Limitation of perception
  []
  ["note-b2-a5"]

||| All Book II axioms
public export
allBook2Axioms : List PropDecl
allBook2Axioms = [ax1, ax2, ax3, ax4, ax5]
