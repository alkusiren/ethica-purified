# Ethica Purified: Core Purpose

## Overview

**Ethica Purified** is an Idris 2 project that formalizes a *purified, constructive, dependency-checked* skeleton of Spinoza's Ethics. This is a formalization engineering project focused on strict mathematical discipline rather than textual faithfulness.

## Primary Objective

Create a repository that compiles with Idris 2 and enforces the strictest possible discipline:

- **No classical logic** unless explicitly introduced later
- **No `postulate`**, no `believe_me`, no `unsafe`, no partial functions in the proof core
- **Proof modules must be `%default total`**
- **Every proposition must declare its dependencies**, and proofs must be mechanically restricted to using only those dependencies
- **All "scholia/notes/interpretation" must be stored as *data***, never used in proofs

## Definition of "Purified"

A "purified" Ethics here means:

1. **A constructive proof core**: Propositions are Types, proofs are total Idris terms
2. **No hidden assumptions**: Any assumption must be named and located (definition/axiom/lemma)
3. **No commentary mixed into proofs**: Notes and explanations are metadata only
4. **No non-constructive existence or excluded middle** anywhere in the core
5. **No semantic overreach**: Ontology is *structural* and minimal (abstract types + relations), only expanded when needed

## Non-Goals (Strict)

- **Not** a faithful textual edition, not a full reconstruction of Spinoza's metaphysics
- **Not** "proving Ethics" from scratch
- **Not** encoding scholia, rhetoric, or natural language content as proof-relevant
- **Not** adding axioms to make propositions provable. If something is not derivable constructively from current assumptions, it must remain *unproven* and should be represented as an *uninhabited goal* / todo marker that does not break compilation

## Critical Constraint: No Postulates and Still Compile

Since we forbid postulates, the project must compile even if most propositions are not yet proven. This is achieved by:

- **Separating "statements" from "proofs"**:
  - `Ethica.Book1.Props` contains proposition statements as Types plus metadata
  - `Ethica.Book1.Proofs` contains only those proofs we can actually construct *now*
- **Never including a required definition** like `proofOfP1 : P1` unless it can be proven
- **Providing "proof registry"** as a list/map of *existing proofs only*; missing proofs are absent, not faked

## Project Structure

### Core Modules

- **`Ethica/Core/Logic.idr`**: Constructive logic helpers only
- **`Ethica/Core/Ref.idr`**: ItemRef identifiers (Book/Kind/Number)
- **`Ethica/Core/Meta.idr`**: Prop metadata (statement + declared deps + optional note refs)
- **`Ethica/Core/Deps.idr`**: Dependency checking primitives
- **`Ethica/Core/Registry.idr`**: Safe registry of proven items
- **`Ethica/Meta/Notes.idr`**: Notes/scholia as data; never imported by proofs

### Book Modules

- **`Ethica/Book1/Defs.idr`**: Definitions (structural type synonyms/relations)
- **`Ethica/Book1/Axioms.idr`**: Axioms (when explicitly needed)
- **`Ethica/Book1/Props.idr`**: Book I proposition statements + dependencies
- **`Ethica/Book1/Proofs.idr`**: Only actual constructive proofs; initially minimal

### Entry Point

- **`Main.idr`**: Typechecks/imports everything, demonstrates the proof system

## Core Types

### 1. ItemRef

Enough structure to identify: Book/Kind/Number

- Example kinds: `Def`, `Ax`, `Prop`, `Lemma`
- Example: `MkItemRef Book1 Prop 1` represents "Proposition 1 of Book 1"

### 2. PropDecl

Record with:
- `ref : ItemRef`
- `statement : Type`
- `uses : List ItemRef` (declared dependencies)
- `noteIds : List String` (IDs referencing `Ethica.Meta.Notes`; metadata only)

### 3. Dependency Permission Primitives

- `Elem : a -> List a -> Type` (membership evidence)
- `Allowed : (uses : List ItemRef) -> ItemRef -> Type` (alias to `Elem`)

### 4. "Using" Discipline for Proofs

Define a wrapper `Ctx uses` that exposes only dependency-certified facts:

- `given : (r : ItemRef) -> Allowed uses r -> Proven r`

`Proven : ItemRef -> Type` must be the *only* way to refer to previously proven items in proofs.

In other words, a proof of proposition P must have the shape:
```idris
proveP : (ctx : Ctx (usesOf P)) -> statementOf P
```

This prevents importing arbitrary earlier theorems unless they're in `uses`.

### 5. Proof Registry

- Define `record ProofEntry where ref : ItemRef; proven : Proven ref`
- Provide a `Registry` value containing only available proofs
- Provide a function `mkCtx : (uses : List ItemRef) -> Registry -> Maybe (Ctx uses)`
  - If registry lacks any required dependency, return `Nothing`
- Keep this total and constructive; no partial lookups

**Important**: Keep it minimal and purely type-level; no need for runtime maps. A list lookup with membership proofs is sufficient.

## Strict Ontology Layer

In `Ethica.Book1.Props`, introduce only abstract types/relations needed to state early propositions:

- `Substance : Type`, `Mode : Type`, `Attribute : Type`
- Minimal predicates, e.g. `In : Mode -> Substance -> Type`, `ConceivedThrough : Mode -> Substance -> Type`

**DO NOT** assign semantics; keep them uninterpreted. Any "definition" is a type synonym or record that expands to primitive relations; proofs must only unfold those definitions.

## Import Discipline

- **Proof modules must not import `Ethica.Meta.Notes`**
- **Proof modules must not directly import `Ethica.Book1.Props`** if that would allow bypassing `Ctx`. They may import Props for statements, but dependencies must still be accessed only via `Ctx`

## Current Status

The project currently includes:

- Complete core infrastructure (Ref, Meta, Deps, Registry, Logic)
- Book I definitions, axioms, and proposition declarations
- At least 2 fully proven propositions demonstrating the dependency mechanism
- A working proof registry system that enforces dependency checking
- All modules compile with `%default total` and no unsafe features

## Building the Project

```bash
idris2 --build ethica-purified.ipkg
```

The project is designed to compile successfully even when most propositions remain unproven, as long as:
- All proposition statements are well-typed
- All proofs that are included are total and constructive
- Missing proofs are simply absent from the registry, not faked with postulates

## Philosophy

This project embodies a **constructive formalization discipline**:

1. **Honesty about assumptions**: Every dependency is explicit
2. **Honesty about proofs**: Only proven propositions appear in the registry
3. **Separation of concerns**: Proofs are separate from commentary
4. **Minimal ontology**: Abstract types and relations, no semantic overreach
5. **Mechanical enforcement**: The type system prevents dependency violations

The goal is not to "prove Spinoza right" but to create a **structurally sound, dependency-checked formalization** that can serve as a foundation for further constructive work on the Ethics.

