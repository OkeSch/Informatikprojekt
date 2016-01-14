def get_all_trainers
 	return sql("SELECT * FROM trainer;")
end



get "/trainer" do
  @title="trainer"
  erb :trainer
end


enable :inline_templates

__END__
@@trainer

  <section>
    <p>Unsere Trainer:</p>
      <% @trainers = get_all_trainers %>
      <% @trainers.each do |trainer| %>
		<table>
			<tr>
				<td>
					<a href="/trainer/<%= trainer["trainer_id"] %>">
						<div class="trainer">
							<table width="100%">
								<tr>
									<td align="center"><h2><%=trainer["trainer_speech"]%></h2></td>
									<td align=right rowspan=3><div class="pic_thumb" id="pt_<%=trainer["trainer_id"]%>"</div></td>
										<script>
											document.getElementById('pt_<%=trainer["trainer_id"]%>').style.backgroundImage = "url('<%=trainer["trainer_thumbpath"]%>')";
										</script>
								</tr>
								<tr>
									<td><h3><%=trainer["trainer_name"]%>, <%=trainer["trainer_age"]%> Jahre alt </h3></td>
								</tr>
								<tr>
									<td><h4>Ich trainiere mit euch folgendes:</h4><p><%=trainer["trainer_sector"]%></p></td>
								</tr>
							</table>
						</div>
					</p>
				</td>
			</tr>
		<br>
      <%end%>
	 </table>
  </section>
