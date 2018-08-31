module Utility_spec.UtilitySpec where

import Utility.Utility
import Logic.Mastermind
import Test.Tasty
import Test.Tasty.Hspec

spec_utility :: Spec
spec_utility = describe "Utility tests" $ do
    it "should take 'Black' and return a Black Peg" $
      convertStringToPeg "Black" `shouldBe` Black

    it "should convert user input to list of Pegs" $ 
      convertGuess ["Black", "White", "Red", "Yellow"] `shouldBe` [Black, White, Red, Yellow]

    it "should end the game after 20 guess" $ 
      isNoMoreGuess 20 `shouldBe` True

    it "should not end the game if guesses are less than 20" $ 
      isNoMoreGuess 2 `shouldBe` False
