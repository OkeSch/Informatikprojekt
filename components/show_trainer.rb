def get_trainer(trainer_id)
  return sql("SELECT * FROM trainer WHERE trainer_id='" + trainer_id.to_s + "';")
end

get '/trainer/:id' do
@this_trainer = get_trainer(params[:id])
@title="Trainer - "+@this_trainer[0]["trainer_name"]
erb :show_trainer
end

enable :inline_templates

__END__
@@show_trainer

<table>
<tr>
<td>
	<a href=/trainer/<%= (@this_trainer[0]["trainer_id"])-1 %> >Zurück</a>
</td>
<td width="100%" align="center"> 
<h1> <%= @this_trainer[0]["trainer_name"] %> </h1>
<h2> <%= @this_trainer[0]["trainer_sex"] %>, <%= @this_trainer[0]["trainer_age"] %>  </h2>
<p>Ich trainier euch auf folgenden Gebieten: <p><h4> <%= @this_trainer[0]["trainer_sector"] %> </h4>
<h1>" <%= @this_trainer[0]["trainer_speech"] %> "</h1>
<img height=25% width=25% src="<%= @this_trainer[0]["trainer_picpath"] %>"> </img>
</td>
<td>
	<a href=/trainer/<%= (@this_trainer[0]["trainer_id"])+1 %> >Vor</a>
</td>
</tr>
</table>