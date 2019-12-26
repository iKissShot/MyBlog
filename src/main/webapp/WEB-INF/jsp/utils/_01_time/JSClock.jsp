<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>原始JS翻页作业</title>
<style>
* {
	margin: 0;
	padding: 0;
}

ul {
	list-style: none;
}

#box {
	font-size: 60px;
}

#time {
	padding: 20px;
	border: 1px solid #222;
	background: #fff;
	margin: 100px auto;
	height: 173px;
	width: 984px;
}

#time li {
	float: left;
	width: 123px;
	height: 173px;
	overflow: hidden;
}

#time li .num_img {
	position: relative;
	top: 0;
}

#time img {
	display: block;
}
</style>
</head>
<script>
	alert('原声JS翻页时钟');
</script>
</script>
<script type="text/javascript"
	src="/static/jsp/utils/_01_time/JSClock/js/myself.js"></script>
<script type="text/javascript">
	window.onload = function() {
		var box = document.getElementById('box');
		var time = document.getElementById('time');
		var oLi = time.getElementsByTagName('li');
		var len = oLi.length;

		var timer = '';
		var str = '';
		var oldTime = getTime();

		timeImg();

		clearInterval(timer);

		timer = setInterval(timeImg, 1000);

		function getTime() {
			var myTime = new Date(); //获取当前的系统时间

			var myHour = myTime.getHours(); //时
			var myMin = myTime.getMinutes(); //分
			var mySec = myTime.getSeconds(); //秒

			str = toTwo(myHour) + ':' + toTwo(myMin) + ':' + toTwo(mySec);
			return str;
		}

		function toTwo(a) {
			return a < 10 ? '0' + a : '' + a;
		}

		function timeImg() {
			getTime();

			console.log(oldTime + '--' + str);
			//            box.innerHTML = str;

			for (var i = 0; i < len; i++) {

				oLi[i].getElementsByTagName('div')[0].style.top = 0;

				if (i == 2 || i == 5) {

					oLi[i].getElementsByTagName('img')[0].src = '/static/jsp/utils/_01_time/JSClock/img/colon.jpg';

					oLi[i].getElementsByTagName('img')[1].src = '/static/jsp/utils/_01_time/JSClock/img/colon.jpg';

				} else {

					oLi[i].getElementsByTagName('img')[0].src = '/static/jsp/utils/_01_time/JSClock/img/'
							+ oldTime.charAt(i) + '.jpg';

					if (oldTime.charAt(i) == 9) {

						oLi[i].getElementsByTagName('img')[1].src = '/static/jsp/utils/_01_time/JSClock/img/0.jpg';

					} else {

						oLi[i].getElementsByTagName('img')[1].src = '/static/jsp/utils/_01_time/JSClock/img/'
								+ str.charAt(i) + '.jpg';

					}

				}

				if (str.charAt(i) !== oldTime.charAt(i)) {

					doMove(oLi[i].getElementsByTagName('div')[0], 'top', 20,
							-173);

				}

			}
			oldTime = str;
		}

	}
</script>
<body style="background: #000;">
	<div id="box"></div>
	<ul id="time" style="margin-top: 300px">
		<li><div class="num_img">
				<img src="/static/jsp/utils/_01_time/JSClock/img/0.jpg" alt=""><img
					src="/static/jsp/utils/_01_time/JSClock/img/0.jpg" alt="">
			</div></li>
		<li><div class="num_img">
				<img src="/static/jsp/utils/_01_time/JSClock/img/0.jpg" alt=""><img
					src="/static/jsp/utils/_01_time/JSClock/img/0.jpg" alt="">
			</div></li>

		<li><div class="num_img">
				<img src="/static/jsp/utils/_01_time/JSClock/img/0.jpg" alt=""><img
					src="/static/jsp/utils/_01_time/JSClock/img/0.jpg" alt="">
			</div></li>

		<li><div class="num_img">
				<img src="/static/jsp/utils/_01_time/JSClock/img/0.jpg" alt=""><img
					src="/static/jsp/utils/_01_time/JSClock/img/0.jpg" alt="">
			</div></li>
		<li><div class="num_img">
				<img src="/static/jsp/utils/_01_time/JSClock/img/0.jpg" alt=""><img
					src="/static/jsp/utils/_01_time/JSClock/img/0.jpg" alt="">
			</div></li>

		<li><div class="num_img">
				<img src="/static/jsp/utils/_01_time/JSClock/img/0.jpg" alt=""><img
					src="/static/jsp/utils/_01_time/JSClock/img/0.jpg" alt="">
			</div></li>

		<li><div class="num_img">
				<img src="/static/jsp/utils/_01_time/JSClock/img/0.jpg" alt=""><img
					src="/static/jsp/utils/_01_time/JSClock/img/0.jpg" alt="">
			</div></li>
		<li><div class="num_img">
				<img src="/static/jsp/utils/_01_time/JSClock/img/0.jpg" alt=""><img
					src="/static/jsp/utils/_01_time/JSClock/img/0.jpg" alt="">
			</div></li>
	</ul>
</body>
</html>