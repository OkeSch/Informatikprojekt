def get_users
		return sql("SELECT user_id, username, vname FROM users;")
end

def get_user(user_id)
	return sql("SELECT user_id, username, vname, nname, email FROM users WHERE user_id='" + user_id + "';")
end

def get_userdata(user_id)
    return sql("SELECT * FROM users_data WHERE user_id='" + user_id + "';")
end

def insert_userdata(user_id, bday, city, goals, fear, height, weight, aboutme, friends, food, drink, job)
    sql("REPLACE INTO users_data (user_id, bday, city, weight, height, goals, aboutme, friends, fear, food, job, drink) VALUES ('" + user_id.to_s + "', '" + bday + "', '" + city + "', '" + weight + "', '" + height +"', '" + goals + "', '" + aboutme + "', '" + friends + "', '" + fear + "', '" + food + "', '" + job + "', '" + drink + "');")
end
get '/myfit' do
	if params[:user] != nil then
		@user_param = params[:user]
	else
		@user_param = 0
	end
  @title="MyFit"
  if not logged_in? then
		redirect to "/login?err=5"
	end
  erb :myfit
end

post '/myfit' do
    insert_userdata(current_user["user_id"], params[:bday], params[:city], params[:goals], params[:fear], params[:height], params[:weight], params[:aboutme], params[:friends], params[:food], params[:drink], params[:job])
end

enable :inline_templates

__END__
@@myfit

<h2>MyFit</h2>
	<%if @user_param == 0 then%>
