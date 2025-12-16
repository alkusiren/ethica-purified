# Ethica Purified

A **constructive, dependency-checked formalization** of Spinoza's *Ethics* in Idris 2.

## Overview

**Ethica Purified** is a formalization engineering project that creates a mathematically rigorous, mechanically verified skeleton of Spinoza's *Ethics*. The project enforces strict constructive logic discipline: no classical assumptions, no hidden dependencies, and no proof-by-fiat.

### Key Principles

- **Constructive Logic Only**: No excluded middle, no double negation elimination
- **Dependency-Checked**: Every proposition declares its dependencies; proofs are mechanically restricted to use only declared dependencies
- **Total Functions**: All proof modules use `%default total`; no `postulate`, `believe_me`, or `unsafe`
- **Separation of Concerns**: Proofs are separate from commentary; notes/scholia are metadata only
- **Minimal Ontology**: Abstract types and relations, no semantic overreach
- **Honest About Gaps**: Unproven propositions remain unproven; the project compiles even when most propositions are not yet proven

## Philosophy

This project is **not**:
- A faithful textual edition of Spinoza's *Ethics*
- A full reconstruction of Spinoza's metaphysics
- An attempt to "prove Spinoza right"

This project **is**:
- A structurally sound, dependency-checked formalization
- A foundation for constructive work on the *Ethics*
- A demonstration of rigorous formalization engineering
- A system that enforces mathematical honesty about assumptions and proofs

## Project Structure

```
ethica/
├── ethica-purified.ipkg          # Idris 2 package file
├── src/
│   ├── Main.idr                  # Entry point and demonstration
│   └── Ethica/
│       ├── Core/                 # Core infrastructure
│       │   ├── Logic.idr         # Constructive logic operators
│       │   ├── Ref.idr           # ItemRef (Book/Kind/Number)
│       │   ├── Meta.idr          # PropDecl (statement + deps)
│       │   ├── Deps.idr          # Dependency checking (Ctx, Proven)
│       │   ├── Registry.idr      # Proof registry system
│       │   └── Coverage.idr      # Coverage tracking
│       ├── Meta/
│       │   └── Notes.idr         # Notes/scholia (metadata only)
│       └── Book1/                # Book I formalization
│           ├── Defs.idr          # Definitions
│           ├── Axioms.idr        # Axioms
│           ├── Props.idr         # Proposition statements
│           └── Proofs.idr        # Constructive proofs
└── README.md                      # This file
```

## Building and Running

### Prerequisites

