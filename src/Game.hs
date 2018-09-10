module Game where

import Logic.Mastermind
import Utility.Utility
import System.Exit (exitSuccess)

engine :: [Pegs] -> [Pegs] -> String
engine secretCode guess = do
          let numOfBlackPegs = length $ findAllBlacks secretCode guess
          let refinedSecretCode = removeBLACKMatches guess secretCode
          let refinedGuess = removeBLACKMatches secretCode guess
          let numOfWhitePegs = length $ findAllWhites refinedSecretCode refinedGuess
          let response = getResponse numOfBlackPegs numOfWhitePegs
          convertResponsesListToString response

gameLoop :: [Pegs] -> Int -> IO ()
gameLoop secretCode counter = do
  putStrLn "Colors: white, black, red, yellow, green, blue"
  putStrLn "Make your guess: "
  userGuess <- getLine
  let guess = convertGuessToPegs $ convertUserGuessToList userGuess
  let newCounter = counter + 1
  if secretCode == guess
  then do
    putStrLn winMessage
    exitSuccess
  else if counter >= 19
    then do
      putStrLn failMessage
      exitSuccess
    else do
      let response = engine secretCode guess
      putStrLn response
      putStrLn ""
      gameLoop secretCode newCounter