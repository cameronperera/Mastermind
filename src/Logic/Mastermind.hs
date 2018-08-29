module Logic.Mastermind where

myFunction :: IO ()
myFunction = putStrLn "myFunction"

data Pegs = White | Black | Red | Yellow | Green | Blue deriving (Eq, Ord, Show, Read, Bounded, Enum)
data Responses = BLACK | WHITE | EMPTY deriving (Eq, Ord, Show, Read, Bounded, Enum)

setUpGame :: [Pegs]
-- setUpGame = [ White, Black, Red, Yellow ]
setUpGame = undefined

randomizeCode :: [Pegs]
randomizeCode = undefined

checkGuess :: [Responses]
checkGuess = undefined
