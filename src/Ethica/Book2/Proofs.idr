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

-- No axiomProof allowed here. Proofs must be constructive.

||| Proof of Proposition 1: Thought is an attribute of God.
public export
proveProp1 : (ctx : Ctx (uses Ethica.Book2.Props.prop1)) -> statement Ethica.Book2.Props.prop1
proveProp1 ctx = ?hole_prop1

||| Proof of Proposition 2: Extension is an attribute of God.
public export
proveProp2 : (ctx : Ctx (uses Ethica.Book2.Props.prop2)) -> statement Ethica.Book2.Props.prop2
proveProp2 ctx = ?hole_prop2

||| Proof of Proposition 3: In God there is necessarily the idea...
public export
proveProp3 : (ctx : Ctx (uses Ethica.Book2.Props.prop3)) -> statement Ethica.Book2.Props.prop3
proveProp3 ctx = ?hole_prop3

||| Proof of Proposition 4: The idea of God is one.
public export
proveProp4 : (ctx : Ctx (uses Ethica.Book2.Props.prop4)) -> statement Ethica.Book2.Props.prop4
proveProp4 ctx = ?hole_prop4

||| Proof of Proposition 5: The actual being of ideas owns God as its cause...
public export
proveProp5 : (ctx : Ctx (uses Ethica.Book2.Props.prop5)) -> statement Ethica.Book2.Props.prop5
proveProp5 ctx = ?hole_prop5

||| Proof of Proposition 6: The modes of any given attribute are caused by God...
public export
proveProp6 : (ctx : Ctx (uses Ethica.Book2.Props.prop6)) -> statement Ethica.Book2.Props.prop6
proveProp6 ctx = ?hole_prop6

||| Proof of Proposition 7: The order and connection of ideas is the same as the order and connection of things.
public export
proveProp7 : (ctx : Ctx (uses Ethica.Book2.Props.prop7)) -> statement Ethica.Book2.Props.prop7
proveProp7 ctx = ?hole_prop7

||| Proof of Proposition 8: The ideas of particular things...
public export
proveProp8 : (ctx : Ctx (uses Ethica.Book2.Props.prop8)) -> statement Ethica.Book2.Props.prop8
proveProp8 ctx = ?hole_prop8

||| Proof of Proposition 9: The idea of an individual thing actually existing...
public export
proveProp9 : (ctx : Ctx (uses Ethica.Book2.Props.prop9)) -> statement Ethica.Book2.Props.prop9
proveProp9 ctx = ?hole_prop9

||| Proof of Proposition 10: The being of substance does not appertain to the essence of man.
public export
proveProp10 : (ctx : Ctx (uses Ethica.Book2.Props.prop10)) -> statement Ethica.Book2.Props.prop10
proveProp10 ctx = ?hole_prop10

||| Proof of Proposition 11.
public export
proveProp11 : (ctx : Ctx (uses Ethica.Book2.Props.prop11)) -> statement Ethica.Book2.Props.prop11
proveProp11 ctx = ?hole_prop11

||| Proof of Proposition 12.
public export
proveProp12 : (ctx : Ctx (uses Ethica.Book2.Props.prop12)) -> statement Ethica.Book2.Props.prop12
proveProp12 ctx = ?hole_prop12

||| Proof of Proposition 13.
public export
proveProp13 : (ctx : Ctx (uses Ethica.Book2.Props.prop13)) -> statement Ethica.Book2.Props.prop13
proveProp13 ctx = ?hole_prop13

||| Proof of Proposition 14.
public export
proveProp14 : (ctx : Ctx (uses Ethica.Book2.Props.prop14)) -> statement Ethica.Book2.Props.prop14
proveProp14 ctx = ?hole_prop14

||| Proof of Proposition 15.
public export
proveProp15 : (ctx : Ctx (uses Ethica.Book2.Props.prop15)) -> statement Ethica.Book2.Props.prop15
proveProp15 ctx = ?hole_prop15

