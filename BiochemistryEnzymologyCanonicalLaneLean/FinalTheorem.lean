import BiochemistryEnzymologyCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace BiochemistryEnzymologyCanonicalLaneLean

def ConstrainedEnzymologyClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_enzymology_endgame (A : AdmissibleClass) :
    ConstrainedEnzymologyClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end BiochemistryEnzymologyCanonicalLaneLean
end HautevilleHouse