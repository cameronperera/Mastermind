{-# LANGUAGE FlexibleContexts #-}
module Logic.Mastermind where

import Control.Exception (evaluate)
import Data.List
import System.Random


data Pegs = White | Black | Red | Yellow | Green | Blue deriving (Eq, Ord, Show, Read, Bounded, Enum)
data Responses = BLACK | WHITE | EMPTY deriving (Eq, Ord, Show, Read, Bounded, Enum)

randomIndex :: StdGen -> (Int, StdGen)
randomIndex = randomR (0,5)

makeSeed :: Int -> Int -> StdGen
makeSeed currentTime num = mkStdGen $ currentTime * num

selectPegFromIndex :: Int -> Pegs
selectPegFromIndex = toEnum

randomizeCode :: Int -> [Pegs]
randomizeCode currentTime =
  let indexOne = randomIndex (mkStdGen $ currentTime * 52345)
      indexTwo = randomIndex $ snd indexOne
      indexThree = randomIndex $ snd indexTwo
      indexFour = randomIndex $ snd indexThree
  in
    [selectPegFromIndex $ fst indexOne
    , selectPegFromIndex $ fst indexTwo
    , selectPegFromIndex $ fst indexThree
    , selectPegFromIndex $ fst indexFour]

findAllBlacks :: [Pegs] -> [Pegs] -> [Pegs]
findAllBlacks secretCode guess = map fst . filter (uncurry (==)) $ zip secretCode guess

removeBLACKMatches :: [Pegs] -> [Pegs] -> [Pegs]
removeBLACKMatches firstList returnedList = map fst . filter (uncurry (/=)) $ zip firstList returnedList

findAllWhites :: [Pegs] -> [Pegs] -> [Pegs]
findAllWhites secretCode guess = filter (`elem` nub secretCode) guess

getResponse :: Int -> Int -> [Responses]
getResponse blacks whites = 
  let totalLength = blacks + whites
  in 
    replicate blacks BLACK 
    ++ replicate whites WHITE
    ++ replicate (4 - totalLength) EMPTY
