||| Book II Proposition statements.
module Ethica.Book2.Props

import Ethica.Core.Ref
import Ethica.Core.Meta
import Ethica.Core.Logic
import Ethica.Book1.Props
import Ethica.Book2.Defs
import Ethica.Book2.Axioms

%default total

||| Proposition 1: Thought is an attribute of God, or God is a thinking thing.
public export
prop1 : PropDecl
prop1 = MkPropDecl
  (MkItemRef Book2 Prop 1)
  (() -> Attribute) -- Thought is an attribute
  [MkItemRef Book1 Def 6] -- Relies on def of God
  ["note-b2-p1"]

||| Proposition 2: Extension is an attribute of God, or God is an extended thing.
public export
prop2 : PropDecl
prop2 = MkPropDecl
  (MkItemRef Book2 Prop 2)
  (() -> Attribute) -- Extension is an attribute
  [MkItemRef Book1 Def 6]
  ["note-b2-p2"]

||| Proposition 3: In God there is necessarily the idea not only of his essence, but also of all things which necessarily follow from his essence.
public export
prop3 : PropDecl
prop3 = MkPropDecl
  (MkItemRef Book2 Prop 3)
  (Forall Type (\t => Idea)) -- God has ideas of everything
  [MkItemRef Book2 Prop 1]
  ["note-b2-p3"]

||| Proposition 4: The idea of God, from which an infinite number of things follow in infinite ways, can only be one.
public export
prop4 : PropDecl
prop4 = MkPropDecl
  (MkItemRef Book2 Prop 4)
  (() -> ()) -- Uniqueness of God's idea
  [MkItemRef Book1 Prop 16]
  ["note-b2-p4"]

||| Proposition 5: The actual being of ideas owns God as its cause, only in so far as he is considered as a thinking thing, not in so far as he is explained by any other attribute...
public export
prop5 : PropDecl
prop5 = MkPropDecl
  (MkItemRef Book2 Prop 5)
  (Forall Idea (\i => Causes God i)) -- Simplified causality
  [MkItemRef Book2 Prop 3]
  ["note-b2-p5"]

||| Proposition 6: The modes of any given attribute are caused by God, in so far as he is considered through the attribute of which they are modes, and not in so far as he is considered through any other attribute.
public export
prop6 : PropDecl
prop6 = MkPropDecl
  (MkItemRef Book2 Prop 6)
  (Forall Mode (\m => Causes God m))
  [MkItemRef Book2 Prop 5]
  ["note-b2-p6"]

||| Proposition 7: The order and connection of ideas is the same as the order and connection of things.
public export
prop7 : PropDecl
prop7 = MkPropDecl
  (MkItemRef Book2 Prop 7)
  (Forall Idea (\i => Forall Object (\o => Correspond i o))) -- Parallelism
  [MkItemRef Book1 Ax 4]
  ["note-b2-p7"]

||| Proposition 8: The ideas of particular things, or of modes, that do not exist, must be comprehended in the infinite idea of God, in the same way as the formal essences of particular things or modes are contained in the attributes of God.
public export
prop8 : PropDecl
prop8 = MkPropDecl
  (MkItemRef Book2 Prop 8)
  (Forall Type (\t => Idea)) -- Ideas of non-existent things in God
  [MkItemRef Book2 Prop 5, MkItemRef Book2 Prop 7]
  ["note-b2-p8"]

||| Proposition 9: The idea of an individual thing actually existing is caused by God, not in so far as he is infinite, but in so far as he is considered as affected by another idea of a thing actually existing...
public export
prop9 : PropDecl
prop9 = MkPropDecl
  (MkItemRef Book2 Prop 9)
  (Forall Idea (\i => Causes God i)) -- Chain of finite causes
  [MkItemRef Book2 Prop 6, MkItemRef Book1 Prop 28]
  ["note-b2-p9"]

||| Proposition 10: The being of substance does not appertain to the essence of man—in other words, substance does not constitute the actual being of man.
public export
prop10 : PropDecl
prop10 = MkPropDecl
  (MkItemRef Book2 Prop 10)
  (Forall Type (\man => Logic.Not (Substance = man))) -- Man is not substance
  [MkItemRef Book1 Prop 8, MkItemRef Book1 Prop 5]
  ["note-b2-p10"]

||| All Book II propositions (partial list for initial setup)
public export
allBook2Props : List PropDecl
allBook2Props = 
  [ Ethica.Book2.Props.prop1
  , Ethica.Book2.Props.prop2
  , Ethica.Book2.Props.prop3
  , Ethica.Book2.Props.prop4
  , Ethica.Book2.Props.prop5
  , Ethica.Book2.Props.prop6
  , Ethica.Book2.Props.prop7
  , Ethica.Book2.Props.prop8
  , Ethica.Book2.Props.prop9
  , Ethica.Book2.Props.prop10
  ]
