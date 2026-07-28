import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiochemistryEnzymologyCanonicalLaneLean

structure ReactionMechanismPackage where
  elementarySteps : Prop
  rateLimitingStep : Prop
  intermediateFormation : Prop
  catalyticCycle : Prop
  steadyStateDistribution : Prop
  catalyticCycleClosed : catalyticCycle

structure ReactionMechanismEvidence (R : ReactionMechanismPackage) where
  elementaryStepsClosed : R.elementarySteps
  rateLimitingStepClosed : R.rateLimitingStep
  intermediateFormationClosed : R.intermediateFormation
  catalyticCycleClosed : R.catalyticCycle
  steadyStateDistributionClosed : R.steadyStateDistribution

def ReactionMechanismClosed (R : ReactionMechanismPackage) : Prop :=
  R.elementarySteps ∧ R.rateLimitingStep ∧ R.intermediateFormation ∧
  R.catalyticCycle ∧ R.steadyStateDistribution

theorem reaction_mechanism_closed_from_evidence (R : ReactionMechanismPackage)
    (E : ReactionMechanismEvidence R) : ReactionMechanismClosed R := by
  exact And.intro E.elementaryStepsClosed (And.intro E.rateLimitingStepClosed
    (And.intro E.intermediateFormationClosed (And.intro E.catalyticCycleClosed
      E.steadyStateDistributionClosed)))

end BiochemistryEnzymologyCanonicalLaneLean
end HautevilleHouse
