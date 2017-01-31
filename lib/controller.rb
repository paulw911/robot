module ToyRobot

	class Controller

		include Common

		attr_accessor :table, :robot

		def initialize table,robot
			@table = table
			@robot = robot
		end

		def place line
			params = Common::robot_place line,@table.size
			@robot.position = Position.new(params.fetch(:x),params.fetch(:y),params.fetch(:facing)) unless params.empty?
		end

		def move
			new_position = Common::robot_move @robot.position, @table.size unless @robot.position.nil?
			@robot.position = new_position unless new_position.nil?
		end

		def report
			puts @robot.report unless @robot.position.nil?
		end

		def left
			@robot.position.facing = Common::robot_left @robot.position unless @robot.position.nil?
		end

		def right
			@robot.position.facing = Common::robot_right @robot.position unless @robot.position.nil?
		end

	end

end
