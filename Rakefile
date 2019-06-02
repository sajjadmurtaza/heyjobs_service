require 'rake'
Dir.glob('./lib/**/*.rb') { |f| require f }

desc 'Run Discrepancy Detect to get differences between remote and local'
task :get_discrepancies do
  DiscrepancyDetect.call
end