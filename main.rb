class Board
  attr_accessor(:squares,:last_player)
  def initialize
    @squares = Array.new(9," ")    
  end
  def put_play(position,role)
   
    if is_ocuppied(position) 
      puts "Ilegal move. Square ocuppied."
      return "error"
    elsif position.to_i > 8 || position.to_i < 0
      puts "Invalid position"
      return "error"
    else 
      @squares[position.to_i] = role  
      @last_player = role
    end 
  end
  def is_ocuppied(position)    
    if @squares[position.to_i].to_s == "x" || @squares[position.to_i].to_s == "x" then
      return true
    end
  end
  def show_board
    puts "Tablero:"
    puts @squares[0..2].to_s
    puts @squares[3..5].to_s
    puts @squares[6..8].to_s    
  end
  def check_win (role) #not elegant check win
    #rows

    if @squares[0] == role &&
      @squares[1] == role &&
      @squares[2] == role
      return role    
    elsif @squares[3] == role &&
      @squares[4] == role &&
      @squares[5] == role
      return role    
    elsif @squares[6] == role &&
      @squares[7] == role &&
      @squares[8] == role
      return role          
    #column
    elsif @squares[0] == role &&
      @squares[3] == role &&
      @squares[6] == role
      return role    
    elsif @squares[1] == role &&
      @squares[4] == role &&
      @squares[7] == role
      return role  
    elsif @squares[2] == role &&
      @squares[5] == role &&
      @squares[8] == role
      return role
    #diagonals
    elsif @squares[0] == role &&
      @squares[5] == role &&
      @squares[8] == role
      return role
    elsif @squares[2] == role &&
      @squares[5] == role &&
      @squares[7] == role
      return role
    else
      puts "Nobody wins"
    end
    
  end
end

class Players
  @@players = Hash.new
  attr_accessor(:name, :role)
  def initialize(name,role)     
    @name = name    
    @role = role
    @@players[@name] = @role
  end 
  def get_choice
    puts "Player #{@name} plays. Where do you put the #{@role}?"
    return gets.chomp
  end 
  def Players.show_players
    puts @@players
  end 
end


player = Array.new
player[0] = Players.new("X Player","x")
player[1] = Players.new("O Player","o")

this_board = Board.new

i=0
while i < 9 do  
  
  if this_board.last_player == "x" then 
    player_turn = 1
  else
    player_turn = 0
  end
  
  while this_board.put_play(player[player_turn].get_choice, player[player_turn].role) == "error" do 
  this_board.show_board
  end
  
  puts "Player #{player[player_turn].name} has chosen. This is the board:" 
  this_board.show_board
  if this_board.check_win(player[player_turn].role) == player[player_turn].role then
    puts "#{player[player_turn].name} Win!!!!!"
    i = 9
  end 
  i+=1
end
  
  
  
