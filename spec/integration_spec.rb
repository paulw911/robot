require 'spec_helper'

describe "integration testing" do

	context "when toyrobot.rb commands loaded from test_file_1" do

		let(:file1) { './spec/integration/test_file_1' }

		it "returns the robot's final position" do
			result = `ruby toyrobot.rb < #{file1}`.chomp
			expected_result = '2,2,NORTH'
			expect(result).to eq(expected_result)
		end

	end

	context "when toyrobot.rb commands loaded from test_file_2" do

		let(:file2) { './spec/integration/test_file_2' }

		it "returns the robot's final position" do
			result = `ruby toyrobot.rb < #{file2}`.chomp
			expected_result = '1,1,EAST'
			expect(result).to eq(expected_result)
		end

	end

	context "when toyrobot.rb commands loaded from test_file_3" do

		let(:file3) { './spec/integration/test_file_3' }

		it "returns the robot's final position" do
			result = `ruby toyrobot.rb < #{file3}`.chomp
			expected_result = '4,0,EAST'
			expect(result).to eq(expected_result)
		end

	end

end
