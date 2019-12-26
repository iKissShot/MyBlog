<%@page import="top.kissshot.myblog.pojo.ColorPlattes"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>颜色拾取器</title>
<meta name="viewport" content="width=device-width，initial-scale= 1">
<link rel="stylesheet" href="/static/jsp/utils/_04_color/css/gridder.min.css">
<link rel="stylesheet" href="/static/jsp/utils/_04_color/css/application.css">

<script type="text/javascript" src="/static/jsp/web/js/jquery.min.js"></script>
<script type="text/javascript" src="/static/jsp/web/js/mouse.js"></script>

<style type="text/css">
body {
	background: #fff;
}

.container {
	width: 100%;
}

select {
	margin: 30px;
}
</style>
</head>
<body>


	<header style="width: 100%; position: fixed; top: 0px;" class="bg-fff">
		<div class="container">
			<div class="row">
				<div class="tiny-12 small-10 line-right flex-middle bottom-shadow" id="left">
					<span class="font-big font-f99" style="display: inline-block; margin: 30px">不配色</span>
					<span style="margin: 10px">
						Order By
						<label style="margin: 10px">
							<input checked="checked" type="radio" name="type" value="Popular" />
							Popular
						</label>
						<label style="margin: 10px">
							<input type="radio" name="type" value="New" />
							New
						</label>
					</span>
				</div>
				<div class="tiny-12 small-2 line-right flex-center flex-middle" id="right">
					<span class=" font-big font-f99">
						<a href="/">返回博客</a>
					</span>
				</div>
			</div>
		</div>
		<hr />
	</header>

	<div class="container" style="padding-top: 80px;">
		<div class="row">
			<div class="tiny-12 small-10 line-right" id="left">

				<div style="margin: 30px">



					<div class="box left" id="upColor">
						<div onclick="changeColor(this);" id="1412" class="container marb5">
							<div class="row">
								<div id="c1" class="small-6 pad10 wh100 flex-center flex-middle font-fff" style="background: #000">
									1
									<input type="color" class="box" onchange="selectColor(this)">
								</div>
								<div id="c2" class="small-6 pad10 wh100 flex-center flex-middle font-fff" style="background: #555">
									2
									<input type="color" class="box" onchange="selectColor(this)" />
								</div>
							</div>
							<div class="row">
								<div id="c3" class="small-6 pad10 wh100 flex-center flex-middle font-fff" style="background: #aaa">
									3
									<input type="color" class="box" onchange="selectColor(this)" />
								</div>
								<div id="c4" class="small-6 pad10 wh100 flex-center flex-middle font-fff" style="background: #eee">
									4
									<input type="color" class="box" onchange="selectColor(this)" />
								</div>
							</div>
						</div>
						<div class="flex-between flex-middle">
							<div class="flex-center" style="width: 100%">
								<span class="border" onclick="updateColor(this)">
									<span>上传配色</span>
								</span>
							</div>
						</div>
					</div>


					<%
						List<ColorPlattes> colorPlattes = (List<ColorPlattes>) request.getAttribute("colors");
						for (ColorPlattes c : colorPlattes) {
							StringBuffer buffer = new StringBuffer();

							buffer.append("<div class=\"box left\">");
							buffer.append(
									"<div onclick=\"changeColor(this);\" id=\"" + c.getCid() + "\" class=\"container marb5\">");
							buffer.append("<div class=\"row\">");
							buffer.append(
									"<div id=\"color\" class=\"small-6 bg-f99 pad10 wh100 flex-center flex-middle font-fff\" style=\"background:#"
											+ c.getColor1() + "\"></div>");
							buffer.append(
									"<div id=\"color\" class=\"small-6 bg-99f pad10 wh100 flex-center flex-middle font-fff\" style=\"background:#"
											+ c.getColor2() + "\"></div>");
							buffer.append("</div>");
							buffer.append("<div class=\"row\">");
							buffer.append(
									"<div id=\"color\" class=\"small-6 bg-ff9 pad10 wh100 flex-center flex-middle font-fff\" style=\"background:#"
											+ c.getColor3() + "\"></div>");
							buffer.append(
									"<div id=\"color\" class=\"small-6 bg-9f9 pad10 wh100 flex-center flex-middle font-fff\" style=\"background:#"
											+ c.getColor4() + "\"></div>");
							buffer.append("</div>");
							buffer.append("</div>");
							buffer.append("<div class=\"flex-between flex-middle\">");
							buffer.append("<div class=\"flex-center\">");
							buffer.append(
									"<span onclick=\"likeCountUp(this);\" class=\"border\"> <div class=\"icon-like\"></div><span>"
											+ c.getLikecount() + "</span> </span>");
							buffer.append("<span class=\"border\"> <div class=\"icon-fire\"></div><span>" + c.getViewcount()
									+ "</span>  </span>");
							buffer.append("</div>");
							buffer.append("<span class=\"font-small\">" + c.getDate() + "</span>");
							buffer.append("</div>");
							buffer.append("</div>");

							out.print(buffer);
						}
					%>






				</div>


			</div>
			<div class="tiny-12 small-2" id="right" style="padding: 30px;">
				<div style="position: fixed;">

					<p id="tip" class="font-f99 font-big flex-center flex-middle">请选择</p>
					<table id="show" style="display: none">

						<tr style="position: absolute;">
							<td>
								<div id="color1" class="border"
									style="position: absolute; display: flex; justify-content: center; flex-direction: column; align-items: center;">
									<div class="wh200 bg-f99 border flex-center flex-middle font-fff font-big">1</div>
									<div style="display: flex; flex-direction: column;">
										<input type="text" readonly="readonly" class="copy border flex-center" value="#E2DC7C" />
										<input type="text" readonly="readonly" class="copy border flex-center" value="rgba(226,220,124,1)" />
									</div>
								</div>
							</td>
						</tr>
						<tr style="position: absolute; top: 200px">
							<td>
								<div id="color2" class="border"
									style="position: absolute; display: flex; justify-content: center; flex-direction: column; align-items: center;">
									<div class="wh200 bg-f99 border flex-center flex-middle font-fff font-big">2</div>
									<div style="display: flex; flex-direction: column;">
										<input type="text" readonly="readonly" class="copy border flex-center" value="#E2DC7C" />
										<input type="text" readonly="readonly" class="copy border flex-center" value="rgba(226,220,124,1)" />
									</div>
								</div>
							</td>
						</tr>
						<tr style="position: absolute; top: 400px;">
							<td>
								<div id="color3" class="border"
									style="position: absolute; display: flex; justify-content: center; flex-direction: column; align-items: center;">
									<div class="wh200 bg-f99 border flex-center flex-middle font-fff font-big">3</div>
									<div style="display: flex; flex-direction: column;">
										<input type="text" readonly="readonly" class="copy border flex-center" value="#E2DC7C">
										<input type="text" readonly="readonly" class="copy border flex-center" value="rgba(226,220,124,1)">
									</div>
								</div>
							</td>
						</tr>
						<tr style="position: absolute; top: 600px;">
							<td>
								<div id="color4" class="border"
									style="position: absolute; display: flex; justify-content: center; flex-direction: column; align-items: center;">
									<div class="wh200 bg-f99 border flex-center flex-middle font-fff font-big">4</div>
									<div style="display: flex; flex-direction: column;">
										<input type="text" readonly="readonly" class="copy border flex-center" value="#E2DC7C">
										<input type="text" readonly="readonly" class="copy border flex-center" value="rgba(226,220,124,1)" />
									</div>
								</div>
							</td>
						</tr>


					</table>


				</div>
			</div>
		</div>
	</div>
	<footer></footer>

	<script type="text/javascript">
		function changeColor(elem) {
			let id = $(elem).attr('id');
			color1 = $(elem).find('.row #color').eq(0).css('background-color');
			color2 = $(elem).find('.row #color').eq(1).css('background-color');
			color3 = $(elem).find('.row #color').eq(2).css('background-color');
			color4 = $(elem).find('.row #color').eq(3).css('background-color');
			$('#color1').find('div').first().css('background', color1);
			$('#color2').find('div').first().css('background', color2);
			$('#color3').find('div').first().css('background', color3);
			$('#color4').find('div').first().css('background', color4);

			viewCountUp(elem, id);

			$('#show').css('display', 'block');
			$('#tip').css('display', 'none');
		};

		function viewCountUp(elem, id) {
			$.get("/Utils/Color/viewCountUp/" + id, function(viewCount) {
				$(elem).next().find('.icon-fire').next().html(viewCount);
			});
		}

		function likeCountUp(elem) {
			let id = $(elem).parent().parent().prev().attr('id');
			$.get("/Utils/Color/likeCountUp/" + id, function(likeCount) {
				$(elem).find('span').html(likeCount);
				$(elem).find('div').removeClass('icon-like');
				$(elem).find('div').addClass('icon-heart');
			});
		}

		$('input[type="text"]').click(function() {
			$(this).select();
			return;
			try {
				if (document.execCommand('copy', false, null)) {
					document.execCommand("copy");
					alert("已复制好，可贴粘。");
				} else {
					alert("复制失败，请手动复制");
				}
			} catch (err) {
				alert("复制失败，请手动复制");
			}
		});

		$('input[name="type"]').change(
				function() {
					let type = $('input:checked').val();
					$.get("/Utils/Color/getColors/" + type, function(data) {
						for (let i = 0; i < data.length; i++) {
							let color = data[i];
							let cid = color['cid'];
							let c1 = color['color1'];
							let c2 = color['color2'];
							let c3 = color['color3'];
							let c4 = color['color4'];
							let viewCount = color['viewcount'];
							let likeCount = color['likecount'];
							let date = color['date'];
							let box = $('.box').eq(i);
							console.log(box.find('.container').attr('id') + ":"
									+ cid);
							box.find('.container').attr('id', cid);
							box.find('#color').eq(0).css('background-color',
									"#" + c1);
							box.find('#color').eq(1).css('background-color',
									"#" + c2);
							box.find('#color').eq(2).css('background-color',
									"#" + c3);
							box.find('#color').eq(3).css('background-color',
									"#" + c4);
							if (box.find('.icon-like') == null)
								;
							box.find('.icon-heart').removeClass('icon-heart')
									.addClass('icon-like');
							box.find('.icon-like').next().html(likeCount);
							box.find('.icon-fire').next().html(viewCount);
							box.find('.font-small').html(date);
						}
					});
				});

		function selectColor(elem) {
			$(elem).parent().css('background-color', $(elem).val());
		}

		function rbg2Hex(rgb) {
			let arr = rgb.split(',');
			let r = (arr[0].split('(')[1].trim() * 1).toString(16);
			let g = (arr[1].trim() * 1).toString(16);
			let b = (arr[2].split(')')[0].trim() * 1).toString(16);
			return r + g + b;
		}

		function updateColor(elem) {
			let color = $(elem).parent().parent().prev();
			let c1 = rbg2Hex($('#c1').css('background-color'));
			let c2 = rbg2Hex($('#c2').css('background-color'));
			let c3 = rbg2Hex($('#c3').css('background-color'));
			let c4 = rbg2Hex($('#c4').css('background-color'));
			let url = "/Utils/Color/addColor/" + c1 + "/" + c2 + "/" + c3 + "/"
					+ c4;
			$.get(url, function(cid) {
				alert('成功添加配色');
			});
		}
	</script>

</body>
</html>