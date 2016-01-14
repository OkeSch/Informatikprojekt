def get_trainer(trainer_id)
  return sql("SELECT * FROM trainer WHERE trainer_id='" + trainer_id.to_s + "';")
end

def get_courses(course_trainer_id)
  return sql("SELECT * FROM courses WHERE course_trainer_id='" + course_trainer_id.to_s + "';")
end

get '/trainer/:id' do
@this_trainer = get_trainer(params[:id])
@title="Trainer - "+@this_trainer[0]["trainer_name"]
@courses = get_courses(params[:id])
erb :show_trainer
end

enable :inline_templates

__END__
@@show_trainer
<table align="center">
	<tr>
		<td width="50%">
			<div>
				<table align="center">
					<tr>
						<td align="right"><b>Name:</b></td>
						<td width="10px"></td>
						<td><%=@this_trainer[0]["trainer_name"]%></td>
						<td rowspan="7" width="250px">
							<div class="pic_thumb" id="pt"</div>
							<script>
								document.getElementById('pt').style.backgroundImage = "url('<%=@this_trainer[0]["trainer_thumbpath"]%>')";
							</script>
						</td>
					</tr>
					<tr>
						<td align="right"><b>Alter:</b></td>
						<td></td>
						<td><%=@this_trainer[0]["trainer_age"]%></td>
					</tr>
					<tr>
						<td align="right"><b>Geschlecht:</b></td>
						<td></td>
						<td><%=@this_trainer[0]["trainer_sex"]%></td>
					</tr>
					<tr>
						<td align="right"><b>Gewicht:</b></td>
						<td></td>
						<td><%=@this_trainer[0]["trainer_weight"]%> kg</td>
					</tr>
					<tr>
						<td align="right"><b>BMI:</b></td>
						<td></td>
						<td><%=@this_trainer[0]["trainer_bmi"]%></td>
					</tr>
					<tr>
						<td align="right"><b>E-Mail Adresse:</b></td>
						<td></td>
						<td><%=@this_trainer[0]["trainer_mail"]%></td>
					</tr>
					<tr>
						<td align="right"><b>Gebiete:</b></td>
						<td></td>
						<td><%=@this_trainer[0]["trainer_sector"]%></td>
					</tr>
					<tr>
						<td colspan="3" align="right"><h2><%=@this_trainer[0]["trainer_speech"]%></h2></td>
					</tr>
				</table>
			</div>
		</td>
		<td>
			<% @courses.each do |course| %>
					<div class="course a<%=course["course_typ_id"]%>" >
						<table width=100% align=center>
							<tr>
								<td colspan=3 width=50% valign="middle" align="center"><h2> <%=course["course_name"] %> </h2></td>
							</tr>
							<tr>
								<td><b>Trainer/in: </b></td>
								<td><%= @this_trainer[0]["trainer_name"]%> </td>
							</tr>
							<tr>
								<td><b>Kurszeiten:</b></td>
								<td><p><%=course["course_times"]%></p></td>
							</tr>
							
							<tr>
								<td colspan=2>
									<b align=left>Beschreibung:</b>
									<p><%=course["course_description"]%></p>
								</td>
							</tr>
						</table>
					</div>
				<hr>
			<%end%>
		</td>
	</tr>
</table>