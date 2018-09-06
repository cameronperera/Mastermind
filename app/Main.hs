module Main where

import Game
import Logic.Mastermind
import Utility.Utility
import System.Random
import System.Exit (exitSuccess)
import System.Process
import Control.Concurrent
import Data.Time.Clock


main :: IO ()
main = do
    putStrLn welcomeMessage
    putStrLn exampleGuess
    putStrLn startMessage
    startChoice <- getLine
    if startChoice == "n"
      then exitSuccess
      else do
        currentTime <- getCurrentTime
        let time = floor $ utctDayTime currentTime :: Int
        let secretCode = randomizeCode time
        print secretCode
        let counter = 0
        threadDelay 1000000
        system "cls"
        gameLoop secretCode counter
