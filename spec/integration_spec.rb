require 'spec_helper'
require_relative './../lib/toy_robot.rb'
require_relative './../toyrobot.rb'

describe "integration testing" do

	let(:file1) { '/spec/integration/test_file_1' }

	it "returns the robot's final position" do
		result = 'toyrobot.rb < #{file1}'.chomp
		# result = STDIN.file1.gets.chomp
		expected_result = '2,2,NORTH'
		expect(result).to eq(expected_result)
	end

	let(:file2) { '/spec/integration/test_file_2' }

	it "returns the robot's final position" do
		result = 'ruby toyrobot.rb < #{file2}'.chomp
		expected_result = '2,2,NORTH'
		expect(result).to eq(expected_result)
	end

	let(:file3) { '/spec/integration/test_file_3' }

	it "returns the robot's final position" do
		result = 'ruby toyrobot.rb < #{file3}'.chomp
		expected_result = '2,2,NORTH'
		expect(result).to eq(expected_result)
	end

end
