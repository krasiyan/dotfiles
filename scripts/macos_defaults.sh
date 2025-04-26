#!/bin/bash

# Inspired by https://mths.be/macos
# (https://github.com/mathiasbynens/dotfiles/blob/main/.macos)

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

###############################################################################
# General UI/UX                                                               #
###############################################################################

# Disable the sound effects on boot
# sudo nvram SystemAudioVolume=" "

# Disable automatic capitalization as it’s annoying when typing code
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# Disable smart dashes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Disable automatic period substitution as it’s annoying when typing code
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# Disable smart quotes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Ctrl-Opt-Cmd to drag a window from any location
defaults write -g NSWindowShouldDragOnGesture -bool true

# Disable window opening animations
defaults write -g NSAutomaticWindowAnimationsEnabled -bool false

# Save screenshots to ~/screenshots
defaults write com.apple.screencapture "location" -string "~/screenshots"

###############################################################################
# Trackpad, mouse, keyboard, Bluetooth accessories, and input                 #
###############################################################################

# Disable “natural” scrolling
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# Function keys standard behavior
defaults write NSGlobalDomain com.apple.keyboard.fnState -bool true

# Keyboard navigation with Tab / Shift-Tab
defaults write NSGlobalDomain AppleKeyboardUIMode -int "2"

# Trackpad: enable tap to click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true

# Trackpad: map bottom right corner to right-click
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 2


###############################################################################
# Finder                                                                      #
###############################################################################

# Show file extensions everywhere
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Show hidden files
defaults write com.apple.finder AppleShowAllFiles -bool true

###############################################################################
# Finder                                                                      #
###############################################################################

# Autohide the dock
defaults write com.apple.dock "autohide" -bool "true"

# Path bar at the bottom of Finder windows
defaults write com.apple.finder "ShowPathbar" -bool "true"

# Save to home folder instead of iCloud by default
defaults write NSGlobalDomain "NSDocumentSaveNewDocumentsToCloud" -bool "false"

# Show drives on Desktop
defaults write com.apple.finder "ShowHardDrivesOnDesktop" -bool "true"

# Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Set a fast key repeat rate
defaults write NSGlobalDomain KeyRepeat -int 0
defaults write NSGlobalDomain InitialKeyRepeat -int 10

echo "Don't forget to reboot!"
