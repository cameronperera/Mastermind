module Game where

import Logic.Mastermind
import Utility.Utility

engine :: [Pegs] -> [Pegs] -> String
engine secretCode guess = do
          let numOfBlackPegs = findAllBlacks secretCode guess
          let numOfWhitePegs = findAllWhites secretCode guess
          let response = getResponse (length numOfBlackPegs) (length numOfWhitePegs)
          convertResponsesListToString response