<div class="tabreiter">
    <ul>
        <li>
            <input type="radio" name="tabreiter-0" checked="checked" id="tabreiter-0-0" /><label for="tabreiter-0-0">Neuigkeiten</label>
            <div>
                <h3>Lorem Ipsum</h3>
                <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu, pretium quis, sem. Nulla consequat massa quis enim. Donec pede justo, fringilla vel, aliquet nec, vulputate eget, arcu. In enim justo, rhoncus ut, imperdiet a, venenatis vitae, justo. Nullam dictum felis eu pede mollis pretium. Integer tincidunt. Cras dapibus. Vivamus elementum semper nisi. Aenean vulputate eleifend tellus. Aenean leo ligula, porttitor eu, consequat vitae, eleifend ac, enim. Aliquam lorem ante, dapibus in, viverra quis, feugiat a, tellus. Phasellus viverra nulla ut metus varius laoreet. Quisque rutrum. Aenean imperdiet. Etiam ultricies nisi vel augue. Curabitur ullamcorper ultricies nisi. Nam eget dui. Etiam rhoncus. Maecenas tempus, tellus eget condimentum rhoncus, sem quam semper libero, sit amet adipiscing sem neque sed ipsum. Nam quam nunc, blandit vel, luctus pulvinar, hendrerit id, lorem. Maecenas nec odio et ante tincidunt tempus. Donec vitae sapien ut libero venenatis faucibus. Nullam quis ante. Etiam sit amet orci eget eros faucibus tincidunt. Duis leo. Sed fringilla mauris sit amet nibh. Donec sodales sagittis magna. </p>
            </div>
        </li><li>
            <input type="radio" name="tabreiter-0" id="tabreiter-0-1" /><label for="tabreiter-0-1">Users</label>
            <div>
            	<%@users = get_users%>
            	<table>
            		<%@users.each do |user|%>
            		<tr>
            			<td><%=user["user_id"]%>
            			</td>
            			<td align="right"><a href="/myfit?user=<%=user["user_id"]%>"><%=user["username"]%></a>
            			</td>
            			<td>
            				<%=user["vname"]%>
            			</td>
            		</tr>
            		<%end%>
            	</table>

            </div>
        </li><li>
            <input type="radio" name="tabreiter-0" id="tabreiter-0-2" /><label for="tabreiter-0-2">Einstellungen</label>
            <%@userdata = get_userdata(current_user['user_id'].to_s)%>
            <div>
                <h3>Einstellungen</h3>
                <div class="options">
                    <form action="/myfit" method="post">
                    <table>
                    <% if @userdata[0] == nil then%>
                        <tr>
                            <td>
                                <h2>Geburtstag: </h2>
                            </td>
                            <td>
                                <input class="login_form" type="text" name="bday" placeholder="TT.MM.JJJJ">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <h2>Heimatstadt: </h2>
                            </td>
                            <td>
                                <input class="login_form" type="text" name="city">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <h2>Ziele: </h2>
                            </td>
                            <td>
                                <input class="login_form" type="text" name="goals">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <h2>Ängste: </h2>
                            </td>
                            <td>
                                <input class="login_form" type="text" name="fear">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <h2>Größe: </h2>
                            </td>
                            <td>
                                <input class="login_form" type="text" name="height"> cm
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <h2>Dicke: </h2>
                            </td>
                            <td>
                                <input class="login_form" type="text" name="weight"> kg
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <h2>Über Mich: </h2>
                            </td>
                            <td>
                                <input class="login_form" type="text" name="aboutme">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <h2>Friendzz: </h2>
                            </td>
                            <td>
                                <input class="login_form" type="text" name="friends">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <h2>Lieblingsessen: </h2>
                            </td>
                            <td>
                                <input class="login_form" type="text" name="food">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <h2>Lieblingstrinken: </h2>
                            </td>
                            <td>
                                <input class="login_form" type="text" name="drink">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <h2>Job: </h2>
                            </td>
                            <td>
                                <input class="login_form" type="text" name="job">
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2">
                                <input type="submit" value="Bestätigen" class="button login">
                            </td>
                        </tr>
                    <%elsif @userdata[0] != nil then%>
                    <tr>
                            <td>
                                <h2>Geburtstag: </h2>
                            </td>
                            <td>
                                <input class="login_form" type="text" name="bday" value="<%=@userdata[0]["bday"]%>">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <h2>Heimatstadt: </h2>
                            </td>
                            <td>
                                <input class="login_form" type="text" name="city" value="<%=@userdata[0]["city"]%>">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <h2>Ziele: </h2>
                            </td>
                            <td>
                                <input class="login_form" type="text" name="goals" value="<%=@userdata[0]["goals"]%>">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <h2>Ängste: </h2>
                            </td>
                            <td>
                                <input class="login_form" type="text" name="fear" value="<%=@userdata[0]["fear"]%>">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <h2>Größe: </h2>
                            </td>
                            <td>
                                <input class="login_form" type="text" name="height" value="<%=@userdata[0]["height"]%>"> cm
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <h2>Dicke: </h2>
                            </td>
                            <td>
                                <input class="login_form" type="text" name="weight" value="<%=@userdata[0]["weight"]%>"> kg
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <h2>Über Mich: </h2>
                            </td>
                            <td>
                                <input class="login_form" type="text" name="aboutme" value="<%=@userdata[0]["aboutme"]%>">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <h2>Friendzz: </h2>
                            </td>
                            <td>
                                <input class="login_form" type="text" name="friends" value="<%=@userdata[0]["friends"]%>">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <h2>Lieblingsessen: </h2>
                            </td>
                            <td>
                                <input class="login_form" type="text" name="food" value="<%=@userdata[0]["food"]%>">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <h2>Lieblingstrinken: </h2>
                            </td>
                            <td>
                                <input class="login_form" type="text" name="drink" value="<%=@userdata[0]["drink"]%>">
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <h2>Job: </h2>
                            </td>
                            <td>
                                <input class="login_form" type="text" name="job" value="<%=@userdata[0]["job"]%>">
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2">
                                <input type="submit" value="Bestätigen" class="button login">
                            </td>
                        </tr>

                    <%end%>
                    </table>

                    
                </div>
            </div>
        </li><li>
            <input type="radio" name="tabreiter-0" id="tabreiter-0-3" disabled="disabled" /><label for="tabreiter-0-3">LOLOL</label>
            <div>
                <h3>Trappatoni 1998</h3>
                <p>Es gibt im Moment in diese Mannschaft, oh, einige Spieler vergessen ihnen Profi was sie sind. Ich lese nicht sehr viele Zeitungen, aber ich habe gehört viele Situationen. Erstens: wir haben nicht offensiv gespielt. Es gibt keine deutsche Mannschaft spielt offensiv und die Name offensiv wie Bayern. Letzte Spiel hatten wir in Platz drei Spitzen: Elber, Jancka und dann Zickler. Wir müssen nicht vergessen Zickler. Zickler ist eine Spitzen mehr, Mehmet eh mehr Basler. Ist klar diese Wörter, ist möglich verstehen, was ich hab gesagt? Danke. Offensiv, offensiv ist wie machen wir in Platz. Zweitens: ich habe erklärt mit diese zwei Spieler: nach Dortmund brauchen vielleicht Halbzeit Pause. Ich habe auch andere Mannschaften gesehen in Europa nach diese Mittwoch. Ich habe gesehen auch zwei Tage die Training. Ein Trainer ist nicht ein Idiot! Ein Trainer sei sehen was passieren in Platz. In diese Spiel es waren zwei, drei diese Spieler waren schwach wie eine Flasche leer! Haben Sie gesehen Mittwoch, welche Mannschaft hat gespielt Mittwoch? Hat gespielt Mehmet oder gespielt Basler oder hat gespielt Trapattoni? Diese Spieler beklagen mehr als sie spielen! Wissen Sie, warum die Italienmannschaften kaufen nicht diese Spieler? Weil wir haben gesehen viele Male solche Spiel!</p>
            </div>
        </li>
    </ul>
