def get_all_course_t
 	return sql("SELECT * FROM course_types;")
end




get "/courses" do
  @title="Kurse"
  erb :courses
end


enable :inline_templates

__END__
@@courses
<head>
	<style>
		course_typ_1 {
			background-color: black;
		}
	</style>
</head>
  <section>
    <p>Unsere Kurse:</p>
      <% @course_t = get_all_course_t %>
		<table>
			<% @course_t.each do |course_type|%>
				<tr>
					<td>
						<a href="/courses/<%=course_type["course_typ_id"]%>">
						<div class="course_type<%= course_type["course_typ_id"]%>">				
						</div>
						</a>
					</td>
				</tr>
			<%end%>
		</table>
  </section>