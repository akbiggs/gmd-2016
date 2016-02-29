module Menu where

import Settings (Settings)
import GameState (GameState)

data MenuItem = 
    ChangeGameState (String, GameState) |
    ChangeSetting (String, Setting)

type Menu = (Int, [MenuItem])

type MenuPath = [Menu]

createMenu :: [MenuItem] -> Menu
createMenu items = (0, items)

nextIndex :: Int -> [a] -> Int
nextIndex index elements =
    min (index + 1) maxIndex
        where maxIndex = (length elements) - 1

previousIndex :: Int -> [a] -> Int
previousIndex index elements = max (index - 1) 0

getCurrentSelectedMenuItem :: Menu -> MenuItem
getCurrentSelectedMenuItem (selectedIndex, items) =
    items !! selectedIndex

selectNextItem :: Menu -> Menu
selectNextItem (selectedIndex, items) =
    (nextIndex selectedIndex items, items)

selectPreviousItem :: Menu -> Menu
selectPreviousItem (selectedIndex, items) =
    (previousIndex selectedIndex items, items)

executeSelectedItemAction :: Menu -> (Settings, GameState, MenuPath) -> (Settings, GameState, MenuPath)
executeSelectedItemAction menu (settings, gameState, menuPath) =
    case selectedItemAction of
      ChangeSettings f -> (f settings, gameState, menuPath)
      ChangeState f -> (settings, f gameState, menuPath)
      ChangeDisplayedMenu subMenu -> (settings, gameState, menuPath ++ [subMenu])
    where
        (selectedItemName, selectedItemAction) = getCurrentSelectedMenuItem menu
