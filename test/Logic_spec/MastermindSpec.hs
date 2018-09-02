module Logic_spec.MastermindSpec where

import Logic.Mastermind
import Test.Tasty
import Test.Tasty.Hspec
import Control.Exception (evaluate)


spec_hspecSuite :: Spec
spec_hspecSuite = describe "Mastermind logic tests" $ do
  
    let defaultCode = [White, Black, Red, Yellow] 

    it "should be a Pegs Enum" $
      White `shouldBe` (White :: Pegs) 

    it "should be a list of Pegs" $
      [ White, Black, Red ] `shouldBe` ([ White, Black, Red ] :: [Pegs])

    it "should return a list of (default) peg colors" $
      setUpGame `shouldBe` defaultCode

    it "should randomize secret" $ --pending
      randomizeCode `shouldNotBe` defaultCode

    it "should return all Black response for correct guess" $
      getResponse 4 4 `shouldBe` [BLACK, BLACK, BLACK, BLACK]

    it "should return one Black response for one correct color in correct spot" $ --pending
      getResponse 1 1 `shouldBe` [BLACK, EMPTY, EMPTY, EMPTY]

    it "should return one White response for one correct color in wrong spot" $ --pending
      getResponse 0 1 `shouldBe` [WHITE, EMPTY, EMPTY, EMPTY]

    it "should return all Empty response for no correct colors" $ --pending
      getResponse 0 0 `shouldBe` [EMPTY, EMPTY, EMPTY, EMPTY]

    it "should return all White response for correct colors in wrong spots" $ --pending
      getResponse 0 4 `shouldBe` [WHITE, WHITE, WHITE, WHITE]

    it "should return one Black & one White response for one correct color in correct spot & one correct color in wrong spot" $ --pending
      getResponse 1 2 `shouldBe` [BLACK, WHITE, EMPTY, EMPTY]

    it "should return list of 2 matching Pegs between two list of Pegs" $
      findAllWhites defaultCode [Red, Yellow, Green, Blue] `shouldBe` [Red, Yellow]

    it "should return list of 1 matching Pegs between two list of Pegs" $
      findAllWhites [Blue, Blue, White, White] [Red, Yellow, Green, Blue] `shouldBe` [Blue]

    it "should return list of 1 matching Peg between two list of Pegs" $
      findAllWhites defaultCode [Red, Blue, Green, Blue] `shouldBe` [Red]

    it "should return the items that match eachother in two list of Pegs - all match" $
      findAllBlacks defaultCode defaultCode `shouldBe` defaultCode

    it "should return the items that match eachother in two list of Pegs - two match" $
      findAllBlacks defaultCode [White, Black, Yellow, Green] `shouldBe` [White, Black]

