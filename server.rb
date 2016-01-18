require "sinatra"
require 'sinatra/reloader' if development?

require_relative "db/sql"
require_relative "authentication"


Dir[File.join("components","*.rb")].each do |file|
    name = File.join(File.dirname(file), File.basename(file, ".rb"))
    require_relative name
end

get "/" do
	@title="Startseite"
	if logged_in? then
		redirect to "/home"
	else
		redirect to "/home"
	end
end
