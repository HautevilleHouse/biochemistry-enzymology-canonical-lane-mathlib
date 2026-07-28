import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiochemistryEnzymologyCanonicalLaneLean

structure ThermodynamicsPackage where
  activationEnergy : Prop
  equilibriumConstant : Prop
  deltaG : Prop
  transitionStateStabilization : Prop
  rateTemperatureDependence : Prop
  activationEnergyDefined : activationEnergy

structure ThermodynamicsEvidence (T : ThermodynamicsPackage) where
  activationEnergyClosed : T.activationEnergy
  equilibriumConstantClosed : T.equilibriumConstant
  deltaGClosed : T.deltaG
  transitionStateStabilizationClosed : T.transitionStateStabilization
  rateTemperatureDependenceClosed : T.rateTemperatureDependence

def ThermodynamicsClosed (T : ThermodynamicsPackage) : Prop :=
  T.activationEnergy ∧ T.equilibriumConstant ∧ T.deltaG ∧
  T.transitionStateStabilization ∧ T.rateTemperatureDependence

theorem thermodynamics_closed_from_evidence (T : ThermodynamicsPackage)
    (E : ThermodynamicsEvidence T) : ThermodynamicsClosed T := by
  exact And.intro E.activationEnergyClosed (And.intro E.equilibriumConstantClosed
    (And.intro E.deltaGClosed (And.intro E.transitionStateStabilizationClosed
      E.rateTemperatureDependenceClosed)))

end BiochemistryEnzymologyCanonicalLaneLean
end HautevilleHouse
