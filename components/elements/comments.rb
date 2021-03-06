def get_comments(url)
	return sql("SELECT comments.* , users.username, users.user_id FROM comments , users  WHERE users.user_id = comments.user AND comments.url = '" + url.to_s + "';")
end

def comment(content, userid, url, time)
	sql("INSERT INTO comments (url, content, user, posttime) VALUES ('" + url[0] + "','" + content + "','" + userid.to_s + "','" + time +"');")
end

def delcomment(comment_id)
	backurl = sql("SELECT url FROM comments WHERE comment_id = '" + comment_id + "';")
	sql("DELETE FROM comments WHERE comment_id = '" + comment_id + "';")
	return backurl
end

def comments(url)
	@comments = get_comments(url)
	@url = url.to_s
	erb :comments, :locals => { :url => url }
end

post '/comment/*' do |url|
	@timedate=Time.now.to_s
	user = current_user["user_id"]
	comment(params[:content], user, [url], @timedate)

	redirect("/" + [url][0] + "?state=1")
end

get '/uncomment/*' do |id|
	comment_id = [id][0]
	back_url = delcomment(comment_id)
	redirect("/" + back_url[0]["url"])
end


enable :inline_templates
__END__

@@comments
<script type="text/javascript">
$(document).ready(function(){
    /* Hier der jQuery-Code */
    <% if not logged_in? then%>
    	$('#input_table').hide('fast');
    	$('message').show('slow');
    <%else%>
    	$('#input_table').show('slow');
    	$('message').hide('fast');
	<%end%>
});
</script>
<table width="100%">
	<tr>
		<td>
			<table width="100%" height="100%">
				<% 
				if @comments == nil then%>
					<tr>
						<td align="center">
							<h2>Keine Kommentare vorhanden<h2>
						</td>
					</tr><%
				else
					@comments.each do |comment| %>
					<tr>
						<td>
							<table class="comment" width="100%">
								<tr>
									<td class="comment name">
										<a href="/myfit?user=<%=comment["user_id"]%>""><%=comment["username"]%>: </a>
									</td>
									<td class="comment content">
										<%=comment["content"] %>
									</td>
									<% if logged_in? then
										if current_user["username"] == comment["username"] then
											%>
												<td width="30px">
													<a href="/uncomment/<%=comment["comment_id"]%>">löschen</a>
												</td>
											<%end%>
										<%end%>
								</tr>
								<tr>
									<td class="comment time" colspan="3">
										<%=comment["posttime"]%>
									</td>
								</tr>
							</table
						</td>
					</tr>
					<% end 
				end%>
			</table>
			<table class="comment_input" id="input_table">
				<tr class="input_field">

					<form class="comment form" action="/comment/<%= url %>" method="post">
					<td width="80%">
						<input type="text" name="content" class="comment_form" placeholder="Hier Kommentar eingeben...">
					</td>
					<td>
						<input type="submit" text="Bestätigen" class="button">
					</td>
					</form>
				</tr>

			</table>
		</td>
	</tr>
	<% if not logged_in? then%>
	<tr>
		<td colspan="2" id="message" align="center">
			<h3>Du musst dich <a href="/login">einloggen</a>, um kommentieren zu können</h3>
		</td>
	</tr>
	<%end%>
</table>