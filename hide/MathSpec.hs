{-# LANGUAGE ScopedTypeVariables #-}

module MathSpec where 

import Test.Tasty.Hspec
import Math


spec_main :: Spec
spec_main = describe "absolute" $
    it "returns the original number when given a positive input" $
      absolute 1 `shouldBe` 1

    it "returns a positive number when given a negative input" $
      absolute (-1) `shouldBe` 1

    it "returns zero when given zero" $
      absolute 0 `shouldBe` 0