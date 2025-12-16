||| Coverage tracking for the formalization of Spinoza's Ethics.
||| Tracks declared vs. total items, and proven vs. declared items.
module Ethica.Core.Coverage

import Ethica.Core.Ref
import Ethica.Core.Meta
import Ethica.Core.Registry
import Data.List

%default total

||| Book statistics: total counts for each book
public export
record BookStats where
  constructor MkBookStats
  propositions : Nat
  definitions  : Nat
  axioms        : Nat

||| Full scope of Spinoza's Ethics
public export
fullScope : Book -> BookStats
fullScope Book1 = MkBookStats 36 8 7

||| Total counts across all books
public export
totalPropositions : Nat
totalPropositions = 259

public export
totalDefinitions : Nat
totalDefinitions = 25

public export
totalAxioms : Nat
totalAxioms = 15

||| Coverage statistics for a single book
public export
record BookCoverage where
  constructor MkBookCoverage
  book            : Book
  propsDeclared   : Nat
  propsProven     : Nat
  defsDeclared    : Nat
  defsProven      : Nat
  axiomsDeclared  : Nat
  axiomsProven    : Nat

||| Overall coverage statistics
public export
record OverallCoverage where
  constructor MkOverallCoverage
  totalPropsDeclared  : Nat
  totalPropsProven    : Nat
  totalDefsDeclared   : Nat
  totalDefsProven     : Nat
  totalAxiomsDeclared : Nat
  totalAxiomsProven   : Nat

||| Count items of a specific kind and book in a list of PropDecl
countByKindAndBook : Book -> ItemKind -> List PropDecl -> Nat
countByKindAndBook book kind decls = 
  length (filter (\d => if book == d.ref.book then kind == d.ref.kind else False) decls)

||| Count proven items of a specific kind and book in a registry
countProvenByKindAndBook : Book -> ItemKind -> Registry -> Nat
countProvenByKindAndBook book kind reg = 
  length (filter (\e => if book == e.ref.book then kind == e.ref.kind else False) reg)

||| Calculate book coverage from declared items and registry
public export
calculateBookCoverage : (book : Book) -> 
                        (declared : List PropDecl) -> 
                        (registry : Registry) -> 
                        BookCoverage
calculateBookCoverage book declared registry =
  let stats = fullScope book
      propsDeclared = countByKindAndBook book Prop declared
      propsProven = countProvenByKindAndBook book Prop registry
      defsDeclared = countByKindAndBook book Def declared
      defsProven = countProvenByKindAndBook book Def registry
      axiomsDeclared = countByKindAndBook book Ax declared
      axiomsProven = countProvenByKindAndBook book Ax registry
  in MkBookCoverage book propsDeclared propsProven defsDeclared defsProven axiomsDeclared axiomsProven

||| Count items of a specific kind across all books
countByKind : ItemKind -> List PropDecl -> Nat
countByKind kind decls = length (filter (\d => kind == d.ref.kind) decls)

||| Count proven items of a specific kind across all books
countProvenByKind : ItemKind -> Registry -> Nat
countProvenByKind kind reg = length (filter (\e => kind == e.ref.kind) reg)

||| Calculate overall coverage from all declared items and registry
public export
calculateOverallCoverage : (allDeclared : List PropDecl) -> 
                           (registry : Registry) -> 
                           OverallCoverage
calculateOverallCoverage allDeclared registry =
  let propsDeclared = countByKind Prop allDeclared
      propsProven = countProvenByKind Prop registry
      defsDeclared = countByKind Def allDeclared
      defsProven = countProvenByKind Def registry
      axiomsDeclared = countByKind Ax allDeclared
      axiomsProven = countProvenByKind Ax registry
  in MkOverallCoverage propsDeclared propsProven defsDeclared defsProven axiomsDeclared axiomsProven

||| Show instance for BookCoverage
public export
Show BookCoverage where
  show (MkBookCoverage book propsDecl propsProv defsDecl defsProv axiomsDecl axiomsProv) =
    let stats = fullScope book
    in "Book " ++ show book ++ ":\n" ++
       "  Propositions: " ++ show propsDecl ++ "/" ++ show stats.propositions ++ " declared, " ++ 
                            show propsProv ++ "/" ++ show propsDecl ++ " proven\n" ++
       "  Definitions:  " ++ show defsDecl ++ "/" ++ show stats.definitions ++ " declared, " ++ 
                            show defsProv ++ "/" ++ show defsDecl ++ " proven\n" ++
       "  Axioms:       " ++ show axiomsDecl ++ "/" ++ show stats.axioms ++ " declared, " ++ 
                            show axiomsProv ++ "/" ++ show axiomsDecl ++ " proven"

||| Show instance for OverallCoverage
public export
Show OverallCoverage where
  show (MkOverallCoverage propsDecl propsProv defsDecl defsProv axiomsDecl axiomsProv) =
    "Overall Coverage:\n" ++
    "  Propositions: " ++ show propsDecl ++ "/" ++ show totalPropositions ++ " declared, " ++ 
                         show propsProv ++ "/" ++ show propsDecl ++ " proven\n" ++
    "  Definitions:  " ++ show defsDecl ++ "/" ++ show totalDefinitions ++ " declared, " ++ 
                         show defsProv ++ "/" ++ show defsDecl ++ " proven\n" ++
    "  Axioms:       " ++ show axiomsDecl ++ "/" ++ show totalAxioms ++ " declared, " ++ 
                         show axiomsProv ++ "/" ++ show axiomsDecl ++ " proven"
