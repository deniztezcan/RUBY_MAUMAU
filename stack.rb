##
# RUBY_MAUMAU - A non-interactive Ruby version of the game mau mau (pesten)
#
# @package		RUBY_MAUMAU
# @author		Deniz Tezcan <howdy@deniztezcan.me>
# @link		https://github.com/deniztezcan/RUBY_MAUMAU
##

class Stack

	def initialize
		@stack = []
	end

	def addToStack(card)
		@stack << card
	end

	def getTopStackCard
		count = @stack.length
		return @stack[count-1]
	end

	def listTopStackCard
		card = self.getTopStackCard
		return "Top card is: " + card.getCard
	end

end