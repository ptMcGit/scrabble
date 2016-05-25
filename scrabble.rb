# Scrabble
require "pry"

m_input = {}
player_h = {}
player_num = 1
total = 0

def letters_in_string(string, char)
  string.include? char
end

def valid_hints chars, words
  valid_hint = []
  words.select do |word|
    include = true
    chars.each do |char|
      if not word.include? char
        include = false
      end
    end
    if include
      valid_hint.push word
    end
  end

  binding.pry
  return valid_hint
end

#puts valid_hints ["a", "v", "l"], ["arp", "ave", "vale"] 

def page_string(array_of_words)
  columns = system("echo $COLUMNS") # probably not portable
  accumulator = 0
  array_of_words.each do |a|
    accumulator += a.length + 1
    if accumulator == columns
      print a + "\n"
      accumulator = 0 - 1 + a.length
    else
      print a + " "
    end
  end
end

#page_string a

#exit
#text

# until 
# rotate n times
# if sliceable
#   recurse on a
#       recurse on b

# def rotate_string(word)
#   while word / 2 > 

# word.each_slice(2).to_a

# def rotate_string(word)
#   # rotate word
#   word = word.split("")
#   ret_string = ""
#   word.length < 2 return word
#   1.upto word.length do |x|
#     puts word.rotate(x).join
    
#     ret_string += word.rotate(x).join
#     ret_string += "\n"
#   end
#   ret_string
# end


# def mutate_string(word)
#   if word.length < 2
#     return word
#   else
#     split_word=
#     puts rotate_string(word)
#   end
# end


#  return "something else"
#end

#puts mutate_string("h")


#puts rotate_string("hey")

#exit

# initialize words

def load_words (file)

  # load in words from file that are of lengths between min and max
  print "Loading words ...\n"

  min = 6
  max = 10
  valid_words = []
  File.open(file, "r") do |f_handle|
    f_handle.each_line do |line|
      line = line.chomp
      if line.length <= max && line.length >= min
        valid_words.push line
      end
    end
  end
  return valid_words
end

valid_words = load_words("/usr/share/dict/words")

# initialize letter_values

letter_values = {}
{
  1 => %w(a e i o u l n s t r),
  2 => %w(d g),
  3 => %w(b c m p),
  4 => %w(f h v w y),
  5 => %w(k),
  8 => %w(j x),
  10 => %w(q z)
}.map { |key, value| value.each do |x| letter_values[x] = key end }

def print_scores(hash)
  scores = ""
  hash.each do | value |
    scores +=  "Player #{value.first} scores: "
    value.to_a[1].to_a.each do | arr |
      scores += "#{arr[0]}: #{arr[1]} "
    end
    scores += "\n"
  end
  #scores += "\n\n"
  return scores
end

def print_prompt
  print "(1) Quit (2) Write Score to file (3) Undo\n"
  print "Enter word: "
end

def score_word(letter_values, word)
  # calculate score for word and return it
  score = 0
  word = word.split("")
  word.each do |letter|
    score += letter_values[letter].to_i
  end
  return score
end

system("date")

def write_scores(scores)
  save_file = "scrabble_score_sheet"
  f = File.open(save_file, "w+")
  f.puts("Scrabble Scores")
  f.puts(Time.now)
  f.puts(scores)
  f.close
  puts "Wrote to #{save_file}"
end

test_hash={
  1=>{
    :Max=>100,
    :Total=>400,
  },
  2=>{
    :Max=>230,
    :Total=>320,
  },
}

def start_menu
  system("clear")
  puts "ScrabbleScore Main Menu:"
  print "(1) start game (2) set players (3) quit.\n"
  return gets.chomp
end

def game_menu(player, score_sheet)
  print_scores(score_sheet)
  if score_sheet.length > 0
    puts print_scores(score_sheet)
  end
  #binding.pry
  puts "ScrabbleScore Game Menu:"
  print "(1) new game (2) save output (3) quit\n"
  print "Player #{player}, what is your word? "
  user_input = gets.chomp
end

def set_players
  system("clear")
  number = nil
  while number.to_s.to_i != number
    print "How many players? "
    number = gets.chomp.to_i
    #binding.pry
  end
  return number
end

player = nil
reply = 0

until ((reply = start_menu.to_s.to_i) == 1)
  if reply == 2
    player = (1..set_players).to_a
  elsif reply == 3
    exit
  end
end

player || player = [1]

call_exit = false
score_sheet = {}

until call_exit
  system("clear")
  user_input = game_menu(player[0], score_sheet)

  if user_input.to_i.to_s == user_input
    if user_input == "1"
      print_scores(score_sheet)
      score_sheet = {}
      print "Game ended. Press enter to start a new game"
      gets
    elsif user_input == "2"
      write_scores(print_scores(score_sheet))
      next
    elsif user_input == "3"
      call_exit = true
      print_scores(score_sheet)
      next
    end
  end

  if valid_words.include? user_input
    points = score_word(letter_values, user_input)
    if score_sheet[player[0]]
      score_sheet[player[0]][:Total] += points
      if points > score_sheet[player[0]][:Max]
        score_sheet[player[0]][:Max] = points
      end
    else
      score_sheet[player[0]]={:Total => points, :Max => points}
    end
    player.rotate!
    next
  else
    puts "That word is not valid!"
    sleep 1
    next
  end
end

exit
