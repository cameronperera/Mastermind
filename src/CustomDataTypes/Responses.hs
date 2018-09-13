module CustomDataTypes.Responses where

data Responses = BLACK | WHITE | EMPTY deriving (Eq, Ord, Show, Read, Bounded, Enum)