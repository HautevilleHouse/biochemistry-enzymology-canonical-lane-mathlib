import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BiochemistryEnzymologyCanonicalLaneLean

structure EnzymeInhibitionPackage where
  inhibitionType : Prop
  inhibitorBinding : Prop
  inhibitionConstant : Prop
  mixedInhibition : Prop
  competitiveModel : Prop
  inhibitionConstantDefined : inhibitionConstant

structure EnzymeInhibitionEvidence (I : EnzymeInhibitionPackage) where
  inhibitionTypeClosed : I.inhibitionType
  inhibitorBindingClosed : I.inhibitorBinding
  inhibitionConstantClosed : I.inhibitionConstant
  mixedInhibitionClosed : I.mixedInhibition
  competitiveModelClosed : I.competitiveModel

def EnzymeInhibitionClosed (I : EnzymeInhibitionPackage) : Prop :=
  I.inhibitionType ∧ I.inhibitorBinding ∧ I.inhibitionConstant ∧
  I.mixedInhibition ∧ I.competitiveModel

theorem enzyme_inhibition_closed_from_evidence (I : EnzymeInhibitionPackage)
    (E : EnzymeInhibitionEvidence I) : EnzymeInhibitionClosed I := by
  exact And.intro E.inhibitionTypeClosed (And.intro E.inhibitorBindingClosed
    (And.intro E.inhibitionConstantClosed (And.intro E.mixedInhibitionClosed
      E.competitiveModelClosed)))

end BiochemistryEnzymologyCanonicalLaneLean
end HautevilleHouse
