module Logic.Mastermind where

import Control.Exception (evaluate)
import System.Random


data Pegs = White | Black | Red | Yellow | Green | Blue deriving (Eq, Ord, Show, Read, Bounded, Enum)
data Responses = BLACK | WHITE | EMPTY deriving (Eq, Ord, Show, Read, Bounded, Enum)

randomIndex :: Int
randomIndex = fst $ randomR (0,5) (mkStdGen 66)

setUpGame :: [Pegs]
setUpGame = [White, Black, Red, Yellow]

selectPegFromIndex :: Int -> Pegs
selectPegFromIndex index = toEnum index

randomizeCode :: [Pegs]
randomizeCode = replicate 4 (selectPegFromIndex randomIndex)

findAllBlacks :: [Pegs] -> [Pegs] -> [Pegs]
findAllBlacks secretCode guess = map fst . filter (\(x,y) -> x == y) $ zip secretCode guess

findAllWhites :: [Pegs] -> [Pegs] -> [Pegs]
findAllWhites secretCode guess = filter (`elem` secretCode) guess

checkGuess :: [Pegs] -> [Pegs] -> [Responses]
checkGuess secretCode guess = 
  let blacks = length $ findAllBlacks secretCode guess
      whites = length $ findAllWhites secretCode guess
      totalLength = blacks + (whites - blacks)
  in 
    replicate blacks BLACK 
    ++ replicate (whites - blacks) WHITE
    ++ replicate (4 - totalLength) EMPTY


-- nameOfList !! n  ----> this will find item at nth index of list