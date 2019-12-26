<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>

<script type="text/javascript" src="/static/jsp/web/js/jquery.min.js"></script>
<script type="text/javascript" src="/static/jsp/web/js/mouse.js"></script>

<meta charset="utf-8">
<title>在线去底色</title>

<style type="text/css">
* {
	maring: 0;
	padding: 0;
	text-align: center;
	letter-spacing: 3px;
	text-decoration: none;
}

html, body {
	width: 100%;
	margin: 0px;
	background: #5C4084;
}

header {
	margin: 0;
	width: 100%;
	background: rgba(255, 255, 255, 0.8);
	text-align: center;
}

.container {
	width: 60%;
	min-width: 700px;
	margin: 100px auto;
	text-align: center;
	background: rgba(255, 255, 255, 0.9);
	border-radius: 30px;
	padding: 20px;
}

a {
	display: inline-block;
	font-size: 1.5em;
	transition: 0.3s;
	padding: 20px;
}

a:hover {
	cursor: pointer;
}

h1 a {
	color: #f99;
}

h2 a {
	color: #99f;
}

input {
	cursor: pointer;
	border: 1px #eee solid;
	border-radius: 10px;
	margin: 10px;
	background: #fff;
	padding: 10px;
	color: #666;
	outline: 0;
}

#tip {
	transition: 1s;
}

.showTip {
	font-size: 2em;
	color: red;
}
</style>

</head>
<body>
	<header>
		<h1>
			<a href="/">返回博客</a>
		</h1>
	</header>
	<div class="container">
		<h1>3秒抠图</h1>
		<input type='text' name='name' placeholder="请输入图片名">
		<input type="file" name='file' multiple="multiple" placeholder="请上传图片" accept="image/gif,image/jpeg,image/jpg,image/png" />
		<br />
		<input type="submit" value="上传" />
		<br />

		<aside>
			<div>
				<h2>
					<a id="tip">请输入图片名</a>
				</h2>
			</div>
		</aside>

	</div>
	<script type="text/javascript">
		function check() {
			$('#tip').addClass('showTip');
			setTimeout(function() {
				$('#tip').removeClass('showTip');
			}, 1000);

			if ($('input[type="text"]').val() == '') {
				$('#tip').html('请输入图片名');
			} else if ($('input[type="text"]').val() == '') {
				$('#tip').html('请选择文件');
			} else {
				$('#tip').html('请点击上传');
				return true;
			}

			return false;
		}
		$('input[type="text"]').change(function() {
			check();
		});
		$('input[type="file"]')
				.change(
						function(event) {
							check();

							var filePath = $(this).val();
							var src = window.URL.createObjectURL(this.files[0]);

							var img = '<img id="show" width="700px" id="show" src="' + src + '"/>';
							$('#show').remove();
							$('input[type="submit"]').before(img);
							$('#show').after('<br/>');
						});
		$('input[type="submit"]')
				.click(
						function() {

							if (!check())
								return;

							var formData = new FormData();
							name = $('input[type="text"]').val();
							file = $('input[type="file"]')[0].files[0];
							formData.append('name', name);
							formData.append('file', file);
							formData
									.append("service", 'App.Passion.UploadFile');
							$
									.ajax({
										url : '/Utils/RemoveBG/Upload',
										type : 'POST',
										data : formData,
										async : false,
										contentType : false,
										processData : false,
										success : function(url) {
											if (url == null)
												return;
											//$('body').before('<img alt="' + name + '" src="' + url + '">');
										},
										error : function() {
											//	alert('error');
										},
										complete : function() {
											$('#tip').html('请等待3秒');
											setTimeout(
													function() {
														$('#tip').html('请等待2秒');
														setTimeout(
																function() {
																	$('#tip')
																			.html(
																					'请等待1秒');
																	setTimeout(
																			function() {
																				$(
																						'#tip')
																						.html(
																								'已完成操作');
																				$(
																						'input[type="text"]')
																						.val(
																								'');
																				$(
																						'input[type="file"]')
																						.val(
																								'');
																			},
																			1000);
																}, 1000);
													}, 1000);
											setTimeout(
													function() {
														src = "/image/"
																+ name
																+ ".jpg_no_bg.png";
														$('.container')
																.append(
																		'<img alt="' + name + '" src="' + src + '">');
														$('.container')
																.append(
																		'<h2><a href="' + src + '" download>点我下载图片</a></h2>');
													}, 3000);
										}
									});
						});
	</script>

</body>
</html>