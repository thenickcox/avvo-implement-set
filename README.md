# Introduction

Greetings, Avvo engineering team! Enclosed, please find my submission for the coding challenge.

Thank you so much for your time in reviewing this code, and I look forward to meeting with you in person!

Sincerely,
Nick

## Requirements

According to the specification document, there were three requirements for the game modeling:

1. A method that takes three cards, and determines whether the three cards make a set
2. A method that given a "board" of cards, will either find a set, or determine if there are no sets on the table
3. A method that will play an entire game of Set, from beginning to end, and return a list of each valid sets
you removed from the board

Here are the locations of the solutions:

1. `SetManager#set?` (found in `lib/set_manager.rb`)
2. `BoardManager#find_set` (found in `lib/board_manager.rb`)
3. `GameManager#play` (found in `lib/game_manager.rb`)

## Running the Code

From the project root, simply run:

`ruby lib/play_game.rb`

The output in `STDOUT` will notify you that the game has ended, the number of sets found through the course of the game, and the individual sets found.

## Running the tests

From the project root, simply run:

`rspec`
