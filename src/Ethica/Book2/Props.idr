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

||| Proposition 11: The first element, which constitutes the actual being of the human mind, is the idea of some particular thing actually existing.
public export
prop11 : PropDecl
prop11 = MkPropDecl
  (MkItemRef Book2 Prop 11)
  (Forall Type (\mind => Exists Type (\obj => Correspond mind obj))) -- Mind is idea of object
  [MkItemRef Book2 Def 3, MkItemRef Book2 Ax 3]
  ["note-b2-p11"]

||| Proposition 12: Whatsoever comes to pass in the object of the idea, which constitutes the human mind, must be perceived by the human mind.
public export
prop12 : PropDecl
prop12 = MkPropDecl
  (MkItemRef Book2 Prop 12)
  (Forall Type (\obj => Forall Type (\evt => In evt obj -> Knowledge evt))) -- Mind perceives body events
  [MkItemRef Book2 Prop 9, MkItemRef Book2 Prop 11]
  ["note-b2-p12"]

||| Proposition 13: The object of the idea constituting the human mind is the body, in other words a certain mode of extension which actually exists, and nothing else.
public export
prop13 : PropDecl
prop13 = MkPropDecl
  (MkItemRef Book2 Prop 13)
  (() -> ()) -- Mind's object is Body
  [MkItemRef Book2 Prop 9, MkItemRef Book2 Prop 11, MkItemRef Book2 Ax 4]
  ["note-b2-p13"]

||| Proposition 14: The human mind is capable of perceiving a great number of things, and is so in proportion as its body is capable of receiving a great number of impressions.
public export
prop14 : PropDecl
prop14 = MkPropDecl
  (MkItemRef Book2 Prop 14)
  (() -> ()) -- Mind capacity ~ Body capacity
  [MkItemRef Book2 Prop 12] -- Note: P12 dependency
  ["note-b2-p14"]

||| Proposition 15: The idea, which constitutes the actual being of the human mind, is not simple, but compounded of a great number of ideas.
public export
prop15 : PropDecl
prop15 = MkPropDecl
  (MkItemRef Book2 Prop 15)
  (() -> ()) -- Mind is complex
  [MkItemRef Book2 Prop 13]
  ["note-b2-p15"]

||| Proposition 16: The idea of every mode, in which the human body is affected by external bodies, must involve the nature of the human body, and also the nature of the external body.
public export
prop16 : PropDecl
prop16 = MkPropDecl
  (MkItemRef Book2 Prop 16)
  (() -> ()) -- Perception involves body + external
  [MkItemRef Book1 Ax 4]
  ["note-b2-p16"]

||| Proposition 17: If the human body is affected in a manner which involves the nature of any external body, the human mind will regard the said external body as actually existing, or as present to itself, until the human body be affected in such a way, as to exclude the existence or the presence of the said external body.
public export
prop17 : PropDecl
prop17 = MkPropDecl
  (MkItemRef Book2 Prop 17)
  (() -> ()) -- Imagination/Presence
  [MkItemRef Book2 Prop 12, MkItemRef Book2 Prop 16]
  ["note-b2-p17"]

||| Proposition 18: If the human body has once been affected by two or more bodies at the same time, when the mind afterwards imagines any of them, it will straightway remember the others also.
public export
prop18 : PropDecl
prop18 = MkPropDecl
  (MkItemRef Book2 Prop 18)
  (() -> ()) -- Memory/Association
  [MkItemRef Book2 Prop 17]
  ["note-b2-p18"]

||| Proposition 19: The human mind has no knowledge of the body, and does not know it to exist, save through the ideas of the modifications whereby the body is affected.
public export
prop19 : PropDecl
prop19 = MkPropDecl
  (MkItemRef Book2 Prop 19)
  (() -> ()) -- Knowledge of body via affections
  [MkItemRef Book2 Prop 13, MkItemRef Book2 Prop 9, MkItemRef Book2 Prop 7]
  ["note-b2-p19"]

||| Proposition 20: The idea or knowledge of the human mind is also in God, following in God in the same manner, and being referred to God in the same manner, as the idea or knowledge of the human body.
public export
prop20 : PropDecl
prop20 = MkPropDecl
  (MkItemRef Book2 Prop 20)
  (() -> ()) -- Idea of Mind
  [MkItemRef Book2 Prop 1, MkItemRef Book2 Prop 3]
  ["note-b2-p20"]

