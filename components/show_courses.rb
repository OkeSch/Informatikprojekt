def get_courses(course_typ_id)
  return sql("SELECT * FROM courses WHERE course_typ_id='" + course_typ_id.to_s + "';")
end

def get_trainer(trainer_id)
	return sql("SELECT * FROM trainer WHERE trainer_id='" + trainer_id.to_s + "';")
end

get '/courses/:id' do
@courses = get_courses(params[:id])
erb :show_courses
end

enable :inline_templates

__END__
@@show_courses
<table>  
			<% @courses.each do |course| %>
	<tr>
		<td>
			<% @trainer = get_trainer(course["course_trainer_id"]) %>
					<div class="course_<%=course["course_typ_id"]%>" >
						<table width=100% align=center>
							<tr>
								<td colspan=3 width=50% valign="middle" align="center"><h2> <%=course["course_name"] %> </h2></td>
							</tr>
							<tr>
								<td><b>Trainer/in: </b></td>
								<td><%= @trainer[0]["trainer_name"]%> </td>
								<td align="right" rowspan="4"><div class="pic_thumb" id="pt_<%=course["course_id"]%>"</div></td>
								<script>
									document.getElementById('pt_<%=course["course_id"]%>').style.backgroundImage = "url('<%=@trainer[0]["trainer_thumbpath"]%>')";
								</script>
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
				</td>
				</tr>
			<%end%>
</table>
