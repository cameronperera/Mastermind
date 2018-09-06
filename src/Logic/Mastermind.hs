module Logic.Mastermind where

import Control.Exception (evaluate)
import System.Random


data Pegs = White | Black | Red | Yellow | Green | Blue deriving (Eq, Ord, Show, Read, Bounded, Enum)
data Responses = BLACK | WHITE | EMPTY deriving (Eq, Ord, Show, Read, Bounded, Enum)

randomIndex :: StdGen -> (Int, StdGen)
randomIndex seed = randomR (0,5) (seed)

makeSeed :: Int -> Int -> StdGen
makeSeed currentTime num = mkStdGen $ currentTime * num

setUpGame :: [Pegs]
setUpGame = [White, Black, Red, Yellow]

selectPegFromIndex :: Int -> Pegs
selectPegFromIndex index = toEnum index

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
findAllBlacks secretCode guess = map fst . filter (\(x,y) -> x == y) $ zip secretCode guess

findAllWhites :: [Pegs] -> [Pegs] -> [Pegs]
findAllWhites secretCode guess = filter (`elem` secretCode) guess

getResponse :: Int -> Int -> [Responses]
getResponse blacks whites = 
  let totalLength = blacks + (whites - blacks)
  in 
    replicate blacks BLACK 
    ++ replicate (whites - blacks) WHITE
    ++ replicate (4 - totalLength) EMPTY
