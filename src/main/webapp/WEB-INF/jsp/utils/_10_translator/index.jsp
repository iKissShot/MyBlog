<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<head>

<script type="text/javascript" src="/static/jsp/web/js/jquery.min.js"></script>
<script type="text/javascript" src="/static/jsp/web/js/mouse.js"></script>

<meta charset="utf-8">
<title>超简翻译</title>

<style type="text/css">
* {
	maring: 0;
	padding: 0;
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

.row {
	display: flex;
	justify-content: center;
}

.row div {
	width: 100%;
	justify-content: center;
	margin: 10px;
}

.row div textarea {
	padding: 30px;
	width: 100%;
	height: 400px;
	font-size: 1.2em;
	font-family: "幼圆";
	resize: vertical;
	max-height: 500px;
}

textarea::-webkit-scrollbar {
	display: none;
}

#type {
	margin: 10px;
}

#select {
	margin: 30px;
}

#select span {
	padding: 10px;
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
		<h1>超简翻译</h1>
		<div>
			<div id="type">
				<div>
					<label>
						<input name="type" checked="checked" type="radio" value="auto">
						默认翻译
					</label>
				</div>
				<div>
					<label>
						<input name="type" type="radio" value="manual">
						手动配置
					</label>
				</div>
			</div>
			<div id="select">
				<span>
					翻译引擎
					<select>
						<option selected="selected" value="youdao">Youdao</option>
						<option value="google">Google</option>
					</select>
				</span>
				<span>
					翻译类型
					<select>
						<option selected="selected" value="zh_en">中 -> 英</option>
						<option value="zh_ja">中 -> 日</option>
						<option value="zh_kr">中 -> 韩</option>
						<option value="zh_fr">中 -> 法</option>
						<option value="zh_ru">中 -> 俄</option>
						<option value="en_zh">英 -> 中</option>
						<option value="ja_zh">日 -> 中</option>
						<option value="kr_zh">韩 -> 中</option>
						<option value="fr_zh">法 -> 中</option>
						<option value="ru_zh">俄 -> 中</option>
					</select>
				</span>
			</div>
		</div>
		<div class="row">
			<div class="input">
				<textarea rows="" cols="" placeholder="please input here ..."></textarea>
			</div>
			<div class="output">
				<textarea rows="" readonly="readonly" cols="" placeholder="waitting translate ..."></textarea>
			</div>
		</div>

		<script type="text/javascript">
			$('#select').slideUp('slow');
			$('.output').hide('slow');
			$('input[type="radio"]').change(function() {
				if ($(this).val() == 'auto')
					$('#select').slideUp('slow');
				else
					$('#select').slideDown('slow');
			});
			flag = true;
			timer = null;
			$('.input textarea').keyup(function() {
				timer = setTimeout(translate, 1000);
			});
			function translate() {
				if ($('input textarea').val() == '') {
					$('.output').hide('slow');
					$('.output textarea').val('');
					return;
				}
				var input = $('.input textarea').val();
				var engine = 'youdao';
				var type = 'AUTO';
				var url;
				if ($('input[name="type"]').val() == 'namual') {
					engine = $('select').eq(0).find('option:selected').val();
					type = $('select').eq(1).find('option:selected').val();
				}

				if (engine == 'youdao')
					url = 'http://fanyi.youdao.com/translate?&doctype=json&type='
							+ type + '&i=' + input;
				else
					url = 'http://translate.google.cn/translate_a/single?client=gtx&dt=t&dj=1&ie=UTF-8&sl=auto&tl='
							+ type + '&q=' + input;
				console.log(input + "\n" + type + "\n" + engine + "\n" + url);
				$.ajax({
					type : 'POST',
					url : '/Utils/Translator/translate',
					data : url,
					complete : function(result) {
						if (engine == 'youdao') {
							console.log(JSON.stringify(result, null, '  '));
							console.log(typeof (result) + "\n" + result);
							result = JSON.parse(result['responseText']);
							console.log(typeof (result) + "\n" + result);
							result = result['translateResult'][0][0];
							console.log(typeof (result) + "\n" + result);
							result = JSON.stringify(result);
							console.log(typeof (result) + "\n" + result);
							result = JSON.parse(result);
							console.log(typeof (result) + "\n" + result);
							result = result['tgt'];
							console.log(typeof (result) + "\n" + result);
						}
						$('.output textarea').val(result);
					}
				});
			}
			$('.input textarea').keydown(function() {
				console.log($(this).val());
				if ($(this).val() == '') {
					$('.output').hide('slow');
					$('.output textarea').val('');
				} else {
					clearTimeout(timer);
					$('.output').show('slow');

					$(this).css('height', $(this)[0].scrollHeight);
					$('.output textarea').css('height', $(this).css('height'));

					var height = $(this).css('height');

					console.log($(this).attr('rows'));
					if (height.substring(0, height.length - 2) > 400) {
						if (flag)
							$('.row').hide('hide').show('slow');
						flag = false;
						$('.row').css('display', 'block');
					} else {
						$('.row').css('display', 'flex');
					}
				}
			});
		</script>

	</div>
</body>
</html>