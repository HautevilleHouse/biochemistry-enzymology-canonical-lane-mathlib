import BiochemistryEnzymologyCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BiochemistryEnzymologyCanonicalLaneLean

structure EnzymeTheoremStatement where
  sourceKey : String
  theoremName : String
  theoremObject : String
  classicalBoundary : String
  enzymeConstrainedStatement : String
  certificateLane : String
  carriedRemainder : String

def sourceTheoremStatement : EnzymeTheoremStatement :=
  {
    sourceKey := "biochemistry-enzymology-canonical-lane"
    theoremName := "Michaelis-Menten-steady-state"
    theoremObject := "Michaelis-Menten kinetic model for single-substrate enzyme"
    classicalBoundary := "classical boundary: all enzyme systems with arbitrary substrate concentration"
    enzymeConstrainedStatement := "enzyme-concentrated with baseline admissibility conditions"
    certificateLane := "enzyme_constrained"
    carriedRemainder := "carried remainder: substrate binding and catalysis efficiency"
  }

end BiochemistryEnzymologyCanonicalLaneLean
end HautevilleHouse