module CustomDataTypes.Pegs where

data Pegs = White | Black | Red | Yellow | Green | Blue deriving (Eq, Ord, Show, Read, Bounded, Enum)
