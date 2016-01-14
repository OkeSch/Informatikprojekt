def get_all_songs
 	return sql("SELECT * FROM songs;")
end



get "/songs" do
  @title="Lieder"
  erb :songs
end


enable :inline_templates

__END__
@@songs

  <section>
    <p>Songs von Frank Sinatra:</p>
      <ul>
      <% @songs = get_all_songs %>
      <% @songs.each do |song| %>
      	<li><a href=/songs/<%= song["id"] %> ><%= song["title"] %></a></li>
      <%end%>
      </ul>
  </section>
