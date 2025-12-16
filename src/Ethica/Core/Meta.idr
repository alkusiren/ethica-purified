||| Proposition metadata: statement + declared dependencies + optional note refs.
||| This module defines the structure for declaring propositions and their dependencies.
module Ethica.Core.Meta

import Ethica.Core.Ref

%default total

||| Declaration of a proposition with its dependencies
public export
record PropDecl where
  constructor MkPropDecl
  ref      : ItemRef
  statement : Type
  uses     : List ItemRef  -- Declared dependencies (must be proven before this)
  noteIds  : List String   -- IDs referencing Ethica.Meta.Notes; metadata only

%name PropDecl decl, decl1, decl2

