module Logic_spec.MastermindSpec where

import Logic.Mastermind
import Test.Tasty
import Test.Tasty.Hspec
import Control.Exception (evaluate)

spec_Logic :: Spec
spec_Logic = describe "Mastermind logic tests" $ do
  
    let defaultCode = [White, Black, Red, Yellow] 

    it "should be a Pegs Enum" $
      White `shouldBe` (White :: Pegs) 

    it "should be a list of Pegs" $
      [ White, Black, Red ] `shouldBe` ([ White, Black, Red ] :: [Pegs])

    it "should return a list of (default) peg colors" $
      setUpGame `shouldBe` defaultCode

    it "should randomize secret" $
      randomizeCode 42 `shouldNotBe` defaultCode

    it "should return all Black response for correct guess" $
      getResponse 4 4 `shouldBe` [BLACK, BLACK, BLACK, BLACK]

    it "should return one Black response for one correct color in correct spot" $
      getResponse 1 1 `shouldBe` [BLACK, EMPTY, EMPTY, EMPTY]

    it "should return one White response for one correct color in wrong spot" $
      getResponse 0 1 `shouldBe` [WHITE, EMPTY, EMPTY, EMPTY]

    it "should return all Empty response for no correct colors" $
      getResponse 0 0 `shouldBe` [EMPTY, EMPTY, EMPTY, EMPTY]

    it "should return all White response for correct colors in wrong spots" $
      getResponse 0 4 `shouldBe` [WHITE, WHITE, WHITE, WHITE]

    it "should return one Black & one White response for one correct color in correct spot & one correct color in wrong spot" $
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

    it "should return a single White Peg color related to the index passed into 'selectPegFromIndex'" $
      selectPegFromIndex 0 `shouldBe` White

    it "should return a single Black Peg color related to the index passed into 'selectPegFromIndex'" $
      selectPegFromIndex 1 `shouldBe` Black

    it "should return a single Red Peg color related to the index passed into 'selectPegFromIndex'" $
      selectPegFromIndex 2 `shouldBe` Red

    it "should return a single Yellow Peg color related to the index passed into 'selectPegFromIndex'" $
      selectPegFromIndex 3 `shouldBe` Yellow

    it "should return a single Green Peg color related to the index passed into 'selectPegFromIndex'" $
      selectPegFromIndex 4 `shouldBe` Green

    it "should return a single Blue Peg color related to the index passed into 'selectPegFromIndex'" $
      selectPegFromIndex 5 `shouldBe` Blue
