import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiochemistryEnzymologyCanonicalLaneLean

structure EnzymeKineticsPackage (A : AdmissibleClass) where
  enzymeConcentration : ℝ
  substrateConcentration : ℝ
  reactionRate : ℝ
  michaelisConstant : ℝ
  turnoverNumber : ℝ
  rateEquationValid : Prop
  initialVelocityMeasured : Prop
  kineticParametersConsistent : Prop
  rateEquationValidClosed : rateEquationValid
  initialVelocityMeasuredClosed : initialVelocityMeasured
  kineticParametersConsistentClosed : kineticParametersConsistent

structure EnzymeKineticsEvidence {A : AdmissibleClass} (P : EnzymeKineticsPackage A) where
  rateEquationValidClosed : P.rateEquationValid
  initialVelocityMeasuredClosed : P.initialVelocityMeasured
  kineticParametersConsistentClosed : P.kineticParametersConsistent

def EnzymeKineticsClosed {A : AdmissibleClass} (P : EnzymeKineticsPackage A) : Prop :=
  P.rateEquationValid ∧ P.initialVelocityMeasured ∧ P.kineticParametersConsistent

theorem enzyme_kinetics_closed_from_evidence {A : AdmissibleClass} (P : EnzymeKineticsPackage A) (E : EnzymeKineticsEvidence P) :
    EnzymeKineticsClosed P := by
  exact And.intro E.rateEquationValidClosed (And.intro E.initialVelocityMeasuredClosed E.kineticParametersConsistentClosed)

end BiochemistryEnzymologyCanonicalLaneLean
end HautevilleHouse