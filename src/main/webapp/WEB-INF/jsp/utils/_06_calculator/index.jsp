<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<link rel="stylesheet" href="/static/jsp/web/css/gridder.min.css">
<script type="text/javascript" src="/static/jsp/web/js/jquery.min.js"></script>
<script type="text/javascript" src="/static/jsp/web/js/mouse.js"></script>

<title>calculator</title>

<style type="text/css">
* {
	margin: 0;
	padding: 0;
}

html, body {
	width: 100%;
	height: 100%;
}

body {
	background: #eee;
}

.container {
	width: 600px;
	margin: 50px auto;
	box-shadow: 0px 0px 100px 1px #fff inset;
}

td {
	width: 150px;
	height: 80px;
	background: #fff;
	padding: 10px;
	text-align: center;
	vertical-align: middle;
	font-size: 2em;
	font-weight: bold;
}

td:hover {
	cursor: pointer;
}

input {
	width: 100%;
	height: 60px;
	border: 0px;
	outline: 0px;
	font-size: 2em;
	font-weight: lighter;
	letter-spacing: 3px;
	text-align: right;
}

#type {
	width: 100%;
	display: flex;
	justify-content: center;
	margin-bottom: 10px;
}

#type div {
	background: #fff;
	width: 33.3%;
	height: 50px;
	color: #666;
	font-size: 2em;
	padding: 10px;
	display: flex;
	justify-content: center;
	align-items: center;
	cursor: pointer;
}

#type .light {
	width: 15px;
	height: 15px;
	margin: 10px;
	border-radius: 100px;
}

.on {
	background: #9f9;
}

.off {
	background: #eee;
}

hr {
	display: block;
	border: 0px;
	outline: 0px;
	background: #aaa;
	width: 100px;
	height: 100px;
}

#more {
	display: none;
}
</style>

</head>
<body>




	<div class="container">

		<div id="type">
			<div>
				<span class="light on"></span>
				计算
			</div>
			<div>
				<span class="light off"></span>
				换算
			</div>
			<div>
				<span class="light off"></span>
				税贷
			</div>
		</div>

		<script type="text/javascript">
			$('#type div').click(function() {
				$('.light').removeClass('on').addClass('off');
				$(this).find('span').removeClass('off').addClass('on');
			});
		</script>

		<div>
			<input readonly="readonly" type="text" id="history" />
			<input readonly="readonly" type="text" id="input" />
			<input readonly="readonly" type="text" id="output" />
		</div>

		<table cellspacing="10px">
			<tr id="more">
				<td id="pow">^</td>
				<td id="sqrt">✓</td>
				<td id="left">(</td>
				<td id="right">)</td>
			</tr>
			<tr>
				<td id="clear">C</td>
				<td id="delete">D</td>
				<td id="remain">%</td>
				<td id="division">/</td>
			</tr>
			<tr>
				<td id="7">7</td>
				<td id="8">8</td>
				<td id="9">9</td>
				<td id="multi">x</td>
			</tr>
			<tr>
				<td id="4">4</td>
				<td id="5">5</td>
				<td id="6">6</td>
				<td id="plus">-</td>
			</tr>
			<tr>
				<td id="1">1</td>
				<td id="2">2</td>
				<td id="3">3</td>
				<td id="add">+</td>
			</tr>
			<tr>
				<td id="mode">M</td>
				<td id="0">0</td>
				<td id="point">.</td>
				<td id="calcu">=</td>
			</tr>
		</table>
	</div>


	<script type="text/javascript">
		$('td')
				.each(
						function() {
							$(this)
									.click(
											function() {
												switch ($(this).attr('id')) {
												case '0':
												case '1':
												case '1':
												case '2':
												case '3':
												case '4':
												case '5':
												case '6':
												case '7':
												case '8':
												case '9':
													$('#input')
															.val(
																	$('#input')
																			.val()
																			+ $(
																					this)
																					.html());
													break;

												case 'point':
												case 'add':
												case 'plus':
												case 'multi':
												case 'division':
												case 'remain':

												case 'pow':
												case 'sqrt':
												case 'left':
												case 'right':
													$('#input')
															.val(
																	$('#input')
																			.val()
																			+ " "
																			+ $(
																					this)
																					.html()
																			+ " ");
													break;
												case 'clear':
													$('#input').val('');
													break;
												case 'delete':
													let txt = $('#input').val();
													let length = txt.length;
													let last = txt[length - 1];
													if (last == ' ')
														$('#input')
																.val(
																		txt
																				.substring(
																						0,
																						length - 3));
													else
														$('#input')
																.val(
																		txt
																				.substring(
																						0,
																						length - 1));
													break;
												case 'mode':
													$('#input').val('');
													if ($('#more').css(
															'display') == 'none') {
														$('#more').css(
																'display',
																'table-row');
													} else {
														$('#more').css(
																'display',
																'none');
													}
													break;
												case 'calcu':
													calculate($('#input').val());
													$('#output').val('result');
													break;
												break;
											}
										});
						});

		function Node(value, left, right) {
			this.value = value;
			this.left = left;
			this.right = right;
			this.show = function() {
				console.log(value + "\nleft ->" + left + "\nright ->" + right);
			};
		}

		function calculate(txt) {
			let arr = txt.split(' ');
			var root = arr[0];
			var curNode = arr[0];
			for ( let value in arr) {
				switch (value) {
				case '0':
				case '1':
				case '2':
				case '3':
				case '4':
				case '5':
				case '6':
				case '7':
				case '8':
				case '9':
					curNode.value = curNode.value + value;
					break;
				case '+':
				case '-':
					curNode.par = new Node(value, null, null);
					curNode = curNode.par;
					break;
				case '*':
				case '/':
					break;
				}
			}
		}
	</script>



</body>
</html>