||| Proposition 21: This idea of the mind is united to the mind in the same way as the mind is united to the body.
public export
prop21 : PropDecl
prop21 = MkPropDecl
  (MkItemRef Book2 Prop 21)
  (() -> ()) -- Idea of Mind union
  [MkItemRef Book2 Prop 12, MkItemRef Book2 Prop 13]
  ["note-b2-p21"]

||| Proposition 22: The human mind perceives not only the modifications of the body, but also the ideas of such modifications.
public export
prop22 : PropDecl
prop22 = MkPropDecl
  (MkItemRef Book2 Prop 22)
  (() -> ()) -- Perception of ideas of affections
  [MkItemRef Book2 Prop 20, MkItemRef Book2 Prop 12]
  ["note-b2-p22"]

||| Proposition 23: The mind does not know itself, except in so far as it perceives the ideas of the modifications of the body.
public export
prop23 : PropDecl
prop23 = MkPropDecl
  (MkItemRef Book2 Prop 23)
  (() -> ()) -- Self-knowledge limitation
  [MkItemRef Book2 Prop 20, MkItemRef Book2 Prop 19]
  ["note-b2-p23"]

||| Proposition 24: The human mind does not involve an adequate knowledge of the parts composing the human body.
public export
prop24 : PropDecl
prop24 = MkPropDecl
  (MkItemRef Book2 Prop 24)
  (() -> ()) -- Inadequate knowledge of body parts
  [MkItemRef Book2 Prop 3, MkItemRef Book2 Prop 9, MkItemRef Book2 Prop 13]
  ["note-b2-p24"]

||| Proposition 25: The idea of each modification of the human body does not involve an adequate knowledge of the external body.
public export
prop25 : PropDecl
prop25 = MkPropDecl
  (MkItemRef Book2 Prop 25)
  (() -> ()) -- Inadequate knowledge of external body
  [MkItemRef Book2 Prop 9, MkItemRef Book2 Prop 7]
  ["note-b2-p25"]

||| Proposition 26: The human mind does not perceive any external body as actually existing, except through the ideas of the modifications of its own body.
public export
prop26 : PropDecl
prop26 = MkPropDecl
  (MkItemRef Book2 Prop 26)
  (() -> ()) -- Perception via body only
  [MkItemRef Book2 Prop 7, MkItemRef Book2 Prop 16]
  ["note-b2-p26"]

||| Proposition 27: The idea of each modification of the human body does not involve an adequate knowledge of the human body itself.
public export
prop27 : PropDecl
prop27 = MkPropDecl
  (MkItemRef Book2 Prop 27)
  (() -> ()) -- Inadequate self-knowledge via affections
  [MkItemRef Book2 Prop 16]
  ["note-b2-p27"]

||| Proposition 28: The ideas of the modifications of the human body, in so far as they have reference only to the human mind, are not clear and distinct, but confused.
public export
prop28 : PropDecl
prop28 = MkPropDecl
  (MkItemRef Book2 Prop 28)
  (() -> ()) -- Confused ideas
  [MkItemRef Book2 Prop 16, MkItemRef Book2 Prop 24, MkItemRef Book2 Prop 25]
  ["note-b2-p28"]

||| Proposition 29: The idea of the idea of each modification of the human body does not involve an adequate knowledge of the human mind.
public export
prop29 : PropDecl
prop29 = MkPropDecl
  (MkItemRef Book2 Prop 29)
  (() -> ()) -- Inadequate knowledge of mind
  [MkItemRef Book2 Prop 27, MkItemRef Book2 Prop 13]
  ["note-b2-p29"]

||| Proposition 30: We can only have a very inadequate knowledge of the duration of our body.
public export
prop30 : PropDecl
prop30 = MkPropDecl
  (MkItemRef Book2 Prop 30)
  (() -> ()) -- Duration of body uncertain
  [MkItemRef Book2 Ax 1, MkItemRef Book1 Prop 21]
  ["note-b2-p30"]

||| Proposition 31: We can only have a very inadequate knowledge of the duration of particular things external to ourselves.
public export
prop31 : PropDecl
prop31 = MkPropDecl
  (MkItemRef Book2 Prop 31)
  (() -> ()) -- Duration of external things uncertain
  [MkItemRef Book2 Prop 30]
  ["note-b2-p31"]

||| Proposition 32: All ideas, in so far as they are referred to God, are true.
public export
prop32 : PropDecl
prop32 = MkPropDecl
  (MkItemRef Book2 Prop 32)
  (() -> ()) -- Ideas in God are true
  [MkItemRef Book2 Prop 7] -- Corollaries are part of the prop usually
  ["note-b2-p32"]

