require 'spec_helper'

describe ToyRobot::Common do

	let(:controller) { ToyRobot::Controller.new ToyRobot::Table.new(5), ToyRobot::Robot.new(nil) }

	describe "#extract_command" do

		context "when the command line is 'move'" do
			command_line = 'move'
			expected_command = 'move'
			it "extract_command returns #{expected_command}" do
				expect(controller.extract_command command_line).to eq(expected_command)
			end
		end

		context "when the command line is 'move nothing'" do
			command_line = 'move nothing'
			expected_command = 'move'
			it "returns #{expected_command}" do
				expect(controller.extract_command command_line).to eq(expected_command)
			end
		end

		context "when the command line is 'PLace 1,2,north'" do
			command_line = 'PLace 1,2,north'
			expected_command = 'place'
			it "extract_command returns #{expected_command}" do
				expect(controller.extract_command command_line).to eq(expected_command)
			end
		end

		context "when the command line is 'report 1,2,north'" do
			command_line = 'report 1,2,north'
			expected_command = 'report'
			it "extract_command returns #{expected_command}" do
				expect(controller.extract_command command_line).to eq(expected_command)
			end
		end

		context "when the command line is '1,2,north'" do
			command_line = '1,2,north'
			expected_command = '1'
			it "extract_command returns #{expected_command}" do
				expect(controller.extract_command command_line).to eq(expected_command)
			end
		end

		context "when the command line is '   1,2,north'" do
			command_line = '   1,2,north'
			expected_command = '1'
			it "extract_command returns #{expected_command}" do
				expect(controller.extract_command command_line).to eq(expected_command)
			end
		end

		context "when the command line is 'nothing12north'" do
			command_line = 'nothing12north'
			expected_command = 'nothing12north'
			it "extract_command returns #{expected_command}" do
				expect(controller.extract_command command_line).to eq(expected_command)
			end
		end

		context "when the command line is 'nothing 12north'" do
			command_line = 'nothing 12north'
			expected_command = 'nothing'
			it "extract_command returns #{expected_command}" do
				expect(controller.extract_command command_line).to eq(expected_command)
			end
		end

	end

	describe "#valid_command?" do

		line1 = 'place 1,2,north'
		context "when (extracted) command is 'place'" do
			it "valid_command returns true" do
				extracted_command1 = controller.extract_command line1
				expect(controller.valid_command? extracted_command1).to eq(true)
			end
		end

		line2 = 'placeit ,1,2,north'
		context "when (extracted) command is 'place'" do
			it "valid_command returns true" do
				extracted_command2 = controller.extract_command line2
				expect(controller.valid_command? extracted_command2).to eq(false)
			end
		end

		line3 = 'MOve'
		context "when (extracted) command is 'place'" do
			it "valid_command returns true" do
				extracted_command3 = controller.extract_command line3
				expect(controller.valid_command? extracted_command3).to eq(true)
			end
		end

		line4 = 'MOveforward'
		context "when (extracted) command is 'place'" do
			it "valid_command returns false" do
				extracted_command4 = controller.extract_command line4
				expect(controller.valid_command? extracted_command4).to eq(false)
			end
		end

	end

	describe "#extract_command_place" do

		context "when the command entered is 'place 1,2,north'" do
			line = 'place 1,2,north'
			result = { x: 1, y: 2, facing: 'north' }
			it "extract_command_place returns #{result}" do
				expect(controller.extract_command_place line).to eq(result)
			end
		end

		context "when the command entered is 'PLACE 1,2,NORTH'" do
			line = 'PLACE 1,2,NORTH'
			result = { x: 1, y: 2, facing: 'north' }
			it "extract_command_place returns #{result}" do
				expect(controller.extract_command_place line).to eq(result)
			end
		end

		context "when the command entered is 'place 1,2'" do
			line = 'place 1,2'
			result = {  }
			it "extract_command_place returns #{result}" do
				expect(controller.extract_command_place line).to eq(result)
			end
		end

		context "when the command entered is 'place1,2,north'" do
			line = 'place1,2,north'
			result = {  }
			it "extract_command_place returns #{result}" do
				expect(controller.extract_command_place line).to eq(result)
			end
		end

		context "when the command entered is 'place,1,2,north'" do
			line = 'place,1,2,north'
			result = {  }
			it "extract_command_place returns #{result}" do
				expect(controller.extract_command_place line).to eq(result)
			end
		end

		context "when the command entered is 'place 1,north'" do
			line = 'place 1,north'
			result = {  }
			it "extract_command_place returns #{result}" do
				expect(controller.extract_command_place line).to eq(result)
			end
		end

		context "when the command entered is 'place  north'" do
			line = 'place  north'
			result = {  }
			it "extract_command_place returns #{result}" do
				expect(controller.extract_command_place line).to eq(result)
			end
		end

		context "when the command entered is 'place 2,north'" do
			line = 'place 2,north'
			result = {  }
			it "extract_command_place returns #{result}" do
				expect(controller.extract_command_place line).to eq(result)
			end
		end

		context "when the command entered is 'place1'" do
			line = 'place1'
			result = {  }
			it "extract_command_place returns #{result}" do
				expect(controller.extract_command_place line).to eq(result)
			end
		end

		context "when the command entered is 'north'" do
			line = 'north'
			result = {  }
			it "extract_command_place returns #{result}" do
				expect(controller.extract_command_place line).to eq(result)
			end
		end

	end

	describe "#valid_x_y" do

		context "when x is 3, y is 5 and size is 5" do
			x = 3
			y = 5
			size = 5
			result = true
			it "valid_x_y? returns #{result}" do
				expect(controller.valid_x_y? x,y,size).to eq(result)
			end
		end

		context "when x is 6, y is 5 and size is 5" do
			x = 6
			y = 5
			size = 5
			result = false
			it "valid_x_y? returns #{result}" do
				expect(controller.valid_x_y? x,y,size).to eq(result)
			end
		end

		context "when x is 6, y is 6 and size is 5" do
			x = 6
			y = 6
			size = 5
			result = false
			it "valid_x_y? returns #{result}" do
				expect(controller.valid_x_y? x,y,size).to eq(result)
			end
		end

		context "when x is 0, y is 0 and size is 99" do
			x = 0
			y = 0
			size = 99
			result = true
			it "valid_x_y? returns #{result}" do
				expect(controller.valid_x_y? x,y,size).to eq(result)
			end
		end

	end

	describe "#valid_facing?" do

		context "when facing is 'north'" do
			facing = 'north'
			result = true
			it "valid_facing? returns #{result}" do
				expect(controller.valid_facing? facing).to eq(result)
			end
		end

		context "when facing is 'NORTH'" do
			facing = 'NORTH'
			result = true
			it "valid_facing? returns #{result}" do
				expect(controller.valid_facing? facing).to eq(result)
			end
		end

		context "when facing is 'southWEST'" do
			facing = 'southWEST'
			result = false
			it "valid_facing? returns #{result}" do
				expect(controller.valid_facing? facing).to eq(result)
			end
		end

		context "when facing is 'NORTHeast'" do
			facing = 'NORTHeast'
			result = false
			it "valid_facing? returns #{result}" do
				expect(controller.valid_facing? facing).to eq(result)
			end
		end

	end

	describe "#command_place" do

		context "when the command entered is 'place 1,2,north'" do
			command_line = 'place 1,2,north'
			result = { x: 1, y: 2, facing: 'north' }
			it "robot_place returns #{result}" do
				expect(controller.robot_place command_line,controller.table.size).to eq(result)
			end
		end

		context "when the command entered is 'place 5,7,north'" do
			command_line = 'place 5,7,north'
			result = {  }
			it "robot_place returns #{result}" do
				expect(controller.robot_place command_line,controller.table.size).to eq(result)
			end
		end

		context "when the command entered is 'place 3,3,northeast'" do
			command_line = 'place 3,3,northeast'
			result = {  }
			it "robot_place returns #{result}" do
				expect(controller.robot_place command_line,controller.table.size).to eq(result)
			end
		end

		context "when the command entered is 'place 4,1,south nothing'" do
			command_line = 'place 4,1,south nothing'
			result = { x: 4, y: 1, facing: 'south' }
			it "robot_place returns #{result}" do
				expect(controller.robot_place command_line,controller.table.size).to eq(result)
			end
		end

	end

	describe "#move" do

		context "when x is 3, y is 3 and facing is 'east'" do
			command_line = 'move'
			position = ToyRobot::Position.new(3,3,'east')
			expected_position = ToyRobot::Position.new(4,3,'east')
			it "returns new_position of #{expected_position}" do
				size = controller.table.size
				expect(controller.robot_move position,size).to eq(expected_position)
			end
		end

		context "when x is 4, y is 5 and facing is 'north'" do
			command_line = 'move'
			position = ToyRobot::Position.new(4,5,'north')
			expected_position = nil
			it "returns new_position of #{expected_position.inspect}" do
				size = controller.table.size
				expect(controller.robot_move position,size).to eq(expected_position)
			end
		end

		context "when x is 4, y is 5 and facing is 'south'" do
			command_line = 'move'
			position = ToyRobot::Position.new(4,5,'south')
			expected_position = ToyRobot::Position.new(4,4,'south')
			it "returns new_position of #{expected_position}" do
				size = controller.table.size
				expect(controller.robot_move position,size).to eq(expected_position)
			end
		end

		context "when x is 0, y is 0 and facing is 'west'" do
			command_line = 'move'
			position = ToyRobot::Position.new(0,0,'west')
			expected_position = nil
			it "returns new_position of #{expected_position.inspect}" do
				size = controller.table.size
				expect(controller.robot_move position,size).to eq(expected_position)
			end
		end

	end

	describe "#left" do

		context "when facing 'north'" do

			before do
				controller.robot.position = ToyRobot::Position.new(3,3,'north')
			end

			result = 'west'
			it "returns #{result}" do
				position = controller.robot.position
				expect(controller.robot_left position).to eq(result)
			end

		end

		context "when facing 'west'" do

			before do
				controller.robot.position = ToyRobot::Position.new(3,3,'west')
			end

			result = 'south'
			it "returns #{result}" do
				position = controller.robot.position
				expect(controller.robot_left position).to eq(result)
			end

		end

		context "when facing 'south'" do

			before do
				controller.robot.position = ToyRobot::Position.new(3,3,'south')
			end

			result = 'east'
			it "returns #{result}" do
				position = controller.robot.position
				expect(controller.robot_left position).to eq(result)
			end

		end

		context "when facing 'east'" do

			before do
				controller.robot.position = ToyRobot::Position.new(3,3,'east')
			end

			result = 'north'
			it "returns #{result}" do
				position = controller.robot.position
				expect(controller.robot_left position).to eq(result)
			end

		end

	end

	describe "#right" do

		context "when facing 'north'" do

			before do
				controller.robot.position = ToyRobot::Position.new(3,3,'north')
			end

			result = 'east'
			it "returns #{result}" do
				position = controller.robot.position
				expect(controller.robot_right position).to eq(result)
			end

		end

		context "when facing 'east'" do

			before do
				controller.robot.position = ToyRobot::Position.new(3,3,'east')
			end

			result = 'south'
			it "returns #{result}" do
				position = controller.robot.position
				expect(controller.robot_right position).to eq(result)
			end

		end

		context "when facing 'south'" do

			before do
				controller.robot.position = ToyRobot::Position.new(3,3,'south')
			end

			result = 'west'
			it "returns #{result}" do
				position = controller.robot.position
				expect(controller.robot_right position).to eq(result)
			end

		end

		context "when facing 'west'" do

			before do
				controller.robot.position = ToyRobot::Position.new(3,3,'west')
			end

			result = 'north'
			it "returns #{result}" do
				position = controller.robot.position
				expect(controller.robot_right position).to eq(result)
			end

		end

	end

end



