import BiochemistryEnzymologyCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BiochemistryEnzymologyCanonicalLaneLean

structure EnzymeKineticsPackage where
  enzyme : Type u
  substrate : Type v
  product : Type w
  reactionRate : Prop
  enzymeConcentration : ℝ
  substrateConcentration : ℝ
  productConcentration : ℝ
  kineticOrder : Nat
  rateEquation : Prop

structure EnzymeKineticsEvidence (E : EnzymeKineticsPackage) where
  reactionRateClosed : E.reactionRate
  rateEquationClosed : E.rateEquation

def EnzymeKineticsClosed (E : EnzymeKineticsPackage) : Prop :=
  E.reactionRate ∧ E.rateEquation

theorem enzyme_kinetics_closed_from_evidence (E : EnzymeKineticsPackage)
    (ev : EnzymeKineticsEvidence E) : EnzymeKineticsClosed E := by
  exact And.intro ev.reactionRateClosed ev.rateEquationClosed

end BiochemistryEnzymologyCanonicalLaneLean
end HautevilleHouse