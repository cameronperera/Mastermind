module Game where

import Logic.Mastermind
import Utility.Utility
import System.Exit (exitSuccess)

engine :: [Pegs] -> [Pegs] -> String
engine secretCode guess = do
          let numOfBlackPegs = findAllBlacks secretCode guess
          let numOfWhitePegs = findAllWhites secretCode guess
          let response = getResponse (length numOfBlackPegs) (length numOfWhitePegs)
          convertResponsesListToString response

gameLoop :: [Pegs] -> Int -> IO ()
gameLoop secretCode counter = do
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
      gameLoop secretCode newCounter