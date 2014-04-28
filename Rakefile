require 'kitchen'

# Integration tests. Kitchen.ci
namespace :integration do
  desc 'Run Test Kitchen with Vagrant'
	task :vagrant do
		Kitchen.logger = Kitchen.default_file_logger
		Kitchen::Config.new.instances.each do |instance|
			instance.test(:always)
		end
	end
end
