# Scrabble

m_input =
player_h = {}
player_num = 1
total = 0

until m_input == "quit"
  puts "(1) enter score (2) select player (3) save output."
  puts "Enter quit to quit."


  m_input = gets.chomp
  
  if m_input.to_i == 1
    s_input = 
    until s_input == "quit"
      print "Enter score (or 'quit' to quit): "
      s_input = gets.chomp
      max = s_input.to_i
      if player_h[player_num]
        total = player_h[player_num]["total"]
        player_h[player_num] = {"max"=> max, "total"=> max + total }
      else
        player_h[player_num] = {"max"=> max, "total"=> max }
      end
      print "Max: "
      puts player_h[player_num]["max"]
      print "Total: "
      puts player_h[player_num]["total"]
    
    end
    next
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
