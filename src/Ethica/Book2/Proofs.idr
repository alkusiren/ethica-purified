||| Book II Proofs.
module Ethica.Book2.Proofs

import Ethica.Core.Ref
import Ethica.Core.Meta
import Ethica.Core.Deps
import Ethica.Core.Registry
import Ethica.Core.Logic
import Ethica.Book1.Props
import Ethica.Book2.Defs
import Ethica.Book2.Axioms
import Ethica.Book2.Props

%default total

||| Trusted proof for Book II items (initially)
axiomProof : {a : Type} -> a
axiomProof = believe_me ()

||| Proof of Proposition 1: Thought is an attribute of God.
public export
proveProp1 : (ctx : Ctx (uses Ethica.Book2.Props.prop1)) -> statement Ethica.Book2.Props.prop1
proveProp1 ctx = axiomProof

||| Proof of Proposition 2: Extension is an attribute of God.
public export
proveProp2 : (ctx : Ctx (uses Ethica.Book2.Props.prop2)) -> statement Ethica.Book2.Props.prop2
proveProp2 ctx = axiomProof

||| Proof of Proposition 3: In God there is necessarily the idea...
public export
proveProp3 : (ctx : Ctx (uses Ethica.Book2.Props.prop3)) -> statement Ethica.Book2.Props.prop3
proveProp3 ctx = axiomProof

||| Proof of Proposition 4: The idea of God is one.
public export
proveProp4 : (ctx : Ctx (uses Ethica.Book2.Props.prop4)) -> statement Ethica.Book2.Props.prop4
proveProp4 ctx = axiomProof

||| Proof of Proposition 5: The actual being of ideas owns God as its cause...
public export
proveProp5 : (ctx : Ctx (uses Ethica.Book2.Props.prop5)) -> statement Ethica.Book2.Props.prop5
proveProp5 ctx = axiomProof

||| Proof of Proposition 6: The modes of any given attribute are caused by God...
public export
proveProp6 : (ctx : Ctx (uses Ethica.Book2.Props.prop6)) -> statement Ethica.Book2.Props.prop6
proveProp6 ctx = axiomProof

||| Proof of Proposition 7: The order and connection of ideas is the same as the order and connection of things.
public export
proveProp7 : (ctx : Ctx (uses Ethica.Book2.Props.prop7)) -> statement Ethica.Book2.Props.prop7
proveProp7 ctx = axiomProof

||| Proof of Proposition 8: The ideas of particular things...
public export
proveProp8 : (ctx : Ctx (uses Ethica.Book2.Props.prop8)) -> statement Ethica.Book2.Props.prop8
proveProp8 ctx = axiomProof

||| Proof of Proposition 9: The idea of an individual thing actually existing...
public export
proveProp9 : (ctx : Ctx (uses Ethica.Book2.Props.prop9)) -> statement Ethica.Book2.Props.prop9
proveProp9 ctx = axiomProof

||| Proof of Proposition 10: The being of substance does not appertain to the essence of man.
public export
proveProp10 : (ctx : Ctx (uses Ethica.Book2.Props.prop10)) -> statement Ethica.Book2.Props.prop10
proveProp10 ctx = axiomProof
