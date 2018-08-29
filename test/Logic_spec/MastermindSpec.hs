module Logic_spec.MastermindSpec where

import Logic.Mastermind
import Test.Tasty
import Test.Tasty.Hspec
import Control.Exception (evaluate)


spec_hspecSuite :: Spec
spec_hspecSuite = describe "Mastermind logic tests" $ do
  
    let defaultCode = [White, Black, Red, Yellow] 

    it "should be an Enum" $
      White `shouldBe` (White :: Pegs) 

    it "should be a list of Pegs" $
      [ White, Black, Red ] `shouldBe` ([ White, Black, Red ] :: [Pegs])

    it "should return a list of (default) peg colors" $ --pending
      setUpGame `shouldBe` defaultCode

    it "should randomize secret" $ --pending
      randomizeCode `shouldNotBe` defaultCode

    it "should return all Black response for correct guess" $ --pending
      checkGuess `shouldBe` [BLACK, BLACK, BLACK, BLACK]

    it "should return one White response for one correct color in wrong spot" $ --pending
      checkGuess `shouldBe` [WHITE, EMPTY, EMPTY, EMPTY]

    it "should return all Empty response for no correct colors" $ --pending
      checkGuess `shouldBe` [EMPTY, EMPTY, EMPTY, EMPTY]

    it "should return all White response for correct colors in wrong spots" $ --pending
      checkGuess `shouldBe` [WHITE, WHITE, WHITE, WHITE]

    it "should return one Black & one White response for one correct color in correct spot & one correct color in wrong spot" $ --pending
      checkGuess `shouldBe` [BLACK, WHITE, EMPTY, EMPTY]
