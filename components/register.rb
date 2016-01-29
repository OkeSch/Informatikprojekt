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

<div class="regist"
	<h1><%=@timedate%></h1>
	<table>
		<form action="/register" method="post">
			<tr>
				<td>
					<h2>Registrieren</h2>
				</td>
			</tr>
			<tr>
				<td>
					<input type="text" name="vorname" placeholder="Vorname" class="regist a">
				</td>
				<td>
					<input type="email" name="email" placeholder="E-Mail" class="regist a"></br>
				</td>
			</tr>
			<tr>
				<td>
					<input type="text" name="nachname" placeholder="Nachname" class="regist a">
				</td>
				<td>
					<input type="password" name="password" placeholder="Passwort" class="regist a"></br>
				</td>
			</tr>
			<tr>
				<td>
					<input type="text" name="username" placeholder="Benutzername" class="regist a">
				</td>
				<td>
					<input type="password" name="password_confirmation" placeholder="Bestätigung" class="regist a"></br>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="Registrieren" class="regist btn">
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
