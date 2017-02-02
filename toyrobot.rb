#!/usr/bin/env ruby

require './lib/toy_robot.rb'

include ToyRobot::Common

controller = ToyRobot::Controller.new ToyRobot::Table.new(5), ToyRobot::Robot.new(nil)

$stdin.each_line do |line|
	command = ToyRobot::Common::extract_command line
	if ToyRobot::Common::valid_command? command
		case command
		when 'exit'
			exit 0
		when 'place'
			controller.place line
		when 'left'
			controller.left
		when 'right'
			controller.right
		when 'move'
			controller.move
		when 'report'
			controller.report
		end
	end
end
