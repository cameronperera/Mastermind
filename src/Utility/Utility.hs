module Utility.Utility where

import Logic.Mastermind

convertStringToPeg :: String -> Pegs
convertStringToPeg "White" = White
convertStringToPeg "Black" = Black
convertStringToPeg "Red" = Red
convertStringToPeg "Yellow" = Yellow
convertStringToPeg "Green" = Green
convertStringToPeg "Blue" = Blue

convertGuess :: [String] -> [Pegs]
convertGuess = map convertStringToPeg

isNoMoreGuess :: Int -> Bool
isNoMoreGuess numberOfGuesses = numberOfGuesses >= 20