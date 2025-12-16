||| Item references: identifiers for definitions, axioms, propositions, lemmas.
module Ethica.Core.Ref

import Decidable.Equality

%default total

||| Book identifier
public export
data Book : Type where
  Book1 : Book
  Book2 : Book

public export
Eq Book where
  Book1 == Book1 = True
  Book2 == Book2 = True
  _ == _ = False

public export
Show Book where
  show Book1 = "I"
  show Book2 = "II"

||| Kind of item
public export
data ItemKind : Type where
  Def   : ItemKind  -- Definition
  Ax    : ItemKind  -- Axiom
  Prop  : ItemKind  -- Proposition
  Lemma : ItemKind  -- Lemma

public export
Eq ItemKind where
  Def == Def = True
  Ax == Ax = True
  Prop == Prop = True
  Lemma == Lemma = True
  _ == _ = False

public export
DecEq Book where
  decEq Book1 Book1 = Yes Refl
  decEq Book2 Book2 = Yes Refl
  decEq Book1 Book2 = No (\eq => case eq of Refl impossible)
  decEq Book2 Book1 = No (\eq => case eq of Refl impossible)

public export
DecEq ItemKind where
  decEq Def Def = Yes Refl
  decEq Ax Ax = Yes Refl
  decEq Prop Prop = Yes Refl
  decEq Lemma Lemma = Yes Refl
  decEq Def Ax = No (\eq => case eq of Refl impossible)
  decEq Def Prop = No (\eq => case eq of Refl impossible)
  decEq Def Lemma = No (\eq => case eq of Refl impossible)
  decEq Ax Def = No (\eq => case eq of Refl impossible)
  decEq Ax Prop = No (\eq => case eq of Refl impossible)
  decEq Ax Lemma = No (\eq => case eq of Refl impossible)
  decEq Prop Def = No (\eq => case eq of Refl impossible)
  decEq Prop Ax = No (\eq => case eq of Refl impossible)
  decEq Prop Lemma = No (\eq => case eq of Refl impossible)
  decEq Lemma Def = No (\eq => case eq of Refl impossible)
  decEq Lemma Ax = No (\eq => case eq of Refl impossible)
  decEq Lemma Prop = No (\eq => case eq of Refl impossible)

||| Reference to an item in the Ethics
public export
record ItemRef where
  constructor MkItemRef
  book   : Book
  kind   : ItemKind
  number : Nat

%name ItemRef ref, ref1, ref2

public export
DecEq ItemRef where
  decEq (MkItemRef b1 k1 n1) (MkItemRef b2 k2 n2) = 
    case decEq b1 b2 of
      No contra => No (\eq => case eq of Refl => contra Refl)
      Yes Refl => case decEq k1 k2 of
                    No contra => No (\eq => case eq of Refl => contra Refl)
                    Yes Refl => case decEq n1 n2 of
                                  No contra => No (\eq => case eq of Refl => contra Refl)
                                  Yes Refl => Yes Refl

||| Equality for ItemRef
public export
Eq ItemRef where
  (==) (MkItemRef b1 k1 n1) (MkItemRef b2 k2 n2) = 
    case b1 == b2 of
      False => False
      True  => case k1 == k2 of
                 False => False
                 True  => n1 == n2

||| Show instance for ItemRef
public export
Show ItemRef where
  show (MkItemRef Book1 Def n)   = "I D" ++ show n
  show (MkItemRef Book1 Ax n)    = "I A" ++ show n
  show (MkItemRef Book1 Prop n)  = "I P" ++ show n
  show (MkItemRef Book1 Lemma n) = "I L" ++ show n
  show (MkItemRef Book2 Def n)   = "II D" ++ show n
  show (MkItemRef Book2 Ax n)    = "II A" ++ show n
  show (MkItemRef Book2 Prop n)  = "II P" ++ show n
  show (MkItemRef Book2 Lemma n) = "II L" ++ show n

