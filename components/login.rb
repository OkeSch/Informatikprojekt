def query_user(name)
    benutzer = sql "SELECT * FROM users WHERE user_username='" + name + "' LIMIT 1;"
    if benutzer.size != 1 then
        return nil
    else
        return benutzer[0]
    end
end

def query_user_by_id(id)
    benutzer = sql "SELECT * FROM users WHERE user_id='" + id.to_s + "' LIMIT 1;"
    if benutzer.size != 1 then
        return nil
    else
        return benutzer[0]
    end
end
get '/login' do
	@title="Login"
	erb :login
end
enable :inline_templates

__END__
@@login

<div class="login">
	<table>
		<form action="/login" method="post">
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
		</form>
	</table>
</div>