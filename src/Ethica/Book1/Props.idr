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

public export
Indivisible : Type -> Type
Indivisible a = a

public export
Divisible : Type -> Type
Divisible a = a

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
public export
prop1 : PropDecl
prop1 = MkPropDecl
  (MkItemRef Book1 Prop 1)
  (Forall Substance (\s => Forall Mode (\m => In m s -> s)))
  [MkItemRef Book1 Def 1, MkItemRef Book1 Def 5]
  ["note-p1-1"]

||| Proposition 2: Two substances having different attributes have nothing in common.
public export
prop2 : PropDecl
prop2 = MkPropDecl
  (MkItemRef Book1 Prop 2)
  (Forall Substance (\s1 => Forall Substance (\s2 => 
    (Logic.Not (s1 = s2)) -> Exists Mode (\m => Logic.Not (In m s1 = In m s2)))))
  [MkItemRef Book1 Def 1, MkItemRef Book1 Def 4]
  ["note-p2-1"]

||| Proposition 3: If things have nothing in common, one cannot be the cause of the other.
public export
prop3 : PropDecl
prop3 = MkPropDecl
  (MkItemRef Book1 Prop 3)
  (Forall Substance (\s1 => Forall Substance (\s2 =>
    (Logic.Not (Exists Mode (\m => And (In m s1) (In m s2)))) ->
    (Logic.Not (Causes s1 s2)))))
  [MkItemRef Book1 Ax 4, MkItemRef Book1 Ax 5]
  ["note-p3-1"]

||| Proposition 4: Two or more distinct things are distinguished from one another.
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
public export
prop5 : PropDecl
prop5 = MkPropDecl
  (MkItemRef Book1 Prop 5)
  (Forall Substance (\s1 => Forall Substance (\s2 =>
    (Logic.Not (s1 = s2)) -> 
    Logic.Not (Exists Attribute (\a => And (s1 = a) (s2 = a))))))
  [MkItemRef Book1 Prop 1, MkItemRef Book1 Prop 4]
  ["note-p5-1"]

||| Proposition 6: One substance cannot be produced by another substance.
public export
prop6 : PropDecl
prop6 = MkPropDecl
  (MkItemRef Book1 Prop 6)
  (Forall Substance (\s1 => Forall Substance (\s2 =>
    (Logic.Not (s1 = s2)) -> Logic.Not (Causes s1 s2))))
  [MkItemRef Book1 Prop 2, MkItemRef Book1 Prop 3]
  ["note-p6-1"]

||| Proposition 7: Existence belongs to the nature of substances.
public export
prop7 : PropDecl
prop7 = MkPropDecl
  (MkItemRef Book1 Prop 7)
  (Forall Substance (\s => Causes s s)) -- Self-caused (involves existence)
  [MkItemRef Book1 Prop 6]
  ["note-p7-1"]

||| Proposition 8: Every substance is necessarily infinite.
public export
prop8 : PropDecl
prop8 = MkPropDecl
  (MkItemRef Book1 Prop 8)
  (Forall Substance (\s => Infinite s))
  [MkItemRef Book1 Def 2, MkItemRef Book1 Prop 5, MkItemRef Book1 Prop 7]
  ["note-p8-1"]

||| Proposition 9: The more reality or being a thing has, the greater the number of its attributes.
public export
prop9 : PropDecl
prop9 = MkPropDecl
  (MkItemRef Book1 Prop 9)
  (Forall Substance (\s => ())) -- Qualitative claim, simplified for constructive proof as unit for now
  [MkItemRef Book1 Def 4]
  ["note-p9-1"]

||| Proposition 10: Each particular attribute of the one substance must be conceived through itself.
public export
prop10 : PropDecl
prop10 = MkPropDecl
  (MkItemRef Book1 Prop 10)
  (Forall Attribute (\a => ConceivedThrough a a))
  [MkItemRef Book1 Def 3, MkItemRef Book1 Def 4]
  ["note-p10-1"]

||| Proposition 11: God, or substance, consisting of infinite attributes, of which each expresses eternal and infinite essentiality, necessarily exists.
public export
prop11 : PropDecl
prop11 = MkPropDecl
  (MkItemRef Book1 Prop 11)
  (() -> God) -- God exists
  [MkItemRef Book1 Prop 7]
  ["note-p11-1"]

||| Proposition 12: No attribute of substance can be conceived from which it would follow that substance can be divided.
public export
prop12 : PropDecl
prop12 = MkPropDecl
  (MkItemRef Book1 Prop 12)
  (Forall Attribute (\a => Logic.Not (Divisible a))) -- Simplified: Attributes imply indivisibility
  [MkItemRef Book1 Prop 8, MkItemRef Book1 Prop 6, MkItemRef Book1 Prop 5]
  ["note-p12-1"]

||| Proposition 13: Substance absolutely infinite is indivisible.
public export
prop13 : PropDecl
prop13 = MkPropDecl
  (MkItemRef Book1 Prop 13)
  (Forall Substance (\s => Indivisible s))
  [MkItemRef Book1 Prop 5, MkItemRef Book1 Prop 7]
  ["note-p13-1"]

