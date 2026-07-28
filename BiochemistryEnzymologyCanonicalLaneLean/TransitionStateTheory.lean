import BiochemistryEnzymologyCanonicalLaneLean.EnzymeThermodynamics

namespace HautevilleHouse
namespace BiochemistryEnzymologyCanonicalLaneLean

structure TransitionStateTheoryPackage {K : MichaelisMentenKineticsPackage}
    {T : EnzymeThermodynamicsPackage K} where
  eyringEquation : Prop
  transitionStateStructure : Prop
  rateConstantExpression : ℝ → ℝ
  activationEntropy : ℝ
  theoryValid : Prop

structure TransitionStateTheoryEvidence {K : MichaelisMentenKineticsPackage}
    {T : EnzymeThermodynamicsPackage K} (TS : TransitionStateTheoryPackage K T) where
  eyringEquationClosed : TS.eyringEquation
  theoryValidClosed : TS.theoryValid

def TransitionStateTheoryClosed {K : MichaelisMentenKineticsPackage}
    {T : EnzymeThermodynamicsPackage K} (TS : TransitionStateTheoryPackage K T) : Prop :=
  TS.eyringEquation ∧ TS.theoryValid

theorem transition_state_theory_closed_from_evidence
    {K : MichaelisMentenKineticsPackage} {T : EnzymeThermodynamicsPackage K}
    (TS : TransitionStateTheoryPackage K T) (E : TransitionStateTheoryEvidence TS) :
    TransitionStateTheoryClosed TS := by
  exact And.intro E.eyringEquationClosed E.theoryValidClosed

end BiochemistryEnzymologyCanonicalLaneLean
end HautevilleHouse