||| Proposition 33: There is nothing positive in ideas, which causes them to be called false.
public export
prop33 : PropDecl
prop33 = MkPropDecl
  (MkItemRef Book2 Prop 33)
  (() -> ()) -- Falsity is not positive
  [MkItemRef Book2 Prop 32, MkItemRef Book1 Prop 15]
  ["note-b2-p33"]

||| Proposition 34: Every idea, which in us is absolute or adequate and perfect, is true.
public export
prop34 : PropDecl
prop34 = MkPropDecl
  (MkItemRef Book2 Prop 34)
  (() -> ()) -- Adequate ideas are true
  [MkItemRef Book2 Prop 11, MkItemRef Book2 Prop 32]
  ["note-b2-p34"]

||| Proposition 35: Falsity consists in the privation of knowledge, which inadequate, fragmentary, or confused ideas involve.
public export
prop35 : PropDecl
prop35 = MkPropDecl
  (MkItemRef Book2 Prop 35)
  (() -> ()) -- Falsity is privation
  [MkItemRef Book2 Prop 33]
  ["note-b2-p35"]

||| Proposition 36: Inadequate and confused ideas follow by the same necessity, as adequate or clear and distinct ideas.
public export
prop36 : PropDecl
prop36 = MkPropDecl
  (MkItemRef Book2 Prop 36)
  (() -> ()) -- Necessity of inadequate ideas
  [MkItemRef Book1 Prop 15, MkItemRef Book2 Prop 32, MkItemRef Book2 Prop 7, MkItemRef Book2 Prop 24, MkItemRef Book2 Prop 28, MkItemRef Book2 Prop 6]
  ["note-b2-p36"]

||| Proposition 37: That which is common to all, and which is equally in a part and in the whole, does not constitute the essence of any particular thing.
public export
prop37 : PropDecl
prop37 = MkPropDecl
  (MkItemRef Book2 Prop 37)
  (() -> ()) -- Common notions vs essence
  [MkItemRef Book2 Def 2]
  ["note-b2-p37"]

||| Proposition 38: Those things, which are common to all, and which are equally in a part and in the whole, cannot be conceived except adequately.
public export
prop38 : PropDecl
prop38 = MkPropDecl
  (MkItemRef Book2 Prop 38)
  (() -> ()) -- Common notions are adequate
  [MkItemRef Book2 Prop 7, MkItemRef Book2 Prop 16, MkItemRef Book2 Prop 25, MkItemRef Book2 Prop 27, MkItemRef Book2 Prop 12, MkItemRef Book2 Prop 13, MkItemRef Book2 Prop 11]
  ["note-b2-p38"]

||| Proposition 39: That, which is common to and a property of the human body and such other bodies as are wont to affect the human body, and which is present equally in each part of either, or in the whole, will be represented by an adequate idea in the mind.
public export
prop39 : PropDecl
prop39 = MkPropDecl
  (MkItemRef Book2 Prop 39)
  (() -> ()) -- Adequate idea of common properties
  [MkItemRef Book2 Prop 7, MkItemRef Book2 Prop 16, MkItemRef Book2 Prop 13, MkItemRef Book2 Prop 11]
  ["note-b2-p39"]

||| Proposition 40: Whatsoever ideas in the mind follow from ideas which are therein adequate, are also themselves adequate.
public export
prop40 : PropDecl
prop40 = MkPropDecl
  (MkItemRef Book2 Prop 40)
  (() -> ()) -- Deduction from adequate is adequate
  [MkItemRef Book2 Prop 11]
  ["note-b2-p40"]

||| Proposition 41: Knowledge of the first kind is the only source of falsity, knowledge of the second and third kinds is necessarily true.
public export
prop41 : PropDecl
prop41 = MkPropDecl
  (MkItemRef Book2 Prop 41)
  (() -> ()) -- Kinds of knowledge and truth
  [MkItemRef Book2 Prop 35, MkItemRef Book2 Prop 34]
  ["note-b2-p41"]

||| Proposition 42: Knowledge of the second and third kinds, not knowledge of the first kind, teaches us to distinguish the true from the false.
public export
prop42 : PropDecl
prop42 = MkPropDecl
  (MkItemRef Book2 Prop 42)
  (() -> ()) -- Distinguishing truth
  [MkItemRef Book2 Prop 40]
  ["note-b2-p42"]

||| Proposition 43: He, who has a true idea, simultaneously knows that he has a true idea, and cannot doubt of the truth of the thing perceived.
public export
prop43 : PropDecl
prop43 = MkPropDecl
  (MkItemRef Book2 Prop 43)
  (() -> ()) -- Certainty of truth
  [MkItemRef Book2 Prop 11, MkItemRef Book2 Prop 20, MkItemRef Book2 Prop 34]
  ["note-b2-p43"]

