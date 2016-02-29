module GameState where

import GameData (GameData)

data GameState = StartMenu | Game GameData Settings
