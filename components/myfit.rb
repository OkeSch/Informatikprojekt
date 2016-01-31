get '/myfit' do
  @title="MyFit"
  if not logged_in? then
		redirect to "/login?err=5"
	end
  erb :myfit
end

enable :inline_templates

__END__
@@myfit