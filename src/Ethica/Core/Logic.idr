||| Constructive logic helpers only.
||| No classical logic, no excluded middle, no double negation elimination.
module Ethica.Core.Logic

%default total

||| Constructive implication
public export
Implies : Type -> Type -> Type
Implies a b = a -> b

||| Constructive conjunction
public export
And : Type -> Type -> Type
And a b = (a, b)

||| Constructive disjunction
public export
data Or : Type -> Type -> Type where
  Left  : {P, Q : Type} -> P -> Or P Q
  Right : {P, Q : Type} -> Q -> Or P Q

||| Constructive negation (as implication to Void)
public export
Not : Type -> Type
Not a = a -> Void

||| Constructive universal quantification
public export
Forall : (a : Type) -> (a -> Type) -> Type
Forall a f = (x : a) -> f x

||| Constructive existential quantification
public export
data Exists : (a : Type) -> (a -> Type) -> Type where
  Evidence : {a : Type} -> {P : a -> Type} -> (x : a) -> P x -> Exists a P

||| Constructive bi-implication
public export
Iff : Type -> Type -> Type
Iff a b = And (Implies a b) (Implies b a)
