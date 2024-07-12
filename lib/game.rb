class Game
  def initialize(secret_word, fails, guess_array)
    @secret_word = secret_word
    @fails = fails
    @guess_array = guess_array
  end

  def save_game
    data = {
      secret_word: @secret_word,
      fails: @fails,
      guess_array: @guess_array
    }
    File.open("saved_game.yaml", "w") { |file| file.write(YAML.dump(data)) }
    puts "Data saved correctly.\n"
  end

  def load_game
    if File.exist?("saved_game.yaml")
      data = YAML.load_file("saved_game.yaml")
      @secret_word = data[:secret_word]
      @fails = data[:fails]
      @guess_array = data[:guess_array]
      puts "Data loaded correctly.\n"
    else
      puts "No saved game found.\n"
    end
  end

  def create_secret_word
    @secret_word = WORDS_ARRAY[rand(WORDS_ARRAY.length)].chomp
  end

  def make_guess
    if @guess_array == []
      @secret_word.length.times do 
        @guess_array << "_"
      end
    end
    puts "Type (SAVE) to save the game or type a letter a-z to make your guess:\n\n #{@guess_array.join}\n\n"

    while @letter = gets.chomp.upcase
      if @letter.match?(/[A-Z]/) and @letter.length == 1 
        return @letter
        break
      elsif @letter == "SAVE"
        self.save_game
        break
      else
        puts "Try again, type a letter from A to Z or (SAVE) to save the game."        
      end
    end
  end
  

  def check_guess(ascii_art)
    @word_array = @secret_word.upcase.split('')
    if @word_array.include?(@letter)
      @word_array.each_with_index do |char, index|
        if char == @letter
          if @guess_array[index] == "_"
            @guess_array[index] = @letter
          else
            puts "You already got that right."
          end
        end
      end        
    else
      @fails += 1
      puts "#{ascii_art[@fails - 1]}\n\n"
    end
  end


  def check_winner
    if !@guess_array.include?('_')
      puts "\nYOU WON! The secret word was: #{@secret_word.upcase}"
      return true
    else
      return false
    end
  end
  def check_fails
    if @fails == MAX_FAILS
      puts "\nYOU LOST. The secret word was: #{@secret_word.upcase}"
      return true
    else
      return false
    end
  end

  def play(ascii_art)
    loop do
      make_guess
      if check_guess(ascii_art)
        if check_winner
          return false
        end
      else
        if check_fails
          return false
        end
      end
    end
  end


  

end