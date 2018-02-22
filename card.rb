##
# RUBY_MAUMAU - A non-interactive Ruby version of the game mau mau (pesten)
#
# @package		RUBY_MAUMAU
# @author		Deniz Tezcan <howdy@deniztezcan.me>
# @link		https//github.com/deniztezcan/RUBY_MAUMAU
##

class Card

	def initialize(suit, value)
		self.setSuit(suit)
		self.setValue(value)
	end

	def setSuit(suit)
		@suit = suit
	end

	def getSuit
		return @suit
	end

	def setValue(value)
		@value = value
	end

	def getValue
		return @value
	end

	def getCard
		return @suit+@value	
	end

end