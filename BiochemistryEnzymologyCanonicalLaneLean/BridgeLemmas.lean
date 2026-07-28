import BiochemistryEnzymologyCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BiochemistryEnzymologyCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  A.object.kineticsClosed ∧ A.object.bindingClosed

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact And.intro A.object.kineticsClosed A.object.bindingClosed

end BiochemistryEnzymologyCanonicalLaneLean
end HautevilleHouse