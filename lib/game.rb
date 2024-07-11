class Game
  def initialize(words, fails)
    @words = words
    @fails = fails
  end

  def create_secret_word
    @secret_word = @words[rand(@words.length)].chomp
  end

  def make_guess
    if @empty_array == nil
      @empty_array = []
      @secret_word.length.times do 
        @empty_array << "_"
      end
    end
    puts "Make your guess:\n\n #{@empty_array.join}\n\n"

    while @letter = gets.chomp.upcase
      if !@letter.match?(/[A-Z]/) or @letter.length != 1
        puts "Try again, type a letter from A to Z."
      else
        return @letter
      end
    end
  end
  

  def check_guess(ascii_art)
    @word_array = @secret_word.upcase.split('')
    if @word_array.include?(@letter)
      @word_array.each_with_index do |char, index|
        if char == @letter
          if @empty_array[index] == "_"
            @empty_array[index] = @letter
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
    if !@empty_array.include?('_')
      puts "YOU WON!"
      return true
    else
      return false
    end
  end

  def check_fails 
    if @fails == MAX_FAILS
      puts "YOU LOST. The secret word was: #{@secret_word}"
      return true
    else
      return false
    end
  end

  def play(ascii_art)
    while true
      make_guess
      if check_guess(ascii_art)
        if check_winner
          break
        end
      else
        if check_fails
          break
        end
      end
    end
  end

end