||| Proposition 44: It is not in the nature of reason to regard things as contingent, but as necessary.
public export
prop44 : PropDecl
prop44 = MkPropDecl
  (MkItemRef Book2 Prop 44)
  (() -> ()) -- Reason perceives necessity
  [MkItemRef Book2 Prop 41, MkItemRef Book1 Prop 29]
  ["note-b2-p44"]

||| Proposition 45: Every idea of every body, or of every particular thing actually existing, necessarily involves the eternal and infinite essence of God.
public export
prop45 : PropDecl
prop45 = MkPropDecl
  (MkItemRef Book2 Prop 45)
  (() -> ()) -- Idea involves God's essence
  [MkItemRef Book2 Prop 8, MkItemRef Book1 Prop 15, MkItemRef Book2 Prop 6, MkItemRef Book1 Prop 6]
  ["note-b2-p45"]

||| Proposition 46: The knowledge of the eternal and infinite essence of God which every idea involves is adequate and perfect.
public export
prop46 : PropDecl
prop46 = MkPropDecl
  (MkItemRef Book2 Prop 46)
  (() -> ()) -- Knowledge of God is adequate
  [MkItemRef Book2 Prop 45, MkItemRef Book2 Prop 38]
  ["note-b2-p46"]

||| Proposition 47: The human mind has an adequate knowledge of the eternal and infinite essence of God.
public export
prop47 : PropDecl
prop47 = MkPropDecl
  (MkItemRef Book2 Prop 47)
  (() -> ()) -- Mind knows God
  [MkItemRef Book2 Prop 22, MkItemRef Book2 Prop 23, MkItemRef Book2 Prop 19, MkItemRef Book2 Prop 16, MkItemRef Book2 Prop 17, MkItemRef Book2 Prop 45, MkItemRef Book2 Prop 46]
  ["note-b2-p47"]

||| Proposition 48: In the mind there is no absolute or free will; but the mind is determined to wish this or that by a cause, which has also been determined by another cause, and this last by another cause, and so on to infinity.
public export
prop48 : PropDecl
prop48 = MkPropDecl
  (MkItemRef Book2 Prop 48)
  (() -> ()) -- Determinism of mind
  [MkItemRef Book2 Prop 11, MkItemRef Book1 Prop 28]
  ["note-b2-p48"]

||| Proposition 49: There is in the mind no volition or affirmation and negation, save that which an idea, inasmuch as it is an idea, involves.
public export
prop49 : PropDecl
prop49 = MkPropDecl
  (MkItemRef Book2 Prop 49)
  (() -> ()) -- Volition is idea
  [MkItemRef Book2 Ax 3]
  ["note-b2-p49"]

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
  , Ethica.Book2.Props.prop11
  , Ethica.Book2.Props.prop12
  , Ethica.Book2.Props.prop13
  , Ethica.Book2.Props.prop14
  , Ethica.Book2.Props.prop15
  , Ethica.Book2.Props.prop16
  , Ethica.Book2.Props.prop17
  , Ethica.Book2.Props.prop18
  , Ethica.Book2.Props.prop19
  , Ethica.Book2.Props.prop20
  , Ethica.Book2.Props.prop21
  , Ethica.Book2.Props.prop22
  , Ethica.Book2.Props.prop23
  , Ethica.Book2.Props.prop24
  , Ethica.Book2.Props.prop25
  , Ethica.Book2.Props.prop26
  , Ethica.Book2.Props.prop27
  , Ethica.Book2.Props.prop28
  , Ethica.Book2.Props.prop29
  , Ethica.Book2.Props.prop30
  , Ethica.Book2.Props.prop31
  , Ethica.Book2.Props.prop32
  , Ethica.Book2.Props.prop33
  , Ethica.Book2.Props.prop34
  , Ethica.Book2.Props.prop35
  , Ethica.Book2.Props.prop36
  , Ethica.Book2.Props.prop37
  , Ethica.Book2.Props.prop38
  , Ethica.Book2.Props.prop39
  , Ethica.Book2.Props.prop40
  , Ethica.Book2.Props.prop41
  , Ethica.Book2.Props.prop42
  , Ethica.Book2.Props.prop43
  , Ethica.Book2.Props.prop44
  , Ethica.Book2.Props.prop45
  , Ethica.Book2.Props.prop46
  , Ethica.Book2.Props.prop47
  , Ethica.Book2.Props.prop48
  , Ethica.Book2.Props.prop49
  ]
