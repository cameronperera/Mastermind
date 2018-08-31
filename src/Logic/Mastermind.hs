module Logic.Mastermind where

-- import System.Random


data Pegs = White | Black | Red | Yellow | Green | Blue deriving (Eq, Ord, Show, Read, Bounded, Enum)
data Responses = BLACK | WHITE | EMPTY deriving (Eq, Ord, Show, Read, Bounded, Enum)

-- ranNum :: IO Int
-- ranNum = getStdRandom ( randomR (0, 5))

setUpGame :: [Pegs]
setUpGame = [ White, Black, Red, Yellow ]

randomizeCode :: [Pegs]
randomizeCode = undefined

findAllBlacks :: [Pegs] -> [Pegs] -> [Pegs]
findAllBlacks secretCode guess = map fst . filter (\(x,y) -> x == y) $ zip secretCode guess

findAllWhites :: [Pegs] -> [Pegs] -> [Pegs]
findAllWhites secretCode guess = filter (`elem` secretCode) guess

checkGuess :: [Pegs] -> [Pegs] -> [Responses]
checkGuess secretCode guess = 
  let blacks = length $ findAllBlacks secretCode guess
      whites = length $ findAllWhites secretCode guess
  in replicate blacks BLACK ++ replicate (whites - blacks) WHITE
  -- replicate (length findAllBlacks secretCode guess) BLACK ++ replicate ((length findAllWhites - length findAllBlacks) secretCode guess) WHITE
  -- findAllBlacks (head secretCode) (head guess)
  -- if secretCode == guess
  -- then [BLACK, BLACK, BLACK, BLACK]
  -- else [EMPTY, EMPTY, EMPTY, EMPTY]


-- nameOfList !! n  ----> this will find item at nth index of list