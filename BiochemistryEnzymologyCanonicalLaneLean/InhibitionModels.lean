import BiochemistryEnzymologyCanonicalLaneLean.MichaelisMentenKinetics

namespace HautevilleHouse
namespace BiochemistryEnzymologyCanonicalLaneLean

structure InhibitionModel {E : EnzymeKineticsPackage} {M : MichaelisMentenModel E} where
  inhibitor : Type u
  inhibitionType : String -- "competitive", "noncompetitive", "uncompetitive"
  inhibitionConstant : ℝ
  inhibitedRateEquation : Prop
  inhibitionAssumption : Prop

structure InhibitionEvidence {E : EnzymeKineticsPackage} {M : MichaelisMentenModel E}
    (I : InhibitionModel E M) where
  inhibitedRateEquationClosed : I.inhibitedRateEquation
  inhibitionAssumptionClosed : I.inhibitionAssumption

def InhibitionClosed {E : EnzymeKineticsPackage} {M : MichaelisMentenModel E}
    (I : InhibitionModel E M) : Prop :=
  I.inhibitedRateEquation ∧ I.inhibitionAssumption

theorem inhibition_closed_from_evidence {E : EnzymeKineticsPackage}
    {M : MichaelisMentenModel E} (I : InhibitionModel E M)
    (ev : InhibitionEvidence I) : InhibitionClosed I := by
  exact And.intro ev.inhibitedRateEquationClosed ev.inhibitionAssumptionClosed

end BiochemistryEnzymologyCanonicalLaneLean
end HautevilleHouse