||| Proof of Proposition 16.
public export
proveProp16 : (ctx : Ctx (uses Ethica.Book2.Props.prop16)) -> statement Ethica.Book2.Props.prop16
proveProp16 ctx = ?hole_prop16

||| Proof of Proposition 17.
public export
proveProp17 : (ctx : Ctx (uses Ethica.Book2.Props.prop17)) -> statement Ethica.Book2.Props.prop17
proveProp17 ctx = ?hole_prop17

||| Proof of Proposition 18.
public export
proveProp18 : (ctx : Ctx (uses Ethica.Book2.Props.prop18)) -> statement Ethica.Book2.Props.prop18
proveProp18 ctx = ?hole_prop18

||| Proof of Proposition 19.
public export
proveProp19 : (ctx : Ctx (uses Ethica.Book2.Props.prop19)) -> statement Ethica.Book2.Props.prop19
proveProp19 ctx = ?hole_prop19

||| Proof of Proposition 20.
public export
proveProp20 : (ctx : Ctx (uses Ethica.Book2.Props.prop20)) -> statement Ethica.Book2.Props.prop20
proveProp20 ctx = ?hole_prop20

||| Proof of Proposition 21.
public export
proveProp21 : (ctx : Ctx (uses Ethica.Book2.Props.prop21)) -> statement Ethica.Book2.Props.prop21
proveProp21 ctx = ?hole_prop21

||| Proof of Proposition 22.
public export
proveProp22 : (ctx : Ctx (uses Ethica.Book2.Props.prop22)) -> statement Ethica.Book2.Props.prop22
proveProp22 ctx = ?hole_prop22

||| Proof of Proposition 23.
public export
proveProp23 : (ctx : Ctx (uses Ethica.Book2.Props.prop23)) -> statement Ethica.Book2.Props.prop23
proveProp23 ctx = ?hole_prop23

||| Proof of Proposition 24.
public export
proveProp24 : (ctx : Ctx (uses Ethica.Book2.Props.prop24)) -> statement Ethica.Book2.Props.prop24
proveProp24 ctx = ?hole_prop24

||| Proof of Proposition 25.
public export
proveProp25 : (ctx : Ctx (uses Ethica.Book2.Props.prop25)) -> statement Ethica.Book2.Props.prop25
proveProp25 ctx = ?hole_prop25

||| Proof of Proposition 26.
public export
proveProp26 : (ctx : Ctx (uses Ethica.Book2.Props.prop26)) -> statement Ethica.Book2.Props.prop26
proveProp26 ctx = ?hole_prop26

||| Proof of Proposition 27.
public export
proveProp27 : (ctx : Ctx (uses Ethica.Book2.Props.prop27)) -> statement Ethica.Book2.Props.prop27
proveProp27 ctx = ?hole_prop27

||| Proof of Proposition 28.
public export
proveProp28 : (ctx : Ctx (uses Ethica.Book2.Props.prop28)) -> statement Ethica.Book2.Props.prop28
proveProp28 ctx = ?hole_prop28

||| Proof of Proposition 29.
public export
proveProp29 : (ctx : Ctx (uses Ethica.Book2.Props.prop29)) -> statement Ethica.Book2.Props.prop29
proveProp29 ctx = ?hole_prop29

||| Proof of Proposition 30.
public export
proveProp30 : (ctx : Ctx (uses Ethica.Book2.Props.prop30)) -> statement Ethica.Book2.Props.prop30
proveProp30 ctx = ?hole_prop30

||| Proof of Proposition 31.
public export
proveProp31 : (ctx : Ctx (uses Ethica.Book2.Props.prop31)) -> statement Ethica.Book2.Props.prop31
proveProp31 ctx = ?hole_prop31

||| Proof of Proposition 32.
public export
proveProp32 : (ctx : Ctx (uses Ethica.Book2.Props.prop32)) -> statement Ethica.Book2.Props.prop32
proveProp32 ctx = ?hole_prop32

