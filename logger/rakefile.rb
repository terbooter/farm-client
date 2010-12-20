#require 'rubygems'
#require 'bundler'
#require 'bundler/setup'

#require 'rake/clean'
#require 'flashsdk'
#require 'asunit4'


#require 'C:/Ruby192/lib/ruby/gems/1.9.1/gems/sprout-1.0.32.pre/lib/sprout.rb'
require "sprout"
require 'flashsdk'
#sprout("as3")

default_size = "930 550"
project_name = "Logger"

puts "*******************************************"

############################################
# Configure :swc
# http://projectsprouts.org/rdoc/classes/Sprout/COMPCTask.html

desc "Compile SWC"
task :make_swc do
	exe = FlashSDK::COMPC.new
	exe.input=""
	puts exe.class
	compc 'bin/#{project_name}.swc' do |t|
		puts "************t="+t.class.to_s
 		#t.input= 'src/main/ru/terbooter/logging/LoggerImpl.as'
	end
end



##desc 'Compile the project as a SWC'
##task :swc => 'bin/#{project_name}.swc'

##############################
# Debug

# Compile the debug swf
task :make_swf do
	puts "make_swf"
	mxmlc "bin/#{project_name}-debug.swf" do |t|
		puts t.class
	  t.input = "src/main/ru/terbooter/logging/LoggerImpl.as"
	  t.debug = true
	end
end

task :default => :make_swf

##desc "Compile and run the debug swf"
##flashplayer :debug => "bin/SomeProject-debug.swf"

##############################
# Test

##library :asunit4

# Compile the test swf
##mxmlc "bin/SomeProject-test.swf" => :asunit4 do |t|
##  t.input = "src/SomeProjectRunner.as"
##  t.source_path << 'test'
##  t.debug = true
##end

##desc "Compile and run the test swf"
##flashplayer :test => "bin/SomeProject-test.swf"

##task :default => :debug

