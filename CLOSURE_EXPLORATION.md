# Closure Exploration: Full Constructive Consequence Space

## Overview

**Closure Exploration** is an extension of the Ethica Purified project that explores the *full constructive consequence space* of the kernel. This involves constructing new theorems, corollaries, and lemmas that follow from the kernel but are not explicitly in Spinoza's original traversal, producing a mechanically checkable "closure exploration" with traceable dependency graphs and minimal assumption sets.

## Task

Extend the existing Idris 2 project "ethica-purified" (which contains a *purified kernel* of Spinoza's Ethics) to:

1. **Generate new theorems/corollaries** that follow constructively from the kernel
2. **Produce mechanically checkable closure exploration** with traceable dependency graphs
3. **Identify minimal assumption sets** for each derived theorem
4. **Document blocked goals** where derivations fail due to missing assumptions

## Hard Constraints (Non-Negotiable)

- **No `postulate`**, no `believe_me`, no `unsafe`, no partial functions in proof modules
- **Proof modules must be `%default total`**
- **Do not introduce classical logic** (no excluded middle, no choice) unless placed in a separate module that is **NOT** imported by the kernel or the exploration modules
- **Proofs may use only previously proven items** provided through `Ctx uses` (the dependency discipline). No bypassing by direct imports of proof terms
- **Notes/scholia must remain metadata only** and must not be imported by proof modules

## What "To Its Fullest Extent" Means

Within constructive, total Idris 2, do as much as is feasible to:

1. **Generate many new derived theorems** (lemmas/corollaries) from the kernel
2. **Minimize dependencies** for each derived theorem (find smaller "uses" sets)
3. **Provide a dependency graph** and proof registry that makes the consequence space navigable
4. **Identify (constructively) where derivations fail** because of missing assumptions; record these as "blocked goals" without breaking compilation

## Deliverables

### A) New Modules

Create the following modules:

- **`Ethica/Explore/Derivations.idr`**: New theorems and their proofs, grouped by theme
- **`Ethica/Explore/MinDeps.idr`**: Tools + proofs to show dependency minimization where possible
- **`Ethica/Explore/Graph.idr`**: Data structures for a dependency DAG over ItemRef and exports
- **`Ethica/Explore/Blocked.idr`**: Record blocked/attempted statements and why they are blocked, as metadata only
- **`Ethica/Explore/Registry.idr`**: Registry of all new proven theorems
- **Update `Main.idr`** to import/typecheck everything

### B) Closure Index

A value `closureIndex : List PropDecl` (or similar) listing all new derived theorems with:

- `ref`: ItemRef identifier
- `statement`: The theorem statement as a Type
- `uses`: Minimal or minimized dependency list
- `tags`: Theme classification (causality/identity/substance/modes/etc.)
- `noteIds`: Optional note IDs (metadata only)

### C) At Least 25 New Derived Theorems

At least 25 new derived theorems that compile and are proven constructively. Prefer theorems that:

- **Factor repeated patterns** into reusable lemmas
- **Show stronger/generalized forms** of existing props
- **Expose equivalences** between definitions
- **Produce structural corollaries** that Spinoza didn't enumerate

### D) Dependency Minimization

For at least 10 of the new theorems, attempt to reduce dependencies:

- Provide **alternate proofs with smaller `uses` lists**, OR
- Prove that a certain dependency is **not needed** by presenting a proof that omits it

Keep this constructive: do not claim minimality unless you can mechanically justify it. If you cannot prove minimality, label it "reduced" not "minimal".

### E) Blocked Goals (No Postulates)

Create a `BlockedGoal` record:

```idris
record BlockedGoal where
  ref : ItemRef
  statement : Type
  attemptedUses : List ItemRef
  reason : String  -- e.g., "requires classical excluded middle", 
                   --       "requires stronger ontology axiom", 
                   --       "cannot derive witness constructively"
```

Maintain `blockedGoals : List BlockedGoal` as metadata only. Do **NOT** turn blocked goals into proof obligations.

## Guidance on Method

### 1) Scan Current Kernel

Start by scanning current kernel propositions and proven items. Build a list of:

- **Definitional equalities**: Where definitions imply structural equalities
- **Transitivity/symmetry/reflexivity consequences**: Properties of relations
- **Monotonicity-like properties**: Of relations you have
- **Lemma opportunities**: That reduce duplication

### 2) Naming/Reference Scheme

Create a standard naming/ref scheme for derived theorems:

- e.g., `B1L 1` for derived lemmas, `B1C 1` for corollaries, or `X 1` for exploration results
- Keep them separate from Spinoza's proposition numbers to avoid confusion

### 3) Build Small Automation (No Metaprogramming)

Write helper lemmas in `Core/Logic` (constructive only) that make proofs concise. Use total functions for:

- List membership
- Lookup operations
- Registry construction

### 4) Enforce Dependency Discipline

Ensure proofs actually use the dependency discipline:

- Each proof must accept `Ctx uses` and fetch dependencies via `ctx.given`
- If a proof needs no dependencies, it should use an empty `uses` list and not require a ctx at all

### 5) Maintain Compilation and Readability

- **Small lemmas**: No massive terms
- **Organize by theme**: Group related derivations
- **Reuse shared lemmas**: Avoid duplication

## Output Format

- Print the updated file tree
- Print each new/changed file with a clear header and full contents
- Ensure `idris2 --build ethica-purified.ipkg` succeeds
- Provide a brief README update (as a separate file or section) explaining:
  - What "closure exploration" is
  - How to add a new derived theorem
  - How dependency minimization is tracked

## Example Themes for Exploration

### Causality Theorems

- Transitivity of causation
- Irreflexivity of causation (if provable)
- Composition properties of causal chains

### Identity and Distinction

- Symmetry of distinction
- Transitivity of identity
- Reflexivity properties

### Substance-Mode Relations

- Uniqueness properties
- Existence conditions
- Composition/decomposition lemmas

### Structural Corollaries

- Generalizations of existing propositions
- Special cases that follow immediately
- Equivalence proofs between different formulations

## Success Criteria

The exploration is successful when:

1. ✅ At least 25 new derived theorems are proven constructively
2. ✅ At least 10 theorems have dependency minimization attempts documented
3. ✅ At least 10 blocked goals are recorded with clear reasons
4. ✅ All modules compile with `%default total` and no unsafe features
5. ✅ Dependency graphs are navigable and traceable
6. ✅ The closure index provides a clear overview of all derived theorems
7. ✅ The project demonstrates the full constructive consequence space is being explored

## Philosophy

This exploration embodies a **constructive theorem discovery discipline**:

1. **Systematic exploration**: Methodically derive consequences from the kernel
2. **Minimal assumptions**: Always seek the smallest dependency set
3. **Honest documentation**: Clearly mark what can and cannot be proven
4. **Mechanical verification**: All results are type-checked and total
5. **Navigable structure**: Dependency graphs make the consequence space explorable

The goal is to understand the **full constructive power** of the purified kernel, not to force classical results or add ad-hoc axioms.

