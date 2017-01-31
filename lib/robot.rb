module ToyRobot

	class Robot

		attr_accessor :position

		def initialize position=nil
			@position = position
		end

		def report
			"#{@position.x},#{@position.y},#{@position.facing.upcase}"
		end

	end

end
