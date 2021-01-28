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

  describe '#check_board(X)' do
    it 'should retuurn false if the wanted cell is already filled with X or O' do
      expect(game.check_board()).to eq(false)
    end
  end
end

describe Player do
  describe '#initialize' do
    it 'verfiy the players data collector' do
      expect("My name is #{player1.name} and my Tag is #{player1.tag}").to eq('My name is Momo and my Tag is X')
    end
  end
end
