import canonicalLaneMathlib.AdmissibleClass

/-!
# Michaelis-Menten Kinetics Package
-/

namespace HautevilleHouse
namespace BiochemistryEnzymologyCanonicalLaneLean

structure MichaelisMentenKineticsPackage where
  enzymeConcentration : Prop
  substrateConcentration : Prop
  complexFormation : Prop
  productRelease : Prop
  steadyStateAssumption : Prop
  michaelisConstant : Prop

structure MichaelisMentenKineticsEvidence
    (K : MichaelisMentenKineticsPackage) where
  enzymeConcentrationClosed : K.enzymeConcentration
  substrateConcentrationClosed : K.substrateConcentration
  complexFormationClosed : K.complexFormation
  productReleaseClosed : K.productRelease
  steadyStateAssumptionClosed : K.steadyStateAssumption
  michaelisConstantClosed : K.michaelisConstant

def MichaelisMentenKineticsClosed
    (K : MichaelisMentenKineticsPackage) : Prop :=
  K.enzymeConcentration ∧ K.substrateConcentration ∧
  K.complexFormation ∧ K.productRelease ∧
  K.steadyStateAssumption ∧ K.michaelisConstant

theorem michaelis_menten_kinetics_closed_from_evidence
    (K : MichaelisMentenKineticsPackage)
    (E : MichaelisMentenKineticsEvidence K) :
    MichaelisMentenKineticsClosed K := by
  exact And.intro E.enzymeConcentrationClosed
    (And.intro E.substrateConcentrationClosed
      (And.intro E.complexFormationClosed
        (And.intro E.productReleaseClosed
          (And.intro E.steadyStateAssumptionClosed
            E.michaelisConstantClosed))))

end BiochemistryEnzymologyCanonicalLaneLean
end HautevilleHouse