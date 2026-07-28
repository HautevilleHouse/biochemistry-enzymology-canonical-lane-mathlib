import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiochemistryEnzymologyCanonicalLaneLean

structure AllostericRegulationPackage (A : AdmissibleClass) where
  effectorConcentration : ℝ
  bindingConstant : ℝ
  cooperativityCoefficient : ℝ
  regulatoryEffectObserved : Prop
  allostericMechanismIdentified : Prop
  bindingCurveConsistent : Prop
  regulatoryEffectObservedClosed : regulatoryEffectObserved
  allostericMechanismIdentifiedClosed : allostericMechanismIdentified
  bindingCurveConsistentClosed : bindingCurveConsistent

structure AllostericRegulationEvidence {A : AdmissibleClass} (R : AllostericRegulationPackage A) where
  regulatoryEffectObservedClosed : R.regulatoryEffectObserved
  allostericMechanismIdentifiedClosed : R.allostericMechanismIdentified
  bindingCurveConsistentClosed : R.bindingCurveConsistent

def AllostericRegulationClosed {A : AdmissibleClass} (R : AllostericRegulationPackage A) : Prop :=
  R.regulatoryEffectObserved ∧ R.allostericMechanismIdentified ∧ R.bindingCurveConsistent

theorem allosteric_regulation_closed_from_evidence {A : AdmissibleClass} (R : AllostericRegulationPackage A) (E : AllostericRegulationEvidence R) :
    AllostericRegulationClosed R := by
  exact And.intro E.regulatoryEffectObservedClosed (And.intro E.allostericMechanismIdentifiedClosed E.bindingCurveConsistentClosed)

end BiochemistryEnzymologyCanonicalLaneLean
end HautevilleHouse