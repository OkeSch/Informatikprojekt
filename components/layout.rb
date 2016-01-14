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
		.course_1 {
			width: 800px;
			min-height: 100px;
			background-image: url("/backgrounds/background_c1.png");
			background-position: left bottom;
			background-repeat: repeat-x;
			border-style: solid;
			border-radius: 50px;
			border-width: 2px;
		}
		.course_2 {
			width: 800px;
			min-height: 100px;
			background-image: url("/backgrounds/background_c2.png");
			background-position: left bottom;
			background-repeat: repeat-x;
			border-style: solid;
			border-radius: 50px;
			border-width: 2px;
		}
		.course_3 {
			width: 800px;
			min-height: 100px;
			background-image: url("/backgrounds/background_c3.png");
			background-position: left bottom;
			background-repeat: repeat-x;
			border-style: solid;
			border-radius: 50px;
			border-width: 2px;		
		}
		.course_4 {
			width: 800px;
			min-height: 100px;
			background-image: url("/backgrounds/background_c4.png");
			background-position: left bottom;
			background-repeat: repeat-x;
			border-style: solid;
			border-radius: 50px;
			border-width: 2px;		
		}
		.course_5 {
			width: 800px;
			min-height: 100px;
			background-color: hotpink; 
			border-style: solid;
			border-radius: 50px;
			border-width: 2px;		
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
		.course_type1 {
			width: 800px;
			height: 200px;
			background: url("/banners/courses_1_0.png");
		}
		.course_type1:hover {
			background: url("/banners/courses_1_1.png");
		}
		.course_type2 {
			width: 800px;
			height: 200px;
			background: url("/banners/courses_2_0.png");
		}
		.course_type2:hover {
			background: url("/banners/courses_2_1.png");
		}
		.course_type3 {
			width: 800px;
			height: 200px;
			background: url("/banners/courses_3_0.png");
		}
		.course_type3:hover {
			background: url("/banners/courses_3_1.png");
		}
		.course_type4 {
			width: 800px;
			height: 200px;
			background: url("/banners/courses_4_0.png");
		}
		.course_type4:hover {
			background: url("/banners/courses_4_1.png");
		}
		.course_type5 {
			width: 800px;
			height: 200px;
			background-color: blue;
		}
		.course_type5:hover {
			background-color: orange;
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
		          <li><a href="/contact" title="Contact">Contact</a></li>
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
