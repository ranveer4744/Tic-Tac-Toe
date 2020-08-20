# Tic-Tac-Toe
This repository contains a Tic Tac Toe game written in Ruby, with an optional A.I. computer player.

## What is it?
Tic-tac-toe is a game for where players take turns marking the spaces in a N×N grid, where N is a natural number. The player who succeeds in placing N of their marks in a horizontal, vertical, or diagonal row is the winner. 

This implementation can contain any number of rowsxcolumns the user requires. Also this game can accept more than 2 players including A.I. computer players.

## How does it work?
There are 4 classes (computer_player, human_player, game, board). 

The board class creates the board, places marks onto the board, and checks if someone has won. 

The A.I. computer player is naive. The computer_player class is gets all of the possible positions on the board and arbitrarily selects one of the positions and places its' mark on that spot. 

The human_player class gets a valid position from the human player are returns the position as coordinates for the board class.

The game class rotates the player array so each player can take their turn in the correct order. It also contains a while loop which is used to play the game.

## Demo (4 A.I. computer players on a 5x5 board)
![alt-text](https://media.giphy.com/media/Sr3LBhy05LYMCsszu3/giphy.gif)

![alt-text](https://github.com/ranveer4744/Tic-Tac-Toe/blob/master/screenshot_tic.png)

*Game ends in a draw.
