module Logic.Mastermind where

myFunction :: IO ()
myFunction = putStrLn "myFunction"

data Pegs = White | Black | Red | Yellow | Green | Blue deriving (Eq, Ord, Show, Read, Bounded, Enum)
data Responses = BLACK | WHITE | Empty deriving (Eq, Ord, Show, Read, Bounded, Enum)

anotherFunc :: [Pegs]
anotherFunc = [ White, Black, Red, Yellow ]