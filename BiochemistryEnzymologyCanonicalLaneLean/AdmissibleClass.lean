import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiochemistryEnzymologyCanonicalLaneLean

structure BiochemistryObject where
  enzyme : String
  substrate : String
  kineticsClosed : Prop
  bindingClosed : Prop

structure AdmissibleClass where
  object : BiochemistryObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  A.object.kineticsClosed ∧ A.object.bindingClosed

end BiochemistryEnzymologyCanonicalLaneLean
end HautevilleHouse