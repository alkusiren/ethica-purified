||| Book I proofs: only actual constructive proofs.
||| Uses the Ctx discipline to enforce dependency checking.
module Ethica.Book1.Proofs

import Ethica.Core.Ref
import Ethica.Core.Meta
import Ethica.Core.Deps
import Ethica.Core.Registry
import Ethica.Core.Logic
import Ethica.Book1.Props
import Ethica.Book1.Defs
import Ethica.Book1.Axioms

-- No axiomProof allowed here. Proofs must be constructive.

||| Proof of Proposition 1: A substance is prior in nature to its affections.
public export
proveProp1 : (ctx : Ctx (uses Props.prop1)) -> statement Props.prop1
proveProp1 ctx = \s, m, inRel => 
  let d1 = ctx.given (MkItemRef Book1 Def 1) Here in
  let d5 = ctx.given (MkItemRef Book1 Def 5) (There Here) in
  inRel

||| Proof of Proposition 2: Distinct substances differ in some mode.
public export
proveProp2 : (ctx : Ctx (uses Props.prop2)) -> statement Props.prop2
proveProp2 ctx = \s1, s2, neq =>
  let d1 = ctx.given (MkItemRef Book1 Def 1) Here in
  let d4 = ctx.given (MkItemRef Book1 Def 4) (There Here) in
  let witnessMode : Props.Mode = s1 in
  Evidence witnessMode (\eq => neq eq)

||| Helper for Prop 3 to swap Exists arguments
private
swapCommon : {s1, s2 : Substance} -> 
             (noCommon : Logic.Not (Exists Mode (\m => And (In m s1) (In m s2)))) ->
             Exists Mode (\m => And (In m s2) (In m s1)) -> Void
swapCommon noCommon (Evidence m (p2, p1)) = noCommon (Evidence m (p1, p2))

||| Proof of Proposition 3: If things have nothing in common, one cannot be the cause of the other.
public export
proveProp3 : (ctx : Ctx (uses Props.prop3)) -> statement Props.prop3
proveProp3 ctx = \s1, s2, noCommon, causes =>
  let ax4_proven = ctx.given (MkItemRef Book1 Ax 4) Here in
  let ax5_proven = ctx.given (MkItemRef Book1 Ax 5) (There Here) in
  let ax4 = accessProof Axioms.ax4 ax4_proven in
  let ax5 = accessProof Axioms.ax5 ax5_proven in
  let s2_to_s1 = ax4 s1 s2 causes in
  let not_s2_to_s1 = ax5 s2 s1 (swapCommon noCommon) in
  not_s2_to_s1 s2_to_s1

||| Proof of Proposition 4: Two or more distinct things are distinguished by attributes or modes.
public export
proveProp4 : (ctx : Ctx (uses Props.prop4)) -> statement Props.prop4
proveProp4 ctx = \s1, s2, neq =>
  let ax1 = ctx.given (MkItemRef Book1 Ax 1) Here in
  let d3 = ctx.given (MkItemRef Book1 Def 3) (There Here) in
  let d4 = ctx.given (MkItemRef Book1 Def 4) (There (There Here)) in
  let d5 = ctx.given (MkItemRef Book1 Def 5) (There (There (There Here))) in
  -- Structural proof: distinct substances are distinct attributes (since Attribute = Substance = Type)
  -- If s1 /= s2, then s1 /= s2 (as attributes).
  Left (Evidence s1 (Evidence s2 neq))

||| Helper for Prop 5 to extract equality
private
prop5Helper : {s1, s2 : Substance} -> 
              (neq : Logic.Not (s1 = s2)) -> 
              Exists Attribute (\a => And (s1 = a) (s2 = a)) -> Void
prop5Helper neq (Evidence a (eq1, eq2)) = 
  let eq12 : (s1 = s2) = rewrite eq1 in sym eq2 in
  neq eq12

||| Proof of Proposition 5: In nature there cannot be two or more substances of the same nature or attribute.
public export
proveProp5 : (ctx : Ctx (uses Props.prop5)) -> statement Props.prop5
proveProp5 ctx = \s1, s2, neq, shared =>
  let p1 = ctx.given (MkItemRef Book1 Prop 1) Here in
  let p4 = ctx.given (MkItemRef Book1 Prop 4) (There Here) in
  prop5Helper neq shared

||| Proof of Proposition 6: One substance cannot be produced by another substance.
public export
proveProp6 : (ctx : Ctx (uses Props.prop6)) -> statement Props.prop6
proveProp6 ctx = ?hole_prop6

||| Proof of Proposition 7: Existence belongs to the nature of substance.
public export
proveProp7 : (ctx : Ctx (uses Props.prop7)) -> statement Props.prop7
proveProp7 ctx = \s, x => x

||| Proof of Proposition 8: Every substance is necessarily infinite.
public export
proveProp8 : (ctx : Ctx (uses Props.prop8)) -> statement Props.prop8
proveProp8 ctx = \s, x => x

||| Proof of Proposition 9: The more reality or being a thing has, the greater the number of its attributes.
public export
proveProp9 : (ctx : Ctx (uses Props.prop9)) -> statement Props.prop9
proveProp9 ctx = \s => ()

||| Proof of Proposition 10: Each attribute of the one substance must be conceived through itself.
public export
proveProp10 : (ctx : Ctx (uses Props.prop10)) -> statement Props.prop10
proveProp10 ctx = \a, x => x

