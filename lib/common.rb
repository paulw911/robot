module ToyRobot

	module Common

		COMMANDS = [ 'place', 'move', 'left', 'right', 'report', 'exit' ]
		FACINGS = [ 'north', 'east', 'south', 'west' ]
		COMMAND_MATCH_RULE = /\s*(?<command>\w+)/
		PLACE_MATCH_RULE = /\s*(?<command>\w+\s)\s*(?<x>\d+),\s*(?<y>\d+),\s*(?<facing>\w+)/

		def extract_command line
			line.match(COMMAND_MATCH_RULE)
			$~[:command].downcase
		end

		def valid_command? command
			COMMANDS.include?(command)
		end

		def extract_command_place line
			if !line.match(PLACE_MATCH_RULE).nil?
				{ x: $~[:x].to_i, y: $~[:y].to_i, facing: $~[:facing].downcase }
			else
				{ }
			end
		end

		def valid_x_y? x,y,size
			x >= 0 && x <= size && y >= 0 && y <= size
		end

		def valid_facing? facing
			FACINGS.include?(facing.downcase) 
		end

		def robot_place line,size
			params = extract_command_place line
			x = params.fetch(:x, 99999999)
			y = params.fetch(:y, 99999999)
			facing = params.fetch(:facing, 'ERROR')
			if valid_x_y?(x,y,size) && valid_facing?(facing)
				params
			else
				{ }
			end
		end

		def robot_move position,size
			new_position = position.dup
			case new_position.facing
			when /north/i # "north"
				new_position.y += 1
			when /east/i # "east"
				new_position.x += 1
			when /south/i # "south"
				new_position.y -= 1
			when /west/i # "west"
				new_position.x -= 1
			end
			return new_position if valid_x_y? new_position.x,new_position.y,size
		end

		def robot_left position
			newindex = ( FACINGS.index(position.facing) - 1 ) % FACINGS.count
			return FACINGS[newindex]
		end

		def robot_right position
			newindex = ( FACINGS.index(position.facing) + 1 ) % FACINGS.count
			return FACINGS[newindex]
		end

	end

end
