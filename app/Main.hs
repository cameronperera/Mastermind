module Main where

import Lib
import Logic.Mastermind
import System.Random

ranNum :: IO Int
ranNum = getStdRandom ( randomR (0, 5))

main :: IO ()
main = do
    someFunc
    myFunction
    ranNum >>= print
