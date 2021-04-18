{-# LANGUAGE DeriveGeneric, OverloadedLabels #-}
module Main where

import Optics.Core
import GHC.Generics (Generic)

data User p = User { name :: String, age :: Int }
  deriving (Show, Generic)

getName_gotoWorks :: User p -> String
getName_gotoWorks u = name u

getName_gotoDoesntWork :: User p -> String
getName_gotoDoesntWork u = u ^. #name

setFields_ambiguousMiddleType :: User p -> User p
setFields_ambiguousMiddleType u = u & #name .~ "Tom"
                                    & #age .~ 45

main :: IO ()
main = pure ()
