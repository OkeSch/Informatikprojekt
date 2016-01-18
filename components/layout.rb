enable :inline_templates

__END__

@@ layout
<!DOCTYPE html>
<html>
<head>
	<title><%=@title%></title>
	<style>
		body {
			font-family: sans-serif;
		}
		a:link {
    text-decoration: none;
}

a:visited {
    text-decoration: none;
}

a:hover {
    text-decoration: none;
}

a:active {
    text-decoration: none;
}

		html, body, ul.nav {
			margin: 0px;
			border: 0px;
			padding: 0px;
		}

		th {
			text-align: left;
		}

		ul.nav {
			width: 100%;
			font-weight: bold;
		}

		ul.nav li {
			margin-right: 2em;
			display: inline;
		}

		ul.nav a, ul.nav a:visited {
			color: black;
			text-decoration: none;
		}

		li.user {
			position: absolute;
			right: 0px;
		}

		.tablediv { 
				  float: left; 
				  margin: 1cm;
		}

		.byname {
				 background-color:#99FF99;
				}

		.anonym {
				 background-color:#99FF99;
				}

		.urgent {
				 background-color:#FFAA00;
		}
		.course {
			width: 800px;
			min-height: 100px;
			background-position: left bottom;
			background-repeat: repeat-x;
			border-style: solid;
			border-radius: 50px;
			border-width: 2px;
			padding-left: 10px;
			padding-right: 10px;
			padding-top: 10px;

	}
		.course.a1 {
			background-image: url("/backgrounds/background_c1.png");
		}
		.course.a2 {
			background-image: url("/backgrounds/background_c2.png");
		}
		.course.a3 {
			background-image: url("/backgrounds/background_c3.png");	
		}
		.course.a4 {
			background-image: url("/backgrounds/background_c4.png");	
		}
		.course.a5 {
			background-color: hotpink; 	
		}
		.course.a6 {
			background-color: green; 	
		}

		.trainer {
			width: 800px;
			min-height: 100px;
			background-color: #D2E2FF;
			font-family: decorative;
			border-radius: 75px;
			color: black;
			border-top-style:  solid;
			border-bottom-style: solid;
			border-width: 2px;
			padding-left: 10px;
			padding-right: 20px;
			padding-top: 20px;
		}
			.trainer:hover {
				border-color: gray;
		}
			#trainer_männlich {
			background: url("/backgrounds/trainer_bg_m_0.png");
			}
			#trainer_weiblich {
			background: url("/backgrounds/trainer_bg_w_0.png");
			}
		.coursetype {
			width: 800px;
			height: 200px;
		}
		.coursetype.a1 {
			background: url("/banners/courses_1_0.png");
		}
		.coursetype.a1:hover {
			background: url("/banners/courses_1_1.png");
		}
		.coursetype.a2 {
			background: url("/banners/courses_2_0.png");
		}
		.coursetype.a2:hover {
			background: url("/banners/courses_2_1.png");
		}
		.coursetype.a3 {
			background: url("/banners/courses_3_0.png");
		}
		.coursetype.a3:hover {
			background: url("/banners/courses_3_1.png");
		}
		.coursetype.a4 {
			background: url("/banners/courses_4_0.png");
		}
		.coursetype.a4:hover {
			background: url("/banners/courses_4_1.png");
		}
		.coursetype.a5 {
			background-color: blue;
		}
		.coursetype.a5:hover {
			background-color: orange;
		}
		.coursetype.a6 {
			background-color: green;
		}
		.coursetype.a6:hover {
			background-color: yellow;
		}
		.pic_thumb {
			width: 250px;
			height: 250px;
			background-color: white;
			background-repeat: no-repeat;
			background-position: center;
			border-style: solid;
			border-radius: 30px;
			margin-right: 10px;
			margin-bottom: 10px;
		}

		#footer{
			width: 500px;
			border-width: 2px;
			border-style: solid;
			text-align: center;
			border-radius: 10px;
		}
		.time_div{
			width:100px;
			height:30px;
			background-color: black;
			border-width: 1px;
			border-style: solid;
			margin: 0px;
			padding: 0px;
		}
		#time_table{
			border-collapse: collapse;
			border-width: 0px;
			border-style: none;
			margin-left:auto;
			margin-right:auto;

		}
	</style>
</head>
	<body>
		<div align=center>
		<header>
		    <h1><%= @title %></h1>
		    <nav>
		        <ul class="nav">
		          <li><a href="/" title="Home">Home</a></li>
		          <li><a href="/courses" title="Kurse">Kurse</a></li>
		          <li><a href="/trainer" title="Trainer">Trainer</a></li>
		          <li><a href="/myfit" title="MyFit">MyFit</a></li>
		        </ul>   
		    </nav>
		 </header>
		<br>
		<br>
		<%= yield %>
		<br>
		<br>
		<div id="footer">
			<table width="100%" align="center">
				<tr>
					<td>
						<a href="/home"><b>Start</b></a>
					</td>
					<td>
						<a href="/courses"><b>Kurse</b></a>
					</td>
					<td>
						<a href="/trainer"><b>Trainer</b></a>
					</td>
					<td>
						<a href="/contact"><b>Impressum</b></a>
					</td>
				</tr>
			</table>
		</div>
		<br>
		<br>
		</div>
	</body>
</html>
