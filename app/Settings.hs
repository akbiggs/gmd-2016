module Settings where

data Setting =
    Resolution (Int, Int)
    | Fullscreen Bool
    | Difficulty String

type Settings = [Setting]
