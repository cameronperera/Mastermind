module Logic_spec.MastermindSpec where

import Logic.Mastermind
import Test.Tasty
import Test.Tasty.Hspec
import Control.Exception (evaluate)

spec_hspecSuite :: Spec
spec_hspecSuite = describe "Mastermind logic" $ do
    it "should be an Enum" $
      White `shouldBe` (White :: Pegs) 

    it "should be a list of Pegs" $
      [ White, Black, Red ] `shouldBe` ([ White, Black, Red ] :: [Pegs])

    it "should equal 'anotherFunc' from Mastermind module" $
      anotherFunc `shouldBe` [White, Black, Red, Yellow]
