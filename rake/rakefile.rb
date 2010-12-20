#require 'C:/Ruby192/lib/ruby/gems/1.9.1/gems/sprout-1.0.32.pre/lib/sprout.rb'
require 'sprout'
require 'flashsdk'

puts compc

desc "------------------------------------"
task :first_task do
	puts "first task"
end

task :second_task => [:first_task] do
	puts "Second Task"
end

task :third_task, [:param] =>:first_task do |t, arg|
	puts "Third Task +#{arg.param}"
	puts File.expand_path(__FILE__)
	puts ENV['ANT_USER']
end

task :default=> [:third_task]