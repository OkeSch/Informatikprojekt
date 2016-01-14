def get_song(song_id)
  return sql("SELECT * FROM songs WHERE ID='" + song_id.to_s + "';")
end

get '/songs/:id' do
@this_song = get_song(params[:id])
erb :show_song
end

enable :inline_templates

__END__
@@show_song

  
<h1> <%= @this_song[0]["title"] %> </h1>
<h2> <%= @this_song[0]["lyrics"] %> </h2>