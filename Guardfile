# this line entered following Rspec::Guard error when running integration tests
# rspec_results = File.expand_path('rspec_guard_result')

guard :rspec, cmd: "bundle exec rspec" do
# guard :rspec, results_file: rspec_results, cmd: "bundle exec rspec" do

  # watch /lib/ files
  watch (%r{^lib/(.+).rb$}) do |m| "spec/#{m[1]}_spec.rb" end
  # watch /spec/ files
  watch (%r{^spec/(.+).rb$}) do |m| "spec/#{m[1]}.rb" end
  # watch /spec/spec_helper.rb file
  watch('spec/spec_helper.rb') { "spec" }

end