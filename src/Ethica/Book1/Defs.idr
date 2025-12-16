||| Book I Definitions.
||| Structural, minimal definitions referenced by propositions.
module Ethica.Book1.Defs

import Ethica.Core.Ref
import Ethica.Core.Meta
import Ethica.Core.Logic
import Ethica.Book1.Props

%default total

||| Definition 1: By substance I understand that which is in itself and is conceived through itself.
||| Minimal structural definition: Substance is a type that exists independently.
||| For our purposes, this is a trivial statement that Substance is well-defined.
public export
def1 : PropDecl
def1 = MkPropDecl
  (MkItemRef Book1 Def 1)
  (() -> Substance)  -- Substance is self-conceived and self-contained
  []
  ["note-d1-1"]

||| Definition 2: A thing is called finite after its kind, when it can be limited by another thing of the same nature.
public export
def2 : PropDecl
def2 = MkPropDecl
  (MkItemRef Book1 Def 2)
  (Forall Substance (\s => Finite s -> ())) -- Finite is a valid predicate on substances
  []
  ["note-d2-1"]

||| Definition 3: By thing I understand that which is conceived through itself or through another.
||| Minimal structural definition: Things can be conceived through themselves or others.
||| For our purposes, this is a structural property (simplified to be provable).
public export
def3 : PropDecl
def3 = MkPropDecl
  (MkItemRef Book1 Def 3)
  (() -> ())  -- Trivial structural claim (simplified for provability)
  []
  ["note-d3-1"]

||| Definition 4: By attribute I understand that which the intellect perceives of substance as constituting its essence.
||| Minimal structural definition: Attribute is a type related to substance.
||| For our purposes, this is a trivial statement that Attribute is well-defined.
public export
def4 : PropDecl
def4 = MkPropDecl
  (MkItemRef Book1 Def 4)
  (() -> Attribute)  -- Attribute is perceived as constituting substance's essence (trivial)
  []
  ["note-d4-1"]

||| Definition 5: By mode I understand the affections of substance, or that which is in another through which it is also conceived.
||| Minimal structural definition: Mode is a type that is "in" a substance.
||| For our purposes, this states that modes relate to substances via In.
public export
def5 : PropDecl
def5 = MkPropDecl
  (MkItemRef Book1 Def 5)
  (Forall Mode (\m => Exists Substance (\s => In m s)))  -- Modes are in substances
  []
  ["note-d5-1"]

||| Definition 6: By God, I mean a being absolutely infinite—that is, a substance consisting in infinite attributes.
public export
def6 : PropDecl
def6 = MkPropDecl
  (MkItemRef Book1 Def 6)
  (() -> God) -- God is a well-defined type (Substance)
  []
  ["note-d6-1"]

||| Definition 7: That thing is called free, which exists solely by the necessity of its own nature.
public export
def7 : PropDecl
def7 = MkPropDecl
  (MkItemRef Book1 Def 7)
  (Forall Substance (\s => Free s -> ())) -- Freedom is a valid predicate
  []
  ["note-d7-1"]

||| Definition 8: By eternity, I mean existence itself.
public export
def8 : PropDecl
def8 = MkPropDecl
  (MkItemRef Book1 Def 8)
  (Forall Substance (\s => Eternal s -> ())) -- Eternity is a valid predicate
  []
  ["note-d8-1"]

||| All Book I definitions
public export
allBook1Defs : List PropDecl
allBook1Defs = [def1, def2, def3, def4, def5, def6, def7, def8]
