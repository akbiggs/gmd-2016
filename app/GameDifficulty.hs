module Difficulty where

data GameDifficulty =
    Easy
    | Medium
    | Hard
    | Impossible

instance Show GameDifficulty where
    show Easy = "Easy"
    show Medium = "Medium"
    show Hard = "Hard"
    show Impossible = "Impossible"
