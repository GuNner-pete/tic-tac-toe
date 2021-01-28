require_relative '../lib/logic'
require_relative '../lib/players'

player1 = Player.new('X')
player2 = Player.new('O')
player1.name = 'Momo'
player2.name = 'Nono'
game = Board.new
@board_grid = %w[1 2 x 4 5 6 7 8 9]

describe Board do
  # input check -- negative value
  describe '#check_input(x)' do
    it 'should return false if the input value was not between 1 & 9' do
      expect(game.check_input(-9)).to eq(false)
    end
  end

  # input check -- zero
  describe '#check_input(x)' do
    it 'should return false if the input value was not between 1 & 9' do
      expect(game.check_input(0)).to eq(false)
    end
  end

  # input check -- value > 9
  describe '#check_input(x)' do
    it 'should return false if the input value was not between 1 & 9' do
      expect(game.check_input(91)).to eq(false)
    end
  end

  # input check -- value is string
  describe '#check_input(x)' do
    it 'should return false if the input value was not between 1 & 9' do
      expect(game.check_input('you')).to eq(false)
    end
  end

  # input check -- normal value
  describe '#check_input(x)' do
    it 'should return true because the input value is between 1 & 9' do
      expect(game.check_input(9)).to eq(true)
    end
  end

  # Player 1 wins with a cross line
  describe '#check_winner' do
    it 'should return the name of the winner' do
      game.change_box('1', player1)
      game.change_box('5', player1)
      game.change_box('9', player1)
      expect(game.check_winner(player1).name).to eq(player1.name)
    end
  end

  # Player 1 wins with a straight line
  describe '#check_winner' do
    it 'should return the name of the winner' do
      game.change_box('4', player1)
      game.change_box('5', player1)
      game.change_box('6', player1)
      expect(game.check_winner(player1).name).to eq(player1.name)
    end
  end

  # Player 2 wins with a cross line
  describe '#check_winner' do
    it 'should return the name of the winner' do
      game.change_box('3', player2)
      game.change_box('5', player2)
      game.change_box('7', player2)
      expect(game.check_winner(player2).name).to eq(player2.name)
    end
  end

  # Draw check
  describe '#check_draw' do
    it 'check theend of the game by a draw setuation' do
      game.change_box('1', player1)
      game.change_box('2', player2)
      game.change_box('3', player1)
      game.change_box('4', player1)
      game.change_box('5', player2)
      game.change_box('6', player2)
      game.change_box('7', player2)
      game.change_box('8', player1)
      game.change_box('9', player1)
      expect(game.check_draw(nil)).to eq(true)
    end
  end
end