- [Idris 2](https://www.idris-lang.org/) (latest version)

### Build

```bash
idris2 --build ethica-purified.ipkg
```

### Run

```bash
idris2 --exec main ethica-purified.ipkg
```

Or after building:

```bash
./build/exec/main
```

### Typecheck Only

```bash
idris2 --typecheck ethica-purified.ipkg
```

## Current Coverage

The project currently formalizes **Book I** (Concerning God) with:

- **5/36 propositions** declared (13.9%)
- **2/5 declared propositions** proven (40%)
- **4/8 definitions** declared (50%)
- **1/7 axioms** declared (14.3%)

**Overall across all 5 books:**
- **5/259 propositions** declared (1.9%)
- **2/5 declared propositions** proven (40%)
- **4/25 definitions** declared (16%)
- **1/15 axioms** declared (6.7%)

The system tracks coverage automatically. Run the program to see current statistics.

## Core Concepts

### ItemRef

Identifies items in the *Ethics* by Book, Kind (Def/Ax/Prop/Lemma), and Number:

```idris
MkItemRef Book1 Prop 1  -- Proposition 1 of Book I
MkItemRef Book1 Def 5    -- Definition 5 of Book I
```

### PropDecl

Declares a proposition with its statement, dependencies, and metadata:

```idris
prop1 : PropDecl
prop1 = MkPropDecl
  (MkItemRef Book1 Prop 1)
  (Forall Substance (\s => Forall Mode (\m => In m s -> s)))
  [MkItemRef Book1 Def 1, MkItemRef Book1 Def 5]  -- Dependencies
  ["note-p1-1"]  -- Note references (metadata only)
```

### Dependency Discipline

Proofs must use the `Ctx` system to access dependencies:

```idris
proveProp1 : (ctx : Ctx (uses Props.prop1)) -> statement Props.prop1
proveProp1 ctx = \s, m, inRel =>
  let d1 = ctx.given (MkItemRef Book1 Def 1) Here in
  let d5 = ctx.given (MkItemRef Book1 Def 5) (There Here) in
  -- Proof using only declared dependencies
  inRel
```

The type system **prevents** accessing undeclared dependencies.

### Proof Registry

The registry stores only **proven** items. Missing proofs are simply absent:

```idris
Registry : Type
Registry = List ProofEntry

mkCtx : (uses : List ItemRef) -> Registry -> Maybe (Ctx uses)
```

If any dependency is missing, `mkCtx` returns `Nothing`.

## Extending the Project

### Adding a New Proposition

1. **Declare the proposition** in `Ethica/Book1/Props.idr`:

```idris
prop6 : PropDecl
prop6 = MkPropDecl
  (MkItemRef Book1 Prop 6)
  (statement : Type)  -- Your proposition statement
  [MkItemRef Book1 Prop 1, MkItemRef Book1 Def 3]  -- Dependencies
  ["note-p6-1"]
```

2. **Add it to the list**:

```idris
allBook1Props : List PropDecl
allBook1Props = [prop1, prop2, prop3, prop4, prop5, prop6]
```

3. **Prove it** (when ready) in `Ethica/Book1/Proofs.idr`:

```idris
proveProp6 : (ctx : Ctx (uses Props.prop6)) -> statement Props.prop6
proveProp6 ctx = -- Your constructive proof
```

4. **Add to registry** in `Main.idr` when proven.

### Adding a New Book

1. Create `Ethica/Book2/` directory
2. Add `Defs.idr`, `Axioms.idr`, `Props.idr`, `Proofs.idr`
3. Update `Ethica.Core.Ref` to include `Book2`
4. Update `Ethica.Core.Coverage` with Book II statistics
5. Add modules to `ethica-purified.ipkg`

### Adding Notes/Scholia

Add to `Ethica/Meta/Notes.idr`:

```idris
notes : List Note
notes = [
  MkNote "note-p1-1" "Commentary on Proposition 1...",
  -- ...
]
```

**Important**: Notes are never imported by proof modules.

## Design Decisions

### Why Constructive Logic?

Constructive logic requires explicit witnesses for existence claims and makes dependencies explicit. This aligns with the goal of mathematical honesty about assumptions.

### Why Dependency Checking?

Mechanically enforced dependency checking prevents circular reasoning and makes the proof structure transparent. The type system enforces that proofs can only use declared dependencies.

### Why Minimal Ontology?

Starting with abstract types and minimal relations allows the formalization to grow organically. We avoid semantic commitments that might need revision later.

### Why Separate Proofs from Statements?

This allows the project to compile even when most propositions are unproven. Missing proofs are simply absent from the registry, not faked with postulates.

## Contributing

When contributing:

1. **Maintain totality**: All proof modules must be `%default total`
2. **No postulates**: Use constructive proofs or leave unproven
3. **Declare dependencies**: Every proposition must list its dependencies
4. **Use Ctx discipline**: Access dependencies only via `ctx.given`
5. **Keep ontology minimal**: Add structure only when needed
6. **Separate concerns**: Proofs in `Proofs.idr`, notes in `Notes.idr`

## References

- Spinoza, B. (1677). *Ethica ordine geometrico demonstrata* (Ethics Demonstrated in Geometrical Order)
- [Idris 2 Documentation](https://www.idris-lang.org/docs/)
- [Constructive Logic](https://en.wikipedia.org/wiki/Constructive_logic)

### Source Text

The complete text of Spinoza's *Ethics* is available in this repository in the `pg3800-h/` directory:
- `pg3800-images.html` - Full HTML version of the Ethics with images
- `3800-cover.png` - Cover image

This source material is used as reference for the formalization work.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

This project demonstrates formalization engineering principles for constructive mathematics and dependency-checked proof systems.

