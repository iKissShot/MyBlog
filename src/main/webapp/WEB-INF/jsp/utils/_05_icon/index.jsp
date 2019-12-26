<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<link rel="stylesheet" href="/static/jsp/web/css/gridder.min.css">
<script type="text/javascript" src="/static/jsp/web/js/jquery.min.js"></script>
<script type="text/javascript" src="/static/jsp/web/js/mouse.js"></script>

<title>ICON</title>
<style>
h1 {
	margin-top: 60px;
	text-align: center;
	font-size: 3em;
	font-weight: lighter;
	color: #f99;
}

table {
	width: 80%;
	margin: 60px auto;
	text-align: center;
	border: #f99 1px solid;
	padding: 3px;
}

span {
	width: 30px;
	height: 30px;
	background-repeat: no-repeat;
	background-size: cover;
	background-position: center;
	display: inline-block;
	margin: 20px 10px 0px 10px;
}

input {
	text-align: center;
	width: 70px;
	margin: 10px;
}

td {
	text-align: center;
}

td:hover {
	cursor: pointer;
}

header {
	margin: 0px;
	padding: 0px;
	background: #eee;
	text-align: center;
}

h2 {
	display: inline-block;
	margin: 30px;
	text-align: center;
	font-size: 2.5em;
	font-weight: lighter;
	color: #99f;
}

a {
	transition: 0.3s;
	text-decoration: none;
	color: #99f;
}

a:hover {
	color: #f99
}
</style>

</head>
<body>

	<header>
		<h2>
			<a href="/">返回博客</a>
		</h2>
	</header>

	<h1>好用ICON</h1>

	<table border="1">
		<tbody>
			<tr>
				<td>
					<span class="1/icon_add"></span>
				</td>
				<td>
					<span class="1/icon_del"></span>
				</td>
				<td>
					<span class="1/icon_left"></span>
				</td>
				<td>
					<span class="1/icon_right"></span>
				</td>
				<td>
					<span class="1/icon_up"></span>
				</td>
				<td>
					<span class="1/icon_dw"></span>
				</td>
				<td>
					<span class="1/icon_top"></span>
				</td>
				<td>
					<span class="1/icon_bot"></span>
				</td>
				<td>
					<span class="1/icon_back"></span>
				</td>
				<td>
					<span class="1/icon_refresh"></span>
				</td>
			</tr>
			<tr>
				<td>
					<span class="2/icon_error"></span>
				</td>
				<td>
					<span class="2/icon_success"></span>
				</td>
				<td>
					<span class="2/icon_ok"></span>
				</td>
				<td>
					<span class="2/icon_eye"></span>
				</td>
				<td>
					<span class="2/icon_eye_"></span>
				</td>
				<td>
					<span class="2/icon_fire"></span>
				</td>
				<td>
					<span class="2/icon_fire_"></span>
				</td>
				<td>
					<span class="2/icon_like"></span>
				</td>
				<td>
					<span class="2/icon_like_"></span>
				</td>
				<td>
					<span class="2/icon_love"></span>
				</td>
				<td>
					<span class="2/icon_star"></span>
				</td>
				<td>
					<span class="2/icon_star_"></span>
				</td>
				<td>
					<span class="2/icon_good"></span>
				</td>
				<td>
					<span class="2/icon_thunder"></span>
				</td>
			</tr>
			<tr>
				<td>
					<span class="3/icon_buy"></span>
				</td>
				<td>
					<span class="3/icon_shop"></span>
				</td>
				<td>
					<span class="3/icon_game"></span>
				</td>
				<td>
					<span class="3/icon_car"></span>
				</td>
				<td>
					<span class="3/icon_clouth"></span>
				</td>
				<td>
					<span class="3/icon_member"></span>
				</td>
				<td>
					<span class="3/icon_friend"></span>
				</td>
				<td>
					<span class="3/icon_people"></span>
				</td>
				<td>
					<span class="3/icon_msg"></span>
				</td>
				<td>
					<span class="3/icon_idea"></span>
				</td>
				<td>
					<span class="3/icon_flower"></span>
				</td>
				<td>
					<span class="3/icon_location"></span>
				</td>
			</tr>
			<tr>
				<td>
					<span class="4/icon_question"></span>
				</td>
				<td>
					<span class="4/icon_answer"></span>
				</td>
				<td>
					<span class="4/icon_file"></span>
				</td>
				<td>
					<span class="4/icon_text"></span>
				</td>
				<td>
					<span class="4/icon_email"></span>
				</td>
				<td>
					<span class="4/icon_select"></span>
				</td>
				<td>
					<span class="4/icon_write"></span>
				</td>
				<td>
					<span class="4/icon_set"></span>
				</td>
				<td>
					<span class="4/icon_item"></span>
				</td>
				<td>
					<span class="4/icon_search"></span>
				</td>
				<td>
					<span class="4/icon_flag"></span>
				</td>
			</tr>
			<tr>
				<td>
					<span class="5/icon_amaze"></span>
				</td>
				<td>
					<span class="5/icon_clock"></span>
				</td>
				<td>
					<span class="5/icon_time"></span>
				</td>
				<td>
					<span class="5/icon_download"></span>
				</td>
				<td>
					<span class="5/icon_link"></span>
				</td>
				<td>
					<span class="5/icon_more"></span>
				</td>
				<td>
					<span class="5/icon_qrcode"></span>
				</td>
				<td>
					<span class="5/icon_tip"></span>
				</td>
				<td>
					<span class="5/icon_volumn"></span>
				</td>
			</tr>
		</tbody>
	</table>

	<script type="text/javascript">
		let length = $('span').length;
		let shuffix = '/static/jsp/utils/_05_icon/icon/';
		for (var i = 0; i < length; i++) {
			var img = $('span').eq(i).attr('class');
			console.log(img);
			$('span').eq(i).css('background-image',
					'url(' + shuffix + img + '.png)');
			$('span').eq(i).after(
					'<input readonly="readonly" value="' + img + '"/>');
		}

		var value;
		$('td').mouseover(function() {
			value = $(this).find('input').val();
			$(this).find('input').val(shuffix + value + ".png");
		});
		$('td').mouseout(function() {
			$(this).find('input').val(value);
		});
		$('td').click(function() {
			$(this).find('input').select();
		});
	</script>


	<script type="text/javascript">
		$('header').slideUp(1000);
		$('h1').mouseover(function() {
			$('header').slideDown(1000);
		});
		$('body').mousedown(function() {
			$('header').slideUp(1000);
		});
	</script>

</body>
</html>