</div>
<%else%>
<%@user = get_user(@user_param.to_s)%>
<%@userdata = get_userdata(@user_param.to_s)%>
    <table>
    <tr>
    <td>
    <table>
        <tr>
            <td align="right">
                <h3><u>Benutzername:</u></h3>
            </td>
            <td>
                <h3><%=@user[0]["username"]%></h3>
            </td>
        </tr>
        <tr>
            <td align="right">
                <h3><u>Name:</u></h3>
            </td>
            <td>
                <h3><%=@user[0]["vname"]%> <%=@user[0]["nname"]%></h3>
            </td>
        </tr>
        <tr>
            <td align="right">
                <h3><u>E-Mail</u></h3>
            </td>
            <td>
                <h3><%=@user[0]["email"]%></h3>
            </td>
        </tr>
    </table>
    </td>
</tr>
<tr>
    <td>
        <% if @userdata[0] != nil then%>
        <table>
            <tr>
                <td>
                    Geburtstag:
                </td>
                <td>
                    <%=@userdata[0]["bday"]%>
                </td>
            </tr>
            <tr>
                <td>
                    Heimatstadt:
                </td>
                <td>
                    <%=@userdata[0]["city"]%>
                </td>
            </tr>
            <tr>
                <td>
                    Gewicht:
                </td>
                <td>
                    <%=@userdata[0]["weight"]%> kg
                </td>
            </tr>
            <tr>
                <td>
                    Größe:
                </td>
                <td>
                    <%=@userdata[0]["height"]%> cm
                </td>
            </tr>
            <tr>
                <td>
                    Ziele:
                </td>
                <td>
                    <%=@userdata[0]["goals"]%>
                </td>
            </tr>
            <tr>
                <td>
                    Über Mich:
                </td>
                <td>
                    <%=@userdata[0]["aboutme"]%>
                </td>
            </tr>
            <tr>
                <td>
                    Freunde:
                </td>
                <td>
                    <%=@userdata[0]["friends"]%>
                </td>
            </tr>
            <tr>
                <td>
                    Ängste:
                </td>
                <td>
                    <%=@userdata[0]["fear"]%>
                </td>
            </tr>
            <tr>
                <td>
                    Lieblingsessen:
                </td>
                <td>
                    <%=@userdata[0]["food"]%>
                </td>
            </tr>
            <tr>
                <td>
                    Job:
                </td>
                <td>
                    <%=@userdata[0]["job"]%>
                </td>
            </tr>
            <tr>
                <td>
                    Trinken:
                </td>
                <td>
                    <%=@userdata[0]["drink"]%>
                </td>
            </tr>
        </table>
        <%elsif @userdata[0] == nil%>
        <h2>Der Benutzer hat keine Daten bereitgestellt</h2>
        <%end%>
    </td>
</tr>
</table>
<%end%>
