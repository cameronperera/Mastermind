module MainSpec where

import Test.Tasty
import Test.Tasty.Hspec
import Control.Exception (evaluate)
import System.Random

spec_main :: Spec
spec_main = describe "Prelude.head" $ do
    it "returns the first element of a list" $
      head [23 ..] `shouldBe` (23 :: Int)
  