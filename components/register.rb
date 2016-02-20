def insert_user(username, pass, email, vname, nname, time)
	sql("INSERT INTO users (username, email, vname, nname, hash, registerdate) VALUES ('" + username + "','" + email + "','" + vname + "','" + nname + "','" + pass + "','"+ time +"');")
end

get "/register" do
    erb :register
end

post "/register" do
	@timedate=Time.now.to_s
	if params[:vorname] == "" || params[:nachname] == "" || params[:username] == "" || params[:password] == "" || params[:password_confirmation] == "" then
		redirect to ("/register")
	end

	if params[:password] != params[:password_confirmation] then
		redirect to("/register")
	end

	user = query_user(params[:username])
	if user == nil then
			user = { "username" => params[:username] }
		else
			redirect to("/register")
	end

	user["hash"] = password_hash params[:password]
	insert_user(user["username"], user["hash"], "" + params[:email]+"", ""+ params[:vorname]+ "", ""+ params[:nachname]+"", ""+ @timedate+"")

	user = query_user(user["username"])

	login user
end

enable :inline_templates

__END__
@@register

<div class="login">
	<form action="/register" method="post">	
		<table>
			<tr>
				<td align="center" colspan="2">
					<h1>Registrieren</h1>
				</td>
			</tr>
			<tr>
				<td>
					<input class="login_form" type="text" name="vorname" placeholder="Vorname">
				</td>
				<td>
					<input class="login_form" type="text" name="nachname" placeholder="Nachname"></br>
				</td>
			</tr>
			<tr>
				<td>
					<input class="login_form" type="text" name="username" placeholder="Benutzername"></br>					
				</td>
				<td>
					<input class="login_form" type="email" name="email" placeholder="E-Mail">	
					
				</td>
			</tr>
			<tr>
				<td>
					<input class="login_form" type="password" name="password" placeholder="Passwort">									
				</td>
				<td>
					<input class="login_form" type="password" name="password_confirmation" placeholder="Bestätigung"></br>
				</td>
			</tr>
			<tr>
				<td align="center" colspan="2">
					<input type="submit" value="Registrieren" class="button login">
				</td>
			</tr>
		
			<tr>
				<td colspan="2" align="center">
					<br>
					Bereits Mitglied? </br>
					<a href="/login">Melde dich an</a>
				</td>
			</tr>
	</table>
	</form>
</div>
