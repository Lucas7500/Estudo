module TicTacToe

  class Game
    attr_accessor :board, :result
    attr_reader :player1, :player2
    
    def initialize
      @board = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
      @player1 = Player.new('Player 1')
      @player2 = Player.new('Player 2')
      @result = ''
    end

    def play
      until game_is_over?
        show_board
        @player1.make_a_move!(self, 'X')
        break if game_is_over?
        show_board
        @player2.make_a_move!(self, 'O')
      end
        
      show_board
      puts "\n#{@result}\n"
    end

    def show_board
      for i in 0..2
        for j in 0..2
          print "#{@board[i][j]} "
          print '| ' unless j == 2
        end
        puts
      end
    end

    def available?(num)
      for i in 0..2
        for j in 0..2
          return true if @board[i][j] == num
        end
      end
      false
    end

    def game_is_over?
      if win_by_row? || win_by_column? || win_by_diagonal? || win_by_reverse_diagonal? || tie?
        return true
      end

      false
    end

    def win_by_row?
      for i in 0..2
        row = ''
        for j in 0..2
          row += @board[i][j].to_s
          if row == 'XXX'
            @result = "#{@player1.name} won!"
            return true  
          elsif row == 'OOO'
            @result = "#{@player2.name} won!"
            return true
          end
        end
      end

      false
    end

    def win_by_column?
      for j in 0..2
        column = ''
        for i in 0..2
          column += @board[i][j].to_s
          if column == 'XXX'
            @result = "#{@player1.name} won!"
            return true  
          elsif column == 'OOO'
            @result = "#{@player2.name} won!"
            return true
          end
        end
      end

      false
    end

    def win_by_diagonal?
      diagonal = ''
      for i in 0..2
        for j in 0..2
          diagonal += @board[i][j].to_s if i == j
          if diagonal == 'XXX'
            @result = "#{@player1.name} won!"
            return true  
          elsif diagonal == 'OOO'
            @result = "#{@player2.name} won!"
            return true
          end
        end
      end

      false
    end

    def win_by_reverse_diagonal?
      reverse_diagonal = ''
      for i in 0..2
        for j in 0..2
          reverse_diagonal += @board[i][j].to_s if i + j == 2
          if reverse_diagonal == 'XXX'
            @result = "#{@player1.name} won!"
            return true  
          elsif reverse_diagonal == 'OOO'
            @result = "#{@player2.name} won!"
            return true
          end
        end
      end

      false
    end

    def tie?
      board.each do |array|
        for i in 0..2
          return false if array[i].class == Integer
        end
      end
      @result = "It's a tie"

      true
    end
  end

  class Player
  
    attr_reader :name
  
    def initialize(name)
      @name = name
    end
  
    def make_a_move!(game, symbol)
      print "\n#{self.name}, where will you place the #{symbol}: "
      num = gets.chomp.to_i
      puts
  
      if game.available?(num)
        for i in 0..2
          for j in 0..2
            game.board[i][j] = symbol if game.board[i][j] == num
          end
        end
      else
        puts "\nThis space isn't available!\n"
        make_a_move!(game, symbol)
      end
    end
  end
end

game = TicTacToe::Game.new
game.play