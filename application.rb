##
# RUBY_MAUMAU - A non-interactive Ruby version of the game mau mau (pesten)
#
# @package		RUBY_MAUMAU
# @author		Deniz Tezcan <howdy@deniztezcan.me>
# @link		https://github.com/deniztezcan/RUBY_MAUMAU
##

require_relative 'deck'
require_relative 'player'
require_relative 'stack'

class Application

	def initialize
		self.initializeDeck
		self.initializePlayers
		self.initializeStack
		@losers = []
		@gameFinished = false
	end

	def initializeDeck
		@deck = Deck.new
		@deck.shuffle
	end

	def initializePlayers
		@players = []
		@players << Player.new('Churchill')
		@players << Player.new('Stalin')
		@players << Player.new('Roosevelt')
		@players << Player.new('de Gaulle')
	end

	def initializeStack
		@stack = Stack.new
	end

	def listPlayers
		returnString = "Starting game with"

		@players.each do |player|
			returnString += " " + player.getName() + ","
		end

		return returnString.gsub(/[,]+$/, '')
	end

	def initialDealing
		@players.each do |player|
			7.times do |cardIndex|
				player.addToHand(@deck.dealCard)
			end
		end
	end

	def listInitialDealings
		returnString = ""

		@players.each do |player|
			returnString += player.getName() + " has been dealt:"
			player.getHand.each do |card|
				returnString += " " + card.getCard() + ","
			end
			returnString = returnString.gsub(/[,]+$/, '') + "\n"
		end	

		return returnString.gsub(/[,]+$/, '')
	end

	def listWinner(player_name)
		puts player_name+" has won."
	end

	def setGameFinished(status)
		@gameFinished = status
	end

	def setLoser(player)
		if self.countLosers == 0
			@losers << player
		else
			foundPlayer = false
			@losers.each do |losingPlayer|
				if losingPlayer == player
					foundPlayer = true
				end
			end

			if foundPlayer == false
				@losers << player
			end
		end
	end

	def removeLosers
		@losers = []
	end

	def countLosers
		return @losers.length
	end

	def countPlayers
		return @players.length
	end

	def canPlay(card, hand, player)
		hand.each_with_index do |handCard, idx|
		    if handCard.getSuit == card.getSuit
				return [idx, handCard]
			elsif handCard.getValue == card.getValue
				return [idx, handCard]
			end
		end
		return false
	end

	def play(player)
		stackCard 	= @stack.getTopStackCard()
		canPlay 	= self.canPlay(stackCard, player.getHand, player)

		if canPlay == false
			if @deck.isEmpty == false
				newCard = @deck.dealCard
				player.addToHand(newCard)
				puts player.getName + " does not have a suitable card. taking from deck " + newCard.getCard
			else
				if self.countLosers == self.countPlayers
					puts "No cards left in deck. There is no winner :("
					self.setGameFinished(true)
					exit()
				else
					puts player.getName + " does not have a suitable card. Deck is empty - skipping turn"
					self.setLoser(player)
				end
			end
		else
			puts player.getName + " plays " + canPlay[1].getCard
			@stack.addToStack(canPlay[1])
			player.removeFromHand(canPlay[0])
			self.removeLosers
		end
	end

	def restOfGame
		while @gameFinished == false do
			@players.each do |player|
				if player.countHand > 0
					self.play(player)
					if player.countHand == 0
						self.listWinner(player.getName)
						self.setGameFinished(true)
						exit()
					end
				end
			end
		end
	end

	def startGame
		puts self.listPlayers
		self.initialDealing
		puts self.listInitialDealings
		@stack.addToStack(@deck.dealCard)
		puts @stack.listTopStackCard
		self.restOfGame
	end

end