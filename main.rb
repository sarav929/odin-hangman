require_relative 'lib/game.rb'
require 'yaml'
require 'pry'

WORDS_ARRAY = []
file = File.readlines('google-10000-english-no-swears.txt')
file.each do |el|
  if el.length >= 5 && el.length <= 12
    WORDS_ARRAY << el
  end
end

ASCII_ART= ['''
 +----+
  |   |
      |
      |
      |
      |
========''', '''
 +----+
  |   |
  O   |
      |
      |
      |
========''', '''
 +----+
  |   |
  O   |
  |   |
      |
      |
========''', '''
 +----+
  |   |
  O   |
 /|   |
      |
      |
========''', '''
 +----+
  |   |
  O   |
 /|\  |
      |
      |
========''', '''
 +----+
  |   |
  O   |
 /|\  |
 /    |
      |
========''', '''
 +----+
  |   |
  O   |
 /|\  |
 / \  |
      |
========''']

MAX_FAILS = ASCII_ART.length

puts "Let's play Hangman! Would you like to\n(1) Start a new game\n(2) Load a saved game"
while input = gets.chomp
  if input != "1" and input != "2"
    puts "Try again. Enter either 1 or 2."
  else
    hangman = Game.new("", 0, [])
    secret_word = hangman.create_secret_word
    if input == "2"
      hangman.load_game
    end
    hangman.play(ASCII_ART)
    break                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
  end
end




  






