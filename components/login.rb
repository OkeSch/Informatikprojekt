def query_user(name)
    benutzer = sql "SELECT username, hash, user_id FROM users WHERE username='" + name + "' LIMIT 1;"
    if benutzer.size != 1 then
        return nil
    else
        return benutzer[0]
    end
end

def query_user_by_id(id)
    benutzer = sql "SELECT username, hash FROM users WHERE id='" + id.to_s + "' LIMIT 1;"
    if benutzer.size != 1 then
        return nil
    else
        return benutzer[0]
    end
end


get "/login" do
    erb :login
end

post "/login" do
    if params[:username] == "" || params[:password] == "" then
        redirect to("/login")
    end

    user = query_user(params[:username])
    if user == nil then
        redirect to("/login")
    end

    if not valid_password?(params[:password], user["hash"]) then
        redirect to("/login")
    end

    login user
end

get "/logout" do
    logout
end

enable :inline_templates

__END__

@@ login

<div class="login">
	<form action="/login" method="post">
		<table>
			<tr>
				<td>
					<h2>Login</h2>
				</td>
			</tr>
			<tr>
				<td>
					<input type="text" name="username" placeholder="Benutzername">
				</td>
			</tr>
			<tr>
				<td>
					<input type="password" name="password" placeholder="Passwort">
				</td>
			</tr>
			<tr>
				<td>
					<input type="submit" value="Anmelden">
				</td>
			</tr>
			<tr>
				<td><a href="/register">Jetzt registrieren!</a></td>
			</tr>
		</table>
	</form>
</div>