def get_all_course_inf(course_id)
	return sql("SELECT * FROM courses WHERE course_id='" + course_id.to_s + "';")
end

def get_trainer_inf(trainer_id)
	return sql("SELECT * FROM trainer WHERE trainer_id='" + trainer_id.to_s + "';")
end

get '/course/:id' do
	if params[:state] != nil then
		@state = 1
	else
		@state = 0
	end
  @title="Kurse"
  @course = get_all_course_inf(params[:id])
  @trainer = get_trainer_inf(@course[0]["course_trainer_id"])
  @url = 'course/'+ params[:id].to_s
  erb :course
end

enable :inline_templates

__END__
@@course
<script type="text/javascript">
	$(document).ready(function(){
    /* Hier der jQuery-Code */
    	$('#comment_btn').click(function(){
    		$('#comment_div').show('650');
    		$('#comment_btn').hide()
    })
    	<% if @state == 1 then
    		%>  $('#comment_div').show('fast');
    			$('#comment_btn').hide('fast');
    		<%end%>
});
</script>
	<table>
		<tr>
			<td>
				<div class="trainer">
					<table width="100%">
						<tr>
							<td></td>
							<td></td>
							<td rowspan="3" align="right">
								<div class="pic_thumb" id="pt">
								</div>
								<script>
									document.getElementById('pt').style.backgroundImage = "url('<%=@trainer[0]["trainer_thumbpath"]%>')";
								</script>
							</td>
						</tr>
						<tr>

							<td colspan="2" align="center">
								<h1><%=@course[0]["course_name"]%></h1>
							</td>
						</tr>
						<tr>
							<td colspan="">
								<b>Beschreibung:</b>
							</td>
						</tr>
						<tr>
							<td colspan="3">
								<p><%=@course[0]["course_description"]%></p>
							</td>
						</tr>
						<tr>
							<td align="right">
								<b>Trainer/in: </b>
							</td>
							<td>
								<%=@trainer[0]["trainer_name"]%>
							</td>
						</tr>
						<tr>
							<td align="right">
								<b>Wo startet der Kurs: </b>
							</td>
							<td>
								<%=@course[0]["course_location"]%>
							</td>
						</tr>
						<tr>
							<td align="right">
								<b>Was muss ich mitnehmen?</b>
							</td>
							<td>
								<%=@course[0]["course_requirements"]%>
							</td>
						</tr>
						<tr>
							<td align="right">
								<b>Kosten: 
							</td>
							<td>
								</b><%=@course[0]["course_price"].to_s%> €
							</td>
						</tr>
					</table>
					<br>
					<br>
					<br>
				</div>
			</td>
		</tr>
		<tr>
			<td align="center">
				<div class="comments" id="comment_div">
					<%=comments(@url)%>
				</div>
				<button class="button" id="comment_btn">Kommentieren</>
			<td>
	</table>