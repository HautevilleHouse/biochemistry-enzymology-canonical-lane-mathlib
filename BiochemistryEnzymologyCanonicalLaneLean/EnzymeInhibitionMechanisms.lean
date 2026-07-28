import BiochemistryEnzymologyCanonicalLaneLean.MichaelisMentenKinetics

/-!
# Enzyme Inhibition Mechanisms Package
-/

namespace HautevilleHouse
namespace BiochemistryEnzymologyCanonicalLaneLean

structure EnzymeInhibitionMechanismsPackage
    {K : MichaelisMentenKineticsPackage} where
  competitiveInhibition : Prop
  uncompetitiveInhibition : Prop
  noncompetitiveInhibition : Prop
  mixedInhibition : Prop
  inhibitionConstant : Prop
  reversibility : Prop

structure EnzymeInhibitionMechanismsEvidence
    {K : MichaelisMentenKineticsPackage}
    (I : EnzymeInhibitionMechanismsPackage K) where
  competitiveInhibitionClosed : I.competitiveInhibition
  uncompetitiveInhibitionClosed : I.uncompetitiveInhibition
  noncompetitiveInhibitionClosed : I.noncompetitiveInhibition
  mixedInhibitionClosed : I.mixedInhibition
  inhibitionConstantClosed : I.inhibitionConstant
  reversibilityClosed : I.reversibility

def EnzymeInhibitionMechanismsClosed
    {K : MichaelisMentenKineticsPackage}
    (I : EnzymeInhibitionMechanismsPackage K) : Prop :=
  I.competitiveInhibition ∧ I.uncompetitiveInhibition ∧
  I.noncompetitiveInhibition ∧ I.mixedInhibition ∧
  I.inhibitionConstant ∧ I.reversibility

theorem enzyme_inhibition_mechanisms_closed_from_evidence
    {K : MichaelisMentenKineticsPackage}
    (I : EnzymeInhibitionMechanismsPackage K)
    (E : EnzymeInhibitionMechanismsEvidence I) :
    EnzymeInhibitionMechanismsClosed I := by
  exact And.intro E.competitiveInhibitionClosed
    (And.intro E.uncompetitiveInhibitionClosed
      (And.intro E.noncompetitiveInhibitionClosed
        (And.intro E.mixedInhibitionClosed
          (And.intro E.inhibitionConstantClosed
            E.reversibilityClosed))))

end BiochemistryEnzymologyCanonicalLaneLean
end HautevilleHouse