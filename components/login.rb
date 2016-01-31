def query_user(name)
    benutzer = sql "SELECT username, hash, user_id FROM users WHERE username='" + name + "' LIMIT 1;"
    if benutzer.size != 1 then
        return nil
    else
        return benutzer[0]
    end
end

def error_display(displayid)
	if @errorid == "1" || @errorid == "3" then
		if displayid == "1" then
			if @errorid == "1" then
				code = ("<script type='text/javascript'>$('#fl_1').show('slow');</script>
						<script type='text/javascript'>document.getElementById('fl_1').innerHTML = 'Kein Username eingegeben!';</script>")
				return code
			elsif @errorid == "3" then
				code = ("<script type='text/javascript'>$('#fl_1').show('slow');</script>
						<script type='text/javascript'>document.getElementById('fl_1').innerHTML = 'Username existiert nicht!';</script>")
			end
		end
	else
		if @errorid == "2" then
			code = ("<script type='text/javascript'>$('#fl_2').show('slow');</script>
					<script type='text/javascript'>document.getElementById('fl_2').innerHTML = 'Kein Passwort eingegeben!';</script>")
			return code
		elsif @errorid == "4" then
			code = ("<script type='text/javascript'>$('#fl_2').show('slow');</script>
					<script type='text/javascript'>document.getElementById('fl_2').innerHTML = 'Falsches Kennwort eingegeben!';</script>")
			return code
		end
	end
	if @errorid == "5" then
		code = ("<script type='text/javascript'>document.getElementById('unt').innerHTML = 'Du musst dich anmelden um MyFit nutzen zu können';</script>
				<script>$('#unt').hide('9999999999');</script>")
		return code
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
    if params['err'] != nil then
    	@errorid = params['err']
    else
    	@errorid = nil
    end
    erb :login
end

post "/login" do
    if params[:username] == "" then
        redirect to("/login?err=1")
    elsif  params[:password] == "" then
    	redirect to("/login?err=2")
    end

    user = query_user(params[:username])
    if user == nil then
        redirect to("/login?err=3")
    end

    if not valid_password?(params[:password], user["hash"]) then
        redirect to("/login?err=4")
    end

    login user
end

get "/logout" do
    logout
end

enable :inline_templates

__END__

@@ login
<script type="text/javascript"> 
    $(document).ready(function(){
  		$(".falselogin").delay(2500).fadeOut(200, function () {
   $(".falselogin").hide('4000');
  });
 });
</script>
<div class="login">
	<form action="/login" method="post">
		<table>
			<tr align="center">
				<td colspan="3">
					<h1>Login</h1></br><h3 color="red" id="unt"></h3>
				</td>
			</tr>
			<tr>
				<td width="50%">
				</td>
				<td align="center">
					<input class="login_form" type="text" name="username" placeholder="Benutzername">
				</td>
				<td width="50%" align="left">
					<div class="falselogin" id="fl_1">
						<%if @errorid != nil then%>
							<%=error_display("1")%>
						<%end%>
					</div>
				</td>
			</tr>
			<tr>
				<td width="50%">
				</td>
				<td align="center">
					<input class="login_form"type="password" name="password" placeholder="Passwort">
				</td>
				<td width="50%" align="left">
					<div class="falselogin" id="fl_2">
						<%if @errorid != nil then%>
							<%=error_display("2")%>
						<%end%>
					</div>
				</td>
			</tr>
			<tr>
				<td align="center" colspan="3">
					<input type="submit" value="Anmelden" class="button login">
				</td>
			</tr>
			<tr>
					<br>
					<td align="center" colspan="3">Noch nicht <a href="/register">registriert</a>?</td>
			</tr>
		</table>
	</form>
</div>