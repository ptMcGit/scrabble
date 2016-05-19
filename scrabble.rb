# Scrabble
require "pry"

m_input = {}
player_h = {}
player_num = 1
total = 0

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

# initialize scores

scores = {}
scores.merge! Hash[
  [
    "a",
    "e",
    "i",
    "o",
    "u",
    "l",
    "n",
    "s",
    "t",
    "r"
  ].map {|x| [x, 1]}]

scores.merge! Hash[
  [
    "d",
    "g",
  ].map {|x| [x, 2]}]

scores.merge! Hash[
  [
    "b",
    "c",
    "m",
    "p",
  ].map {|x| [x, 3]}]

scores.merge! Hash[
  [
    "f",
    "h",
    "v",
    "y",
  ].map {|x| [x, 4]}]

scores.merge! Hash[
  [
    "k",
  ].map {|x| [x, 5]}]

scores.merge! Hash[
  [
    "j",
    "x",
  ].map {|x| [x, 8]}]

scores.merge! Hash[
  [
    "q",
    "z",
  ].map {|x| [x, 10]}]

binding.pry

def print_scores(hash)
  hash.each do | value |
    puts "Print player scores"
    value.to_a[1].to_a.each do | arr |
      print "#{arr[0]}: #{arr[1]}"
    end
  end
end

def print_prompt
  print "(1) Quit (2) Write Score to file (3) Undo\n"
  print "Enter word: "
end

def score_word(scores, word)
  # calculate score for word and return it
  score = 0
  word = word.split("")
  word.each do |letter|
    score += scores[letter]
  end
  return score
end

# puts score_word(scores, "a")
# puts score_word(scores, "arp")
# puts score_word(scores, "qqq")

exit
# test_hash={
#   1=>{
#     :Max=>100,
#     :Total=>400,
#   },
#   2=>{
#     :Max=>230,
#     :Total=>320,
#   },
# }

#print_scores test_hash
#print_prompt

#binding.pry
#exit



word = gets.chomp


call_exit = false

# print_menu

# print_score


until call_exit

#until exit_program


  


until m_input == "quit"
  puts "(1) enter score (2) select player (3) save output."
  puts "Enter quit to quit."


  m_input = gets.chomp

  if m_input.to_i == 1
    s_input =
      until s_input == "quit"
        print "Enter score (or 'quit' to quit): "
        s_input = gets.chomp
        as_integer = s_input.to_i
        if player_h[player_num]
          player_h[player_num]["total"] += as_integer
          if as_integer > player_h[player_num]["max"]
            player_h[player_num]["max"] = as_integer
          end
          
        else
          player_h[player_num] = {"max"=> as_integer, "total"=> as_integer }
        end
        print "Max: "
        puts player_h[player_num]["max"]
        print "Total: "
        puts player_h[player_num]["total"]
        
      end
  end

  # switch player
  
  if m_input.to_i == 2
    print "Enter player number: "
    player_num = gets.chomp
    puts "Switched to player #{player_num}"
  end

  # save to file
  
  if m_input.to_i == 3

    save_file = "score_sheet"
    f = File.open(save_file, "w+")
    player_h.each do | player |
      f.print("player ")
      player.each do | specs |
        f.puts(specs)
      end
    end
    puts "Wrote to #{save_file}"
  end
  
end
exit
