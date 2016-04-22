import XMonad
import XMonad.Util.EZConfig(additionalKeysP)
import qualified XMonad.StackSet as W
import XMonad.Config.Desktop

import XMonad.Layout.EqualSpacing
import XMonad.Hooks.ManageDocks

customLH = avoidStruts $ ( equalSpacing 36 0 0 0 $ layoutHook defaultConfig )
customMH = manageHook desktopConfig <+> manageDocks

main = do
  xmonad $ defaultConfig
    { 
      terminal = "xterm",
      borderWidth = 0,
      focusedBorderColor = "#3D3D3D",
      normalBorderColor = "#454545",
      layoutHook = customLH,
      manageHook = customMH
    } `additionalKeysP` [
			 ("M-[", sendMessage $ LessSpacing),
			 ("M-]", sendMessage $ MoreSpacing),
			 ("M-t", withFocused $ windows . W.sink),
			 ("M-w", spawn "firefox-nightly"),
			 ("M-c", spawn "urxvt"),
			 ("M-x", kill),
			 ("M-f", spawn "pcmanfm")
			]
