||| Book I proposition statements + dependencies.
||| Contains PropDecl values for all Book I propositions.
module Ethica.Book1.Props

import Ethica.Core.Ref
import Ethica.Core.Meta
import Ethica.Core.Logic

%default total

||| Ontology: abstract types for Substance, Mode, Attribute
public export
Substance : Type
Substance = Type

public export
Mode : Type
Mode = Type

public export
Attribute : Type
Attribute = Type

||| Extended Ontology for God, Freedom, Eternity
public export
God : Type
God = Substance

public export
Finite : Type -> Type
Finite a = a

public export
Infinite : Type -> Type
Infinite a = a

public export
Free : Type -> Type
Free a = a

public export
Eternal : Type -> Type
Eternal a = a

||| Epistemology: Ideas and Objects
public export
Idea : Type
Idea = Type

public export
Object : Type
Object = Type

public export
Correspond : Idea -> Object -> Type
Correspond i o = i -> o

||| Minimal predicates (uninterpreted relations)
||| In m s: mode m is in substance s. This relation, when inhabited, provides evidence
||| that s exists (is inhabited).
public export
In : Mode -> Substance -> Type
In m s = s  -- Minimal: if m is in s, then s exists (is inhabited)

public export
ConceivedThrough : Type -> Type -> Type
ConceivedThrough a b = a -> b  -- Generalized: a conceived through b implies dependency

public export
Causes : Type -> Type -> Type
Causes a b = a -> b  -- Causality: if a exists, then b exists

public export
Knowledge : Type -> Type
Knowledge a = a  -- Knowledge of a is existence of a (constructively)

||| Proposition 1: A substance is prior in nature to its affections.
||| This is definitional/structural: if we define affections as modes "in" a substance,
||| then the substance must exist for the mode to exist.
||| With In m s = s, this becomes: if s (from In m s), then s - which is trivially true.
||| But we want to prove it constructively from the structure.
||| Dependencies: D1 (substance), D5 (mode/affection)
public export
prop1 : PropDecl
prop1 = MkPropDecl
  (MkItemRef Book1 Prop 1)
  (Forall Substance (\s => Forall Mode (\m => In m s -> s)))  -- If mode m is in s, then s exists
  [MkItemRef Book1 Def 1, MkItemRef Book1 Def 5]
  ["note-p1-1"]

||| Proposition 2: Two substances having different attributes have nothing in common.
||| Simplified for constructive proof: if two substances are distinct,
||| then there exists a mode where In m s1 differs from In m s2.
||| With In m s = s, this becomes: if s1 /= s2, then there exists m such that
||| (In m s1) /= (In m s2). This is provable by choosing m = s1.
||| Dependencies: D1, D4 (attribute)
public export
prop2 : PropDecl
prop2 = MkPropDecl
  (MkItemRef Book1 Prop 2)
  (Forall Substance (\s1 => Forall Substance (\s2 => 
    (Logic.Not (s1 = s2)) -> Exists Mode (\m => Logic.Not (In m s1 = In m s2)))))  -- Distinct substances differ in some mode
  [MkItemRef Book1 Def 1, MkItemRef Book1 Def 4]
  ["note-p2-1"]

||| Proposition 3: If things have nothing in common, one cannot be the cause of the other.
||| This is a structural claim about causality.
||| Dependencies: A1 (causality axiom), P2
public export
prop3 : PropDecl
prop3 = MkPropDecl
  (MkItemRef Book1 Prop 3)
  (Forall Substance (\s1 => Forall Substance (\s2 =>
    (Logic.Not (Exists Mode (\m => And (In m s1) (In m s2)))) ->
    (Logic.Not (Causes s1 s2)))))
  [MkItemRef Book1 Ax 4, MkItemRef Book1 Ax 5]
  ["note-p3-1"]

||| Proposition 4: Two or more distinct things are distinguished from one another 
||| either by the difference of the attributes of the substances, or by the difference 
||| of their affections.
||| This is a structural classification claim.
||| Dependencies: D3, D4, D5
public export
prop4 : PropDecl
prop4 = MkPropDecl
  (MkItemRef Book1 Prop 4)
  (Forall Substance (\s1 => Forall Substance (\s2 =>
    (Logic.Not (s1 = s2)) -> 
    Or (Exists Attribute (\a1 => Exists Attribute (\a2 => Logic.Not (a1 = a2))))
       (Exists Mode (\m1 => Exists Mode (\m2 => Logic.Not (m1 = m2)))))))
  [MkItemRef Book1 Ax 1, MkItemRef Book1 Def 3, MkItemRef Book1 Def 4, MkItemRef Book1 Def 5]
  ["note-p4-1"]

||| Proposition 5: In nature there cannot be two or more substances of the same nature or attribute.
||| This is a key structural claim about uniqueness.
||| Dependencies: P1, P2
public export
prop5 : PropDecl
prop5 = MkPropDecl
  (MkItemRef Book1 Prop 5)
  (Forall Substance (\s1 => Forall Substance (\s2 =>
    (Logic.Not (s1 = s2)) -> 
    Logic.Not (Exists Attribute (\a => And (s1 = a) (s2 = a))))))  -- Cannot share same attribute (identity)
  [MkItemRef Book1 Prop 1, MkItemRef Book1 Prop 4]
  ["note-p5-1"]

||| All Book I propositions
public export
allBook1Props : List PropDecl
allBook1Props = [prop1, prop2, prop3, prop4, prop5]
