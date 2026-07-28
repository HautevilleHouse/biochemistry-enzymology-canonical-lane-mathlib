import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiochemistryEnzymologyCanonicalLaneLean

structure MichaelisMentenEquation (A : AdmissibleClass) where
  km : ℝ
  vmax : ℝ
  substrateConcentration : ℝ
  reactionRate : ℝ
  equationValid : Prop
  derivationFromKinetics : Prop
  initialRateAssumption : Prop
  equationValidClosed : equationValid
  derivationFromKineticsClosed : derivationFromKinetics
  initialRateAssumptionClosed : initialRateAssumption

structure MichaelisMentenEvidence {A : AdmissibleClass} (M : MichaelisMentenEquation A) where
  equationValidClosed : M.equationValid
  derivationFromKineticsClosed : M.derivationFromKinetics
  initialRateAssumptionClosed : M.initialRateAssumption

def MichaelisMentenClosed {A : AdmissibleClass} (M : MichaelisMentenEquation A) : Prop :=
  M.equationValid ∧ M.derivationFromKinetics ∧ M.initialRateAssumption

theorem michaelis_menten_closed_from_evidence {A : AdmissibleClass} (M : MichaelisMentenEquation A) (E : MichaelisMentenEvidence M) :
    MichaelisMentenClosed M := by
  exact And.intro E.equationValidClosed (And.intro E.derivationFromKineticsClosed E.initialRateAssumptionClosed)

end BiochemistryEnzymologyCanonicalLaneLean
end HautevilleHouse