def get_all_courses
 	return sql("SELECT * FROM courses;")
end



get "/courses" do
  @title="Kurse"
  erb :courses
end


enable :inline_templates

__END__
@@courses

  <section>
    <p>Unsere Kurse:</p>
      <ul>
      <% @courses = get_all_courses %>
      <% @courses.each do |course| %>
		<div class="course">
			<h1><% course["course_name"] %></h1>
		</div>
      <%end%>
      </ul>
  </section>