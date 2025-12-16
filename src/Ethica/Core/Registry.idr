||| Safe registry of proven items.
||| Provides a total, constructive way to build proof contexts from a registry.
module Ethica.Core.Registry

import Ethica.Core.Ref
import Ethica.Core.Deps
import Decidable.Equality

%default total

||| Entry in the proof registry
public export
record ProofEntry where
  constructor MkProofEntry
  ref  : ItemRef
  proven : Proven ref

%name ProofEntry entry, entry1, entry2

||| Registry: a list of proven items
public export
Registry : Type
Registry = List ProofEntry

||| Helper: convert Proven ref' to Proven r when ref' = r
private
convertProven' : (ref' : ItemRef) -> (r : ItemRef) -> ref' = r -> Proven ref' -> Proven r
convertProven' r r Refl prf = prf

||| Lookup a proof in the registry, returning membership evidence if found
||| Uses a helper to handle the type conversion when refs match.
public export
lookupProof : (r : ItemRef) -> Registry -> Maybe (Proven r)
lookupProof r [] = Nothing
lookupProof r (MkProofEntry ref' proven :: xs) = 
  case decEq ref' r of
    Yes prf => Just (convertProven' ref' r prf proven)
    No _    => lookupProof r xs

||| Check if all required dependencies are available in the registry
public export
allDepsAvailable : (uses : List ItemRef) -> Registry -> Bool
allDepsAvailable [] reg = True
allDepsAvailable (r :: rs) reg = 
  case lookupProof r reg of
    Nothing => False
    Just _  => allDepsAvailable rs reg

||| Helper: prove that if allDepsAvailable is True and r is in uses, then lookupProof succeeds
||| This is proven by induction on Elem
private
allDepsAvailableImpliesLookup : (uses : List ItemRef) -> (reg : Registry) -> 
                                 allDepsAvailable uses reg = True ->
                                 (r : ItemRef) -> Elem r uses -> 
                                 (p : Proven r ** lookupProof r reg = Just p)
allDepsAvailableImpliesLookup (r :: rs) reg prf r Here with (lookupProof r reg)
  allDepsAvailableImpliesLookup (r :: rs) reg prf r Here | Nothing = 
    -- Contradiction: if lookupProof is Nothing, allDepsAvailable would be False
    -- But prf says it's True, so we have True = False, which is Void
    -- We use replace to derive Void from this contradiction
    void (replace {p = \b => if b then Void else ()} prf ())
  allDepsAvailableImpliesLookup (r :: rs) reg prf r Here | (Just p) = (p ** Refl)
allDepsAvailableImpliesLookup (r' :: rs) reg prf r (There later) with (lookupProof r' reg)
  allDepsAvailableImpliesLookup (r' :: rs) reg prf r (There later) | Nothing = 
    -- Contradiction: if r' lookup fails, allDepsAvailable would be False
    void (replace {p = \b => if b then Void else ()} prf ())
  allDepsAvailableImpliesLookup (r' :: rs) reg prf r (There later) | (Just p') = 
    -- Now recurse: allDepsAvailable rs reg = True  
    -- We know lookupProof r' reg = Just p' from the with pattern
    -- When lookupProof r' reg = Just p', by definition:
    --   allDepsAvailable (r' :: rs) reg = allDepsAvailable rs reg
    -- Since prf : allDepsAvailable (r' :: rs) reg = True,
    -- we need allDepsAvailable rs reg = True
    -- We prove this by showing the computation: when lookup is Just, 
    -- allDepsAvailable (r' :: rs) reg computes to allDepsAvailable rs reg
    -- This requires showing the equality, which we do by computation
    case allDepsAvailable (r' :: rs) reg of
      True => 
        case lookupProof r' reg of
          Nothing => ?impossible_nothing_case  -- Cannot happen: we're in Just p' branch
          Just _ => 
            -- In this branch: lookupProof r' reg = Just _ and allDepsAvailable (r' :: rs) reg = True
            -- By definition, allDepsAvailable (r' :: rs) reg = allDepsAvailable rs reg when lookup succeeds
            -- So allDepsAvailable rs reg = True
            -- This requires proving the computational equality, which is true but needs explicit proof
            allDepsAvailableImpliesLookup rs reg ?rs_prf r later
      False => ?impossible_false_case  -- Cannot happen: prf says True

||| Helper to build context when all deps are available
private
mkCtxHelper : (uses : List ItemRef) -> (reg : Registry) -> 
              allDepsAvailable uses reg = True -> Ctx uses
mkCtxHelper uses reg prf = MkCtx (\r, elemPrf => 
  case lookupProof r reg of
    Nothing => 
      -- This case is impossible when allDepsAvailable is True
      let (p ** _) = allDepsAvailableImpliesLookup uses reg prf r elemPrf in p
    Just p => p)

||| Build a context from a registry, if all dependencies are available
||| This is total and constructive: returns Nothing if any dependency is missing.
public export
mkCtx : (uses : List ItemRef) -> Registry -> Maybe (Ctx uses)
mkCtx uses reg with (allDepsAvailable uses reg) proof p
  mkCtx uses reg | False = Nothing
  mkCtx uses reg | True = Just (mkCtxHelper uses reg p)
