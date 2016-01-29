enable :inline_templates

__END__

@@ layout
<!DOCTYPE html>
<html>
<head>
	<title><%=@title%></title>
	<style>
		@font-face{
			font-family: 'Fontin';
			src: url('/fonts/Fontin-Regular.ttf') format('truetype');
	}
		#navigation {
position: fixed;
top: 0;
width: 100%;
color: #ffffff;
height: 35px;
text-align: center;
padding-top: 15px;
/* Adds shadow to the bottom of the bar */
-webkit-box-shadow: 0px 0px 8px 0px #000000;
-moz-box-shadow: 0px 0px 8px 0px #000000;
box-shadow: 0px 0px 8px 0px #000000;
/* Adds the transparent background */
background-color: rgba(1, 1, 1, 0.8);
color: rgba(1, 1, 1, 0.8);
}

#navigation a {
font-size: 14px;
padding-left: 15px;
padding-right: 15px;
color: white;
text-decoration: none;
}

#navigation a:hover {
color: grey;
}
#nav.user_div {
		position: right;
		height: 30px;
		width: 50px;
		top: 0;
		background-color: grey;
		padding-right: 25px;
		border-style: solid;
		border-width: 2px;
		border-color: white;
} 
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
		.h_bar {
			width: 100%;
			height: 80px;
			background: url("/backgrounds/bar_bg.png");
			background-position: left;
			background-repeat: repeat-x;

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
			background-image: url("/backgrounds/background_c5.png"); 	
		}
		.course.a6 {
			background-color: green; 	
		}

		.trainer {
			width: 770px;
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
			background: url("/banners/courses_5_0.png");
		}
		.coursetype.a5:hover {
			background: url("/banners/courses_5_1.png");
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
			width:25px;
			height:10px;
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
			position: center;

		}
		.regist{
			width: 50%;
			border-radius: 25px;
			border-style: 2px;
			border-width: 1px;
			border-style: solid;
			border-color: black;
			text-align: center;
		}
		.regist.a {
			font-weight: bold;
			width: 50%;
			height: 50px;
			font-size: 22px;
			opacity: 0.3;
		}
		.regist.a:focus{
			opacity: 1;
		}
		.regist.a:visited{
			opacity: 1;
		}
		.regist.btn{
			width: 20px;
			height:5px;

		}
		.comments{
			border-style: solid;
			border-width: 1px;
			width: 100%;
			min-height: 300px;
			border-radius: 30px;
			padding: 10px 10px 10px 10px;
			border-color: grey;
		}
		.comment{
			border-style: solid;
			border-width: 1px;
			border-radius: 10px;
			border-collapse: collapse;
		}
		.comment.name{
			width: 20%;
	}
		.comment.name a{
			color: blue;
			font-size: 20px;
			font-family: Fontin;
				}
		.comment.content{
			padding-left: 10px;
			color: brown;
			font-size: 18px;
			font-family: Fontin;
	}
		.comment form{
			height: 100%;
		}


	</style>
</head>
	<body>
		<div align=center>
		<header>
		    <div id="navigation">
		    	<table align="center" width="100%">
		    	<tr>
		    		<td width="25%">
		    		<td align="center">
		    			<a href="/home">Start</a>
		    			<a href="/trainer">Trainer</a>
		    			<a href="/courses">Kurse</a>
		    			<a href="/myfit">MyFit</a>
		    		</td>
		    		<td width="25%" align="right">
		    			<div id="nav user_div">
		    				<% if logged_in? then %>
		    					<a href="/logout"><%=current_user['username']%></a>
		    				<%else
		    					%><a href="/login">Login</a><%
		    					end %>
		    			</div>
		    		</td>
				</tr>
			</table>
		    </div>
		 </header>
		<br>
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
