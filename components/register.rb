def insert_user(username, pass, email, vname, nname)
	sql("INSERT INTO users (user_username, user_email, user_vname, user_nname, user_password, user_registerdate) VALUES ('" + username + "','" + email + "','" + vname + "','" + nname + "','" + pass + "','NOW()');")
end

get "/register" do
    erb :register
end

post "/register" do
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
	insert_user(user["username"], user["hash"], "" + params[:email]+"", ""+ params[:vorname]+ "", ""+ params[:nachname]+"")

	user = query_user(user["username"])

	login user


end

enable :inline_templates

__END__
@@register

<div class="register"
	<table>
		<form action="/register" method="post">
			<tr>
				<td>
					<h2>Registrieren</h2>
				</td>
			</tr>
			<tr>
				<td>
					<input type="text" name="vorname" placeholder="Vorname"></br>
				</td>
			</tr>
			<tr>
				<td>
					<input type="text" name="nachname" placeholder="Nachname"></br>
				</td>
			</tr>
			<tr>
				<td>
					<input type="text" name="username" placeholder="Benutzername"></br>
				</td>
			</tr>
			<tr>
				<td>
					<input type="email" name="email" placeholder="E-Mail"></br>
				</td>
			</tr>
			<tr>
				<td>
					<input type="password" name="password" placeholder="Passwort"></br>
				</td>
			</tr>
			<tr>
				<td>
					<input type="password" name="password_confirmation" placeholder="Bestätigung"></br>
				</td>
			</tr>
			<tr>
				<td>
					<input type="submit" value="Registrieren">
				</td>
			</tr>
		</form>
			<tr>
				<td>
					Bereits registriert? </br>
					<a href="/login">Melde dich an</a>
				</td>
			</tr>
	</table>
</div>
