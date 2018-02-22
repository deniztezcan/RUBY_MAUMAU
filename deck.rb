##
# RUBY_MAUMAU - A non-interactive Ruby version of the game mau mau (pesten)
#
# @package		RUBY_MAUMAU
# @author		Deniz Tezcan <howdy@deniztezcan.me>
# @link		https//github.com/deniztezcan/RUBY_MAUMAU
##

require_relative 'card'

class Deck

	def initialize
		self.initializeSuits
		self.initializeValues
		self.initializeCards
		self.initializeDeck
	end

	def setCard(suit, value)
		@cards << Card.new(suit, value)
	end

	def initializeSuits
		@suits = []
		@suits << "♥"
		@suits << "♠"
		@suits << "♦"
		@suits << "♣"
	end

	def initializeValues
		@values = []
		@values << "A"
		@values << "K"
		@values << "Q"
		@values << "J"
		@values << "10"
		@values << "9"
		@values << "8"
		@values << "7"
		@values << "6"
		@values << "5"
		@values << "4"
		@values << "3"
		@values << "2"	
	end

	def initializeCards
		@cards = []
	end

	def initializeDeck
		@suits.each do |suit|
			@values.each do |value|
				self.setCard(suit, value)
			end
		end	
	end

	def shuffle
		@cards.shuffle!
	end

	def count
		return @cards.length
	end

	def addToDeck(card)
		@cards << card
	end	

	def removeFromDeck(i)
		@cards.delete_at(i)
	end

	def dealCard
		cardInHand = @cards[0]
		self.removeFromDeck(0)
		return cardInHand
	end

	def isEmpty
		if self.count() == 0
			return true
		else
			return false
		end
	end

end