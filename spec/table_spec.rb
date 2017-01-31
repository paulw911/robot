require 'spec_helper'

describe ToyRobot::Table do

	context "when creating an instance of Table" do

		context "and a size is specified" do
			size = 8
			let(:table) { ToyRobot::Table.new(size) }
			result = size
			it "the table.size returns #{result}" do
				expect(table.size).to eq(result)
			end
		end

		context "and a size is not specified" do
			let(:table) { ToyRobot::Table.new() }
			result = 5
			it "the table.size returns #{result}" do
				expect(table.size).to eq(result)
			end
		end

	end

end
