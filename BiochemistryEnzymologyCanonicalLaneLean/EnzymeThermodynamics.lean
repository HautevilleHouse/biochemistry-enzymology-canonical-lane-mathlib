import BiochemistryEnzymologyCanonicalLaneLean.EnzymeKinetics

namespace HautevilleHouse
namespace BiochemistryEnzymologyCanonicalLaneLean

structure EnzymeThermodynamicsPackage {K : MichaelisMentenKineticsPackage} where
  gibbsFreeEnergyChange : ℝ
  activationEnergy : ℝ
  equilibriumConstant : ℝ
  thermodynamicConsistency : Prop
  entropyChangeDefined : Prop

structure EnzymeThermodynamicsEvidence {K : MichaelisMentenKineticsPackage}
    (T : EnzymeThermodynamicsPackage K) where
  thermodynamicConsistencyClosed : T.thermodynamicConsistency
  entropyChangeDefinedClosed : T.entropyChangeDefined

def EnzymeThermodynamicsClosed {K : MichaelisMentenKineticsPackage}
    (T : EnzymeThermodynamicsPackage K) : Prop :=
  T.thermodynamicConsistency ∧ T.entropyChangeDefined

theorem enzyme_thermodynamics_closed_from_evidence
    {K : MichaelisMentenKineticsPackage} (T : EnzymeThermodynamicsPackage K)
    (E : EnzymeThermodynamicsEvidence T) : EnzymeThermodynamicsClosed T := by
  exact And.intro E.thermodynamicConsistencyClosed E.entropyChangeDefinedClosed

end BiochemistryEnzymologyCanonicalLaneLean
end HautevilleHouse