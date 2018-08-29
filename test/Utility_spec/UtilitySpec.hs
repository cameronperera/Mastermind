module Utility_spec.UtilitySpec where

import Utility.Utility
import Logic.Mastermind
import Test.Tasty
import Test.Tasty.Hspec

spec_utility :: Spec
spec_utility = describe "Utility tests" $ do
    it "should convert user input to list of Pegs" $ --pending
      convertGuess `shouldBe` [Black, White, Red, Yellow]

    it "should end the game after 20 guess" $ --pending
      isGameOver 20 `shouldBe` True

    it "should end the game if correct guess is made" $ --pending
      isGameOver 2 `shouldBe` True