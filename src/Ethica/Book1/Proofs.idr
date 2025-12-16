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

%default total

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
