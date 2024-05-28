class TicTacToe

    @@turn = 1
    @@winner = ""

    WIN_COMBINATIONS = [ [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [4,5,8], [0,4,8], [2,4,6] ]
    
    def initialize 
        @board = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
        puts "Player 1: enter your name"
        @player_one = gets.chomp.upcase
        puts "Player 2: enter your name"
        @player_two = gets.chomp.upcase
    end

    def display_board 
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "---+---+---"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "---+---+---"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end
    
    def current_player
        if @@turn.odd?
            @current_player = @player_one
        else
            @current_player = @player_two
        end
    end

    def get_location
        loop do
            puts "\n"
            puts "#{@current_player}'s turn - enter an available location between 1 and 9:"
            puts "\n"
            self.display_board
            puts "\n"
            @location = gets.chomp.to_i
            @index = @location - 1
            break if @location.between?(1,9) and @board[@index] != "X" and @board[@index] != "O"
            puts "\n"
            puts "Invalid location, please try again."
        end
    end

    def update_board 
        if @current_player == @player_one
            @board[@index] = "X"
        elsif @current_player == @player_two
            @board[@index] = "O"
        end
        @@turn += 1
    end

    def check_win 
        # for every win combination, check if all the values at those index are the same
        WIN_COMBINATIONS.each do |combo|
            if @board.values_at(*combo) === ["X", "X", "X"]
                @@winner = @player_one
            elsif 
                @board.values_at(*combo) === ["O", "O", "O"]
                    @@winner = @player_two
            end
        end
    end


    def game_end 
        if @@winner != ""
            puts "\n"
            puts "#{@@winner} wins!"
            puts "\n"
            self.display_board
        elsif @@turn > 9 and @@winner == ""
            puts "\n"
            puts "It's a tie!"
            puts "\n"
            self.display_board
        end
    end



    def turn 
        until @@winner != "" or @@turn > 9
            self.current_player
            self.get_location
            self.update_board
            self.check_win 
            self.game_end
        end
    end


end


game = TicTacToe.new

game.turn







