||| Book II Definitions.
module Ethica.Book2.Defs

import Ethica.Core.Ref
import Ethica.Core.Meta
import Ethica.Core.Logic
import Ethica.Book1.Props

%default total

||| Definition 1: By body I mean a mode which expresses in a certain determinate manner the essence of God, in so far as he is considered as an extended thing.
public export
def1 : PropDecl
def1 = MkPropDecl
  (MkItemRef Book2 Def 1)
  (() -> Mode) -- Body is a Mode
  []
  ["note-b2-d1"]

||| Definition 2: I say that to the essence of any thing belongs that, which being given, the thing is necessarily given also, and which being removed, the thing is necessarily removed also; or that without which the thing, and which itself without the thing, can neither be nor be conceived.
public export
def2 : PropDecl
def2 = MkPropDecl
  (MkItemRef Book2 Def 2)
  (Forall Type (\t => Type)) -- Abstract definition of essence relation
  []
  ["note-b2-d2"]

||| Definition 3: By idea, I mean the mental conception which is formed by the mind as a thinking thing.
public export
def3 : PropDecl
def3 = MkPropDecl
  (MkItemRef Book2 Def 3)
  (() -> Idea) -- Idea is a type
  []
  ["note-b2-d3"]

||| Definition 4: By an adequate idea, I mean an idea which, in so far as it is considered in itself, without relation to the object, has all the properties or intrinsic marks of a true idea.
public export
def4 : PropDecl
def4 = MkPropDecl
  (MkItemRef Book2 Def 4)
  (Forall Idea (\i => ())) -- Predicate "Adequate" on Idea
  []
  ["note-b2-d4"]

||| Definition 5: Duration is the indefinite continuance of existing.
public export
def5 : PropDecl
def5 = MkPropDecl
  (MkItemRef Book2 Def 5)
  (() -> Type) -- Duration as a type
  []
  ["note-b2-d5"]

||| Definition 6: Reality and perfection I use as synonymous terms.
public export
def6 : PropDecl
def6 = MkPropDecl
  (MkItemRef Book2 Def 6)
  (() -> ()) -- Conceptual identity
  []
  ["note-b2-d6"]

||| Definition 7: By particular things, I mean things which are finite and have a conditioned existence...
public export
def7 : PropDecl
def7 = MkPropDecl
  (MkItemRef Book2 Def 7)
  (Forall Type (\t => Finite t)) -- Particular things are finite
  []
  ["note-b2-d7"]

||| All Book II definitions
public export
allBook2Defs : List PropDecl
allBook2Defs = [def1, def2, def3, def4, def5, def6, def7]
