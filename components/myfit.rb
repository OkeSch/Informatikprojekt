get '/myfit' do
  @title="MyFit"
  if logged_in? then
		redirect to "/myfit"
	else
		redirect to "/login"
	end
  erb :myfit
end

enable :inline_templates

__END__
@@myfit