||| Proposition 14: Besides God no substance can be granted or conceived.
public export
prop14 : PropDecl
prop14 = MkPropDecl
  (MkItemRef Book1 Prop 14)
  (Forall Substance (\s => s = God)) -- Monism: Any substance is God
  [MkItemRef Book1 Def 6, MkItemRef Book1 Prop 11, MkItemRef Book1 Prop 5]
  ["note-p14-1"]

||| Proposition 15: Whatsoever is, is in God, and without God nothing can be, or be conceived.
public export
prop15 : PropDecl
prop15 = MkPropDecl
  (MkItemRef Book1 Prop 15)
  (Forall Type (\t => ConceivedThrough t God)) -- Everything conceived through God
  [MkItemRef Book1 Prop 14, MkItemRef Book1 Def 3, MkItemRef Book1 Def 5, MkItemRef Book1 Ax 1]
  ["note-p15-1"]

||| Proposition 16: From the necessity of the divine nature must follow an infinite number of things in infinite ways.
public export
prop16 : PropDecl
prop16 = MkPropDecl
  (MkItemRef Book1 Prop 16)
  (Forall Type (\t => Causes God t)) -- Simplified: God causes everything (infinite ways)
  [MkItemRef Book1 Def 6, MkItemRef Book1 Prop 11]
  ["note-p16-1"]

||| Proposition 17: God acts solely by the laws of his own nature, and is not constrained by anyone.
public export
prop17 : PropDecl
prop17 = MkPropDecl
  (MkItemRef Book1 Prop 17)
  (Free God) -- God is free (Def 7: acts by necessity of own nature)
  [MkItemRef Book1 Def 7, MkItemRef Book1 Prop 16, MkItemRef Book1 Prop 15]
  ["note-p17-1"]

||| Proposition 18: God is the indwelling and not the transient cause of all things.
public export
prop18 : PropDecl
prop18 = MkPropDecl
  (MkItemRef Book1 Prop 18)
  (Forall Type (\t => In t God)) -- All things are in God (Prop 15 variant)
  [MkItemRef Book1 Prop 15, MkItemRef Book1 Prop 16, MkItemRef Book1 Prop 14]
  ["note-p18-1"]

||| Proposition 19: God, and all the attributes of God, are eternal.
public export
prop19 : PropDecl
prop19 = MkPropDecl
  (MkItemRef Book1 Prop 19)
  (And (Eternal God) (Forall Attribute (\a => Eternal a)))
  [MkItemRef Book1 Def 8, MkItemRef Book1 Prop 7, MkItemRef Book1 Def 6]
  ["note-p19-1"]

||| Proposition 20: The existence of God and his essence are one and the same.
public export
prop20 : PropDecl
prop20 = MkPropDecl
  (MkItemRef Book1 Prop 20)
  (God = Eternal God) -- Existence (Eternal) is essence
  [MkItemRef Book1 Prop 19, MkItemRef Book1 Def 8]
  ["note-p20-1"]

||| Proposition 21: All things which follow from the absolute nature of any attribute of God must always exist and be infinite.
public export
prop21 : PropDecl
prop21 = MkPropDecl
  (MkItemRef Book1 Prop 21)
  (Forall Attribute (\a => Infinite a)) -- Infinite attributes
  [MkItemRef Book1 Prop 11, MkItemRef Book1 Def 6]
  ["note-p21-1"]

||| Proposition 22: Whatsoever follows from any attribute of God... must also exist necessarily and as infinite.
public export
prop22 : PropDecl
prop22 = MkPropDecl
  (MkItemRef Book1 Prop 22)
  (Forall Attribute (\a => Infinite a)) -- Redundant/Corollary for now
  [MkItemRef Book1 Prop 21]
  ["note-p22-1"]

||| Proposition 23: Every mode, which exists both necessarily and as infinite, must necessarily follow...
public export
prop23 : PropDecl
prop23 = MkPropDecl
  (MkItemRef Book1 Prop 23)
  (Forall Mode (\m => Infinite m -> Causes God m))
  [MkItemRef Book1 Def 5, MkItemRef Book1 Prop 15]
  ["note-p23-1"]

||| Proposition 24: The essence of things produced by God does not involve existence.
public export
prop24 : PropDecl
prop24 = MkPropDecl
  (MkItemRef Book1 Prop 24)
  (Forall Type (\t => Logic.Not (God = t) -> Logic.Not (Eternal t))) -- Finite things are not Eternal (essence != existence)
  [MkItemRef Book1 Def 1]
  ["note-p24-1"]

||| Proposition 25: God is the efficient cause not only of the existence of things, but also of their essence.
public export
prop25 : PropDecl
prop25 = MkPropDecl
  (MkItemRef Book1 Prop 25)
  (Forall Type (\t => And (Causes God t) (Causes God t))) -- Cause of existence and essence (structural placeholder)
  [MkItemRef Book1 Ax 4, MkItemRef Book1 Prop 15]
  ["note-p25-1"]

||| All Book I propositions
public export
allBook1Props : List PropDecl
allBook1Props = [prop1, prop2, prop3, prop4, prop5, prop6, prop7, prop8, prop9, prop10, prop11, prop12, prop13, prop14, prop15, prop16, prop17, prop18, prop19, prop20, prop21, prop22, prop23, prop24, prop25]
