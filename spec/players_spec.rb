require_relative '../lib/players'

player1 = Player.new('X')
player2 = Player.new('O')
player1.name = 'Momo'
player2.name = 'Nono'

describe Player do
  describe '#initialize' do
    it 'verfiy the players data collector' do
      expect("My name is #{player1.name} and my Tag is #{player1.tag}").to eq('My name is Momo and my Tag is X')
    end
  end
end
