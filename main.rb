require_relative 'lib/game.rb'

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

words = []
file = File.readlines('google-10000-english-no-swears.txt')
file.each do |el|
  if el.length >= 5 && el.length <= 12
    words << el
  end
end

hangman = Game.new(words)

secret_word = hangman.create_secret_word
puts secret_word