||| Proof of Proposition 33.
public export
proveProp33 : (ctx : Ctx (uses Ethica.Book2.Props.prop33)) -> statement Ethica.Book2.Props.prop33
proveProp33 ctx = ?hole_prop33

||| Proof of Proposition 34.
public export
proveProp34 : (ctx : Ctx (uses Ethica.Book2.Props.prop34)) -> statement Ethica.Book2.Props.prop34
proveProp34 ctx = ?hole_prop34

||| Proof of Proposition 35.
public export
proveProp35 : (ctx : Ctx (uses Ethica.Book2.Props.prop35)) -> statement Ethica.Book2.Props.prop35
proveProp35 ctx = ?hole_prop35

||| Proof of Proposition 36.
public export
proveProp36 : (ctx : Ctx (uses Ethica.Book2.Props.prop36)) -> statement Ethica.Book2.Props.prop36
proveProp36 ctx = ?hole_prop36

||| Proof of Proposition 37.
public export
proveProp37 : (ctx : Ctx (uses Ethica.Book2.Props.prop37)) -> statement Ethica.Book2.Props.prop37
proveProp37 ctx = ?hole_prop37

||| Proof of Proposition 38.
public export
proveProp38 : (ctx : Ctx (uses Ethica.Book2.Props.prop38)) -> statement Ethica.Book2.Props.prop38
proveProp38 ctx = ?hole_prop38

||| Proof of Proposition 39.
public export
proveProp39 : (ctx : Ctx (uses Ethica.Book2.Props.prop39)) -> statement Ethica.Book2.Props.prop39
proveProp39 ctx = ?hole_prop39

||| Proof of Proposition 40.
public export
proveProp40 : (ctx : Ctx (uses Ethica.Book2.Props.prop40)) -> statement Ethica.Book2.Props.prop40
proveProp40 ctx = ?hole_prop40

||| Proof of Proposition 41.
public export
proveProp41 : (ctx : Ctx (uses Ethica.Book2.Props.prop41)) -> statement Ethica.Book2.Props.prop41
proveProp41 ctx = ?hole_prop41

||| Proof of Proposition 42.
public export
proveProp42 : (ctx : Ctx (uses Ethica.Book2.Props.prop42)) -> statement Ethica.Book2.Props.prop42
proveProp42 ctx = ?hole_prop42

||| Proof of Proposition 43.
public export
proveProp43 : (ctx : Ctx (uses Ethica.Book2.Props.prop43)) -> statement Ethica.Book2.Props.prop43
proveProp43 ctx = ?hole_prop43

||| Proof of Proposition 44.
public export
proveProp44 : (ctx : Ctx (uses Ethica.Book2.Props.prop44)) -> statement Ethica.Book2.Props.prop44
proveProp44 ctx = ?hole_prop44

||| Proof of Proposition 45.
public export
proveProp45 : (ctx : Ctx (uses Ethica.Book2.Props.prop45)) -> statement Ethica.Book2.Props.prop45
proveProp45 ctx = ?hole_prop45

||| Proof of Proposition 46.
public export
proveProp46 : (ctx : Ctx (uses Ethica.Book2.Props.prop46)) -> statement Ethica.Book2.Props.prop46
proveProp46 ctx = ?hole_prop46

||| Proof of Proposition 47.
public export
proveProp47 : (ctx : Ctx (uses Ethica.Book2.Props.prop47)) -> statement Ethica.Book2.Props.prop47
proveProp47 ctx = ?hole_prop47

||| Proof of Proposition 48.
public export
proveProp48 : (ctx : Ctx (uses Ethica.Book2.Props.prop48)) -> statement Ethica.Book2.Props.prop48
proveProp48 ctx = ?hole_prop48

||| Proof of Proposition 49.
public export
proveProp49 : (ctx : Ctx (uses Ethica.Book2.Props.prop49)) -> statement Ethica.Book2.Props.prop49
proveProp49 ctx = ?hole_prop49
