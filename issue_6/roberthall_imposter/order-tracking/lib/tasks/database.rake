require 'rubygems'
require 'imposter'


namespace :imposter do
	desc "Build imposters into Fixtures.  Load specific Imposters using Imposters=x,y." 
	task :load do
	   	Imposter::genimposters
	end
end

