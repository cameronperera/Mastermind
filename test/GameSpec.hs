module GameSpec where

import Game
import Logic.Mastermind
import Test.Tasty
import Test.Tasty.Hspec

spec_Game :: Spec
spec_Game = describe "Game engine test" $ do

  let secretCode = [White, Black, Red, Yellow]
  let guess = [White, Black, Red, Yellow]

  it "should return a response string - all blacks" $
    engine secretCode guess `shouldBe` "BLACK BLACK BLACK BLACK"

  it "should return a response string - all whites" $
    engine secretCode (reverse guess) `shouldBe` "WHITE WHITE WHITE WHITE"

  it "should return a response string - all empty" $
    engine secretCode [Blue, Blue, Blue, Blue] `shouldBe` "EMPTY EMPTY EMPTY EMPTY"