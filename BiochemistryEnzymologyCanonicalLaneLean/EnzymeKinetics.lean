import BiochemistryEnzymologyCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BiochemistryEnzymologyCanonicalLaneLean

structure MichaelisMentenKineticsPackage where
  km : ℝ
  vmax : ℝ
  substrateConcentration : ℝ → ℝ
  reactionRate : ℝ → ℝ
  michaelisMentenEquation : Prop
  steadyStateAssumption : Prop

structure MichaelisMentenKineticsEvidence (K : MichaelisMentenKineticsPackage) where
  michaelisMentenEquationClosed : K.michaelisMentenEquation
  steadyStateAssumptionClosed : K.steadyStateAssumption

def MichaelisMentenKineticsClosed (K : MichaelisMentenKineticsPackage) : Prop :=
  K.michaelisMentenEquation ∧ K.steadyStateAssumption

theorem michaelis_menten_kinetics_closed_from_evidence
    (K : MichaelisMentenKineticsPackage) (E : MichaelisMentenKineticsEvidence K) :
    MichaelisMentenKineticsClosed K := by
  exact And.intro E.michaelisMentenEquationClosed E.steadyStateAssumptionClosed

end BiochemistryEnzymologyCanonicalLaneLean
end HautevilleHouse