##
# RUBY_MAUMAU - A non-interactive Ruby version of the game mau mau (pesten)
#
# @package		RUBY_MAUMAU
# @author		Deniz Tezcan <howdy@deniztezcan.me>
# @link		https//github.com/deniztezcan/RUBY_MAUMAU
##

class Player

	def initialize(name)
		self.setName(name)
		@hand = []
	end

	def setName(name)
		@name = name
	end

	def getName
		return @name
	end

	def addToHand(card)
		@hand << card
	end

	def removeFromHand(i)
		@hand.delete_at(i)
	end

	def countHand
		return @hand.length
	end

	def getHand
		return @hand
	end

end