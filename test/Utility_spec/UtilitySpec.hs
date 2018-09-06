module Utility_spec.UtilitySpec where

import Utility.Utility
import Logic.Mastermind
import Test.Tasty
import Test.Tasty.Hspec

spec_utility :: Spec
spec_utility = describe "Utility tests" $ do
    it "should take 'black' and return a Black Peg" $
      convertStringToPeg "black" `shouldBe` Black

    it "should convert user input to list of Pegs" $ 
      convertGuessToPegs ["black", "white", "red", "yellow"] `shouldBe` [Black, White, Red, Yellow]

    it "should end the game after 20 guess" $ 
      isNoMoreGuess 20 `shouldBe` True

    it "should not end the game if guesses are less than 20" $ 
      isNoMoreGuess 2 `shouldBe` False

    it "should print the Welcome Message" $
      welcomeMessage `shouldBe` "Welcome to MasterMind!\nA secret code has been generated\nCan you guess it?\nYou only get 20 guesses!"

    it "should print example guess" $
      exampleGuess `shouldBe` "Guess example: \"white black red blue\""

    it "should print the startMessage" $
      startMessage `shouldBe` "Would you like to play MasterMind?\n[y]es or [n]o: "

    it "should return a list of guesses from string" $
      convertUserGuessToList "black white red blue" `shouldBe` ["black", "white", "red", "blue"]

    it "should take list of Responses and return string" $
      convertResponsesListToString [BLACK, BLACK, WHITE, EMPTY] `shouldBe` "BLACK BLACK WHITE EMPTY"
