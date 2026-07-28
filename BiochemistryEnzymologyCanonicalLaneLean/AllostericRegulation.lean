import BiochemistryEnzymologyCanonicalLaneLean.MichaelisMentenKinetics

/-!
# Allosteric Regulation Package
-/

namespace HautevilleHouse
namespace BiochemistryEnzymologyCanonicalLaneLean

structure AllostericRegulationPackage
    {K : MichaelisMentenKineticsPackage} where
  cooperativeBinding : Prop
  allostericActivator : Prop
  allostericInhibitor : Prop
  sigmoidalKinetics : Prop
  hillCoefficient : Prop
  twoStateModel : Prop

structure AllostericRegulationEvidence
    {K : MichaelisMentenKineticsPackage}
    (A : AllostericRegulationPackage K) where
  cooperativeBindingClosed : A.cooperativeBinding
  allostericActivatorClosed : A.allostericActivator
  allostericInhibitorClosed : A.allostericInhibitor
  sigmoidalKineticsClosed : A.sigmoidalKinetics
  hillCoefficientClosed : A.hillCoefficient
  twoStateModelClosed : A.twoStateModel

def AllostericRegulationClosed
    {K : MichaelisMentenKineticsPackage}
    (A : AllostericRegulationPackage K) : Prop :=
  A.cooperativeBinding ∧ A.allostericActivator ∧
  A.allostericInhibitor ∧ A.sigmoidalKinetics ∧
  A.hillCoefficient ∧ A.twoStateModel

theorem allosteric_regulation_closed_from_evidence
    {K : MichaelisMentenKineticsPackage}
    (A : AllostericRegulationPackage K)
    (E : AllostericRegulationEvidence A) :
    AllostericRegulationClosed A := by
  exact And.intro E.cooperativeBindingClosed
    (And.intro E.allostericActivatorClosed
      (And.intro E.allostericInhibitorClosed
        (And.intro E.sigmoidalKineticsClosed
          (And.intro E.hillCoefficientClosed
            E.twoStateModelClosed))))

end BiochemistryEnzymologyCanonicalLaneLean
end HautevilleHouse