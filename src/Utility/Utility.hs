{-# LANGUAGE TypeSynonymInstances,  FlexibleInstances, FlexibleContexts #-}
module Utility.Utility where

import Data.Text (toLower)
import Data.List
import Data.List.Split
import Logic.Mastermind

-- add toLower for this function
convertStringToPeg :: String -> Pegs
convertStringToPeg "white" = White
convertStringToPeg "black" = Black
convertStringToPeg "red" = Red
convertStringToPeg "yellow" = Yellow
convertStringToPeg "green" = Green
convertStringToPeg "blue" = Blue

convertGuessToPegs :: [String] -> [Pegs]
convertGuessToPegs = map convertStringToPeg

isNoMoreGuess :: Int -> Bool
isNoMoreGuess numberOfGuesses = numberOfGuesses >= 20

welcomeMessage :: String
welcomeMessage = "Welcome to MasterMind!\nA secret code has been generated\nCan you guess it?\nYou only get 20 guesses!"

exampleGuess :: String
exampleGuess = "Guess example: \"white black red blue\""

startMessage :: String
startMessage = "Would you like to play MasterMind?\n[y]es or [n]o: "

guessMessage :: String
guessMessage = "Make your guess: "

winMessage :: String
winMessage = "You win!!!"

failMessage :: String
failMessage = "Better luck next time!"

convertUserGuessToList :: String -> [String]
convertUserGuessToList guess = splitOn " " guess

convertResponsesListToString :: [Responses] -> String
convertResponsesListToString responses = intercalate " " (map show responses)
