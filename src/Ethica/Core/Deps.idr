||| Dependency checking primitives.
||| Provides membership evidence and permission types for dependency-checked proofs.
module Ethica.Core.Deps

import Ethica.Core.Ref
import Ethica.Core.Meta

%default total

||| Membership evidence: proof that an element is in a list
public export
data Elem : a -> List a -> Type where
  Here  : Elem x (x :: xs)
  There : Elem x xs -> Elem x (x' :: xs)

%name Elem prf, prf1, prf2

||| Permission to use a dependency: alias for Elem
public export
Allowed : (uses : List ItemRef) -> ItemRef -> Type
Allowed uses r = Elem r uses

||| Type representing that an item has been proven
||| This is abstract; only the Registry can construct values of this type.
||| The statement type is stored at the value level, not the type level.
public export
data Proven : ItemRef -> Type where
  MkProven : (ref : ItemRef) -> (stmt : Type) -> (prf : stmt) -> Proven ref

||| Helper to extract the statement type from a Proven value
public export
getStatement : Proven ref -> Type
getStatement (MkProven _ stmt _) = stmt

||| Helper to extract the proof from a Proven value
public export
getProof : (p : Proven ref) -> getStatement p
getProof (MkProven _ _ prf) = prf

||| Unsafely unwrap a proof to the expected statement type.
||| This relies on the consistency of the Registry: the ItemRef in Proven
||| must correspond to the PropDecl provided.
||| Used to bridge the gap between ItemRef-based lookup and PropDecl-based usage.
public export
accessProof : (d : PropDecl) -> (p : Proven d.ref) -> statement d
accessProof d (MkProven _ _ prf) = believe_me prf

||| Context that provides access only to declared dependencies
||| A proof of proposition P must use `ctx.given r prf` where `prf : Allowed uses r`
||| to access previously proven items.
public export
record Ctx (uses : List ItemRef) where
  constructor MkCtx
  given : (r : ItemRef) -> Allowed uses r -> Proven r

%name Ctx ctx, ctx1, ctx2
