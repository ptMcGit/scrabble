# Scrabble

m_input = {}
player_h = {}
player_num = 1
total = 0

# initialize scores

scores = {}
scores = scores.merge Hash[
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

scores = scores.merge Hash[
  [
    "d",
    "g",
  ].map {|x| [x, 2]}]

scores = scores.merge Hash[
  [
    "b",
    "c",
    "m",
    "p",
  ].map {|x| [x, 3]}]

scores = scores.merge Hash[
  [
    "f",
    "h",
    "v",
    "y",
  ].map {|x| [x, 4]}]

scores = scores.merge Hash[
  [
    "k",
  ].map {|x| [x, 5]}]

scores = scores.merge Hash[
  [
    "j",
    "x",
  ].map {|x| [x, 8]}]

scores = scores.merge Hash[
  [
    "q",
    "z",
  ].map {|x| [x, 10]}]



puts scores
exit
word = gets.chomp
# get_word(valid_words,

#          (1 point)-A, E, I, O, U, L, N, S, T, R
#          (2 points)-D, G
#          (3 points)-B, C, M, P
#          (4 points)-F, H, V, W, Y
#          (5 points)-K
#          (8 points)- J, X
#          (10 points)-Q, Z

         

         
#          def score_letter(letter)
#            # returns score of letter
#            score = {}
#            score
           


         


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
