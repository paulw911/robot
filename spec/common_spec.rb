require 'spec_helper'

describe ToyRobot::Common do

	let(:controller) { ToyRobot::Controller.new ToyRobot::Table.new(5), ToyRobot::Robot.new(nil) }

	describe "#extract_command" do
		line1 = 'move'
		result1 = line1
		it "returns #{result1}" do
			expect(controller.extract_command line1).to eq(result1)
		end
		line2 = 'move nothing'
		result2 = 'move'
		it "returns #{result2}" do
			expect(controller.extract_command line2).to eq(result2)
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




	# describe "#valid_facing?" do
	# 	facing1 = 'north'
	# 	it "when facing = #{facing1} valid_facing returns true" do
	# 		expect(controller.valid_facing? facing1).to eq(true)
	# 	end
	# 	facing2 = 'NORTH'
	# 	it "when facing = #{facing2} valid_facing returns true" do
	# 		expect(controller.valid_facing? facing2).to eq(true)
	# 	end
	# 	facing3 = 'southWEST'
	# 	it "when facing = #{facing3} valid_facing returns false" do
	# 		expect(controller.valid_facing? facing3).to eq(false)
	# 	end
	# 	facing4 = 'NORTHeast'
	# 	it "when facing = #{facing4} valid_facing returns false" do
	# 		expect(controller.valid_facing? facing4).to eq(false)
	# 	end
	# end

	# describe "#place" do
	# 	line1 = 'place 1,2,north'
	# 	context "when command is 'place'" do
	# 		it "place returns true" do
	# 			# size = controller.table.size
	# 			expect(controller.place line1).to be_a(Hash)
	# 		end
	# 	end
	# end

	# describe "" do
		# command1 = 'place 1,2,north'
		# context "when (extracted) command is 'place'" do
		# 	it "valid_facing returns true" do
		# 		extracted_command1 = controller.place line1
		# 		expect(controller.valid_facing? extracted_command1).to eq(true)
		# 	end
		# end
		# line2 = 'placeit ,1,2,north'
		# context "when (extracted) command is 'place'" do
		# 	it "valid_facing returns true" do
		# 		extracted_command2 = controller.extract_command line2
		# 		expect(controller.valid_facing? extracted_command2).to eq(false)
		# 	end
		# end
		# line3 = 'MOve'
		# context "when (extracted) command is 'place'" do
		# 	it "valid_facing returns true" do
		# 		extracted_command3 = controller.extract_command line3
		# 		expect(controller.valid_facing? extracted_command3).to eq(true)
		# 	end
		# end
		# line4 = 'MOveforward'
		# context "when (extracted) command is 'place'" do
		# 	it "valid_facing returns false" do
		# 		extracted_command4 = controller.extract_command line4
		# 		expect(controller.valid_facing? extracted_command4).to eq(false)
		# 	end
		# end
	# end












end




# COMMANDS = [ 'place', 'move', 'left', 'right', 'report', 'exit' ]
# FACINGS = [ 'north', 'east', 'south', 'west' ]
# COMMAND_MATCH_RULE = /\s*(?<command>\w+)/
# PLACE_MATCH_RULE = /\s*(?<command>\w+)\s*(?<x>\d+),\s*(?<y>\d+),\s*(?<facing>\w+)/

# def extract_command line
# 	line.match(COMMAND_MATCH_RULE)
# 	$~[:command].downcase
# end

# def valid_command? command
# 	COMMANDS.include?(command)
# end