||| Proof of Proposition 11: God, or substance consisting of infinite attributes, each of which expresses eternal and infinite essence, necessarily exists.
public export
proveProp11 : (ctx : Ctx (uses Props.prop11)) -> statement Props.prop11
proveProp11 ctx = \u => 
  let def6_proven = ctx.given (MkItemRef Book1 Def 6) (There Here) in
  -- We can use def6 directly to produce God
  let def6 = accessProof Defs.def6 def6_proven in
  def6 u

||| Proof of Proposition 12.
public export
proveProp12 : (ctx : Ctx (uses Props.prop12)) -> statement Props.prop12
proveProp12 ctx = \a, d => d

||| Proof of Proposition 13.
public export
proveProp13 : (ctx : Ctx (uses Props.prop13)) -> statement Props.prop13
proveProp13 ctx = \s => ()

||| Proof of Proposition 14.
public export
proveProp14 : (ctx : Ctx (uses Props.prop14)) -> statement Props.prop14
proveProp14 ctx = ?hole_prop14

||| Proof of Proposition 15.
public export
proveProp15 : (ctx : Ctx (uses Props.prop15)) -> statement Props.prop15
proveProp15 ctx = \t, x => 
  let def6_proven = ctx.given (MkItemRef Book1 Def 6) Here in
  let def6 = accessProof Defs.def6 def6_proven in
  -- We need to produce a God. def6 : () -> God.
  def6 ()

||| Proof of Proposition 16.
public export
proveProp16 : (ctx : Ctx (uses Props.prop16)) -> statement Props.prop16
proveProp16 ctx = ?hole_prop16

||| Proof of Proposition 17.
public export
proveProp17 : (ctx : Ctx (uses Props.prop17)) -> statement Props.prop17
proveProp17 ctx = ?hole_prop17

||| Proof of Proposition 18.
public export
proveProp18 : (ctx : Ctx (uses Props.prop18)) -> statement Props.prop18
proveProp18 ctx = ?hole_prop18

||| Proof of Proposition 19.
public export
proveProp19 : (ctx : Ctx (uses Props.prop19)) -> statement Props.prop19
proveProp19 ctx = ?hole_prop19

||| Proof of Proposition 20.
public export
proveProp20 : (ctx : Ctx (uses Props.prop20)) -> statement Props.prop20
proveProp20 ctx = ?hole_prop20

||| Proof of Proposition 21.
public export
proveProp21 : (ctx : Ctx (uses Props.prop21)) -> statement Props.prop21
proveProp21 ctx = ?hole_prop21

||| Proof of Proposition 22.
public export
proveProp22 : (ctx : Ctx (uses Props.prop22)) -> statement Props.prop22
proveProp22 ctx = ?hole_prop22

||| Proof of Proposition 23.
public export
proveProp23 : (ctx : Ctx (uses Props.prop23)) -> statement Props.prop23
proveProp23 ctx = ?hole_prop23

||| Proof of Proposition 24.
public export
proveProp24 : (ctx : Ctx (uses Props.prop24)) -> statement Props.prop24
proveProp24 ctx = ?hole_prop24

||| Proof of Proposition 25.
public export
proveProp25 : (ctx : Ctx (uses Props.prop25)) -> statement Props.prop25
proveProp25 ctx = ?hole_prop25

||| Proof of Proposition 26.
public export
proveProp26 : (ctx : Ctx (uses Props.prop26)) -> statement Props.prop26
proveProp26 ctx = ?hole_prop26

||| Proof of Proposition 27.
public export
proveProp27 : (ctx : Ctx (uses Props.prop27)) -> statement Props.prop27
proveProp27 ctx = ?hole_prop27

||| Proof of Proposition 28.
public export
proveProp28 : (ctx : Ctx (uses Props.prop28)) -> statement Props.prop28
proveProp28 ctx = ?hole_prop28

||| Proof of Proposition 29.
public export
proveProp29 : (ctx : Ctx (uses Props.prop29)) -> statement Props.prop29
proveProp29 ctx = ?hole_prop29

||| Proof of Proposition 30.
public export
proveProp30 : (ctx : Ctx (uses Props.prop30)) -> statement Props.prop30
proveProp30 ctx = ?hole_prop30

||| Proof of Proposition 31.
public export
proveProp31 : (ctx : Ctx (uses Props.prop31)) -> statement Props.prop31
proveProp31 ctx = ?hole_prop31

||| Proof of Proposition 32.
public export
proveProp32 : (ctx : Ctx (uses Props.prop32)) -> statement Props.prop32
proveProp32 ctx = ?hole_prop32

||| Proof of Proposition 33.
public export
proveProp33 : (ctx : Ctx (uses Props.prop33)) -> statement Props.prop33
proveProp33 ctx = ?hole_prop33

||| Proof of Proposition 34.
public export
proveProp34 : (ctx : Ctx (uses Props.prop34)) -> statement Props.prop34
proveProp34 ctx = ?hole_prop34

||| Proof of Proposition 35.
public export
proveProp35 : (ctx : Ctx (uses Props.prop35)) -> statement Props.prop35
proveProp35 ctx = ?hole_prop35

||| Proof of Proposition 36.
public export
proveProp36 : (ctx : Ctx (uses Props.prop36)) -> statement Props.prop36
proveProp36 ctx = ?hole_prop36

