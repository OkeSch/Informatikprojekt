def get_trainer(trainer_id)
  return sql("SELECT * FROM trainer WHERE trainer_id='" + trainer_id.to_s + "';")
end

def get_all_days
	return sql("SELECT * FROM course_days;")
end

def get_all_times
	return sql("SELECT * FROM course_times;")
end

def get_course_times(trainer_id)
	return sql("SELECT course_m_times.*, courses.* FROM course_m_times , courses , trainer WHERE course_m_times.course = courses.course_id AND courses.course_trainer_id = '" + trainer_id.to_s + "';")
end

def get_courses(course_trainer_id)
  return sql("SELECT * FROM courses WHERE course_trainer_id = '" + course_trainer_id.to_s + "';")
end

get '/trainer/:id' do
@this_trainer = get_trainer(params[:id])
@title="Trainer - "+@this_trainer[0]["trainer_name"]
@all_times = get_all_times
@courses = get_courses(params[:id])
@course_times = get_course_times(params[:id])
@url = 'trainer/'+ params[:id].to_s
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
	</tr>
	<tr>
		<td align="center">
			<div class="tabreiter">
    		<ul>
		        <li>
		            <input type="radio" name="tabreiter-0" checked="checked" id="tabreiter-0-0" /><label for="tabreiter-0-0">Kurse</label>
		            <div>
		            	<div id="k_head">
		                <a>Kurse</a>
		                </div>
		                <% @courses.each do |course| %>
						<div class="course a<%=course["course_typ_id"]%>" >
						<table width=100% align=center>
							<tr>
								<td colspan=3 width=50% valign="middle" align="center"><a href="/course/<%=course["course_id"]%>"><h2> <%=course["course_name"] %> </h2></a></td>
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
			<%end%>
		                </div>
		        </li><li>
		            <input type="radio" name="tabreiter-0" id="tabreiter-0-1" /><label for="tabreiter-0-1">Trainingszeiten</label>
		            <div>
			            <b>Trainingszeiten:</b><br><br>
							<%=time_table %>
							<% @course_times.each do |time| %>
							<% time_m = (time["day"]+(time["day"]*36))+time["time"]-37%>
						<script>
							document.getElementById('td_<%=time_m%>').style.backgroundColor = "red";
							document.getElementById('tf_<%=time_m%>').href = "/course/<%=time["course_id"]%>"
						</script>
					<% end %>
				</div>
		        </li><li>
		        	<input type="radio" name="tabreiter-0" id="tabreiter-0-2" /><label for="tabreiter-0-2">Kommentare</label>
		        		<div class="comments">
							<%=comments(@url)%>
						</div>
					</li>
		    </ul>
		</div>
	</td>
</tr>
</table>