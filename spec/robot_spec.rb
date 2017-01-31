require 'spec_helper'

describe ToyRobot::Robot do

	context "when creating an instance of Robot" do

		context "when a position is specified" do
			position = ToyRobot::Position.new(2,3,'NORTH')
			let(:robot) { ToyRobot::Robot.new(position) }
			result = position
			it "the robot.position returns #{result}" do
				expect(robot.position).to eq(result)
			end
		end

		context "when a position is not specified" do
			let(:robot) { ToyRobot::Robot.new() }
			result = nil
			it "the robot.position returns #{result}" do
				expect(robot.position).to eq(result)
			end
		end

	end

	describe "#report" do

		context "a robot with a valid position" do 
			position = ToyRobot::Position.new(2,3,'NORTH')
			let(:robot) { ToyRobot::Robot.new(position) }
			result = "#{position.x},#{position.y},#{position.facing.upcase}"
			it "the robot.report returns #{result}" do
				expect(robot.report).to eq(result)
			end
		end

	end

end
