/**
 * 
 */

// <script type="text/javascript">
$('a').each(function() {
	$(this).attr('target', 'blank');
});
// </script>

// <!-- 提示 -->
// <script type="text/javascript">
// getTip();
function getTip() {
	let hours = new Date().getHours() * 1;
	if (hours < 1)
		$('#tip').html('听话，现在快躺床上，闭上眼睛乖乖碎觉！');
	else if (hours < 2)
		$('#tip').html('快別玩了，不然我就我就要生气了，哼！');
	else if (hours < 4)
		$('#tip').html('你走，立刻走，不要再回來找我了！');
	else if (hours < 6)
		$('#tip').html('这么早，你在干嘛呀~');
	else if (hours < 10)
		$('#tip').html('早上好啊，吃饱了可要好好工作~');
	else if (hours < 11)
		$('#tip').html('呜呜，好饿，中午吃什么好呢~');
	else if (hours < 13)
		$('#tip').html('勇者部条约第三点，好好吃好好睡~');
	else if (hours < 14)
		$('#tip').html('现在可是午睡时间~');
	else if (hours < 15)
		$('#tip').html('打起精神，不然喝杯下午茶?');
	else if (hours < 17)
		$('#tip').html('加油，你可以的的！');
	else if (hours < 18)
		$('#tip').html('工作辛苦啦，差不多该吃饭了哦?');
	else if (hours < 19)
		$('#tip').html('饭后走一走，活到一百九~');
	else if (hours < 20)
		$('#tip').html('夜生活才刚刚开始啊~');
	else if (hours < 22)
		$('#tip').html('修仙模式，启动！');
	else if (hours < 24)
		$('#tip').html('呐，是不是该休息了呢？');
}
// </script>

// <!-- 时间 -->
// <script type="text/javascript">
flushDate();
setInterval(flushDate, 3000);
function flushDate() {
	let d = new Date();
	$('.datetime').find('.font-small').html(
			d.getFullYear() + "-" + fillZero(d.getMonth() + 1) + "-"
					+ fillZero(d.getDay() + 1));
	$('.datetime').find('.font-big').html(
			d.getHours() + ":" + fillZero(d.getMinutes()) + ":"
					+ fillZero(d.getSeconds()));
	getTip();
}
function fillZero(num) {
	return num < 10 ? '0' + num : num;
}
// </script>

// <!-- 切换样式 -->
// <script type="text/javascript">
function changeScreen(elem) {
	let theme = $('#theme').attr('theme');
	let bgType = theme.split('_')[0];
	let widthType = theme.split('_')[1] == '0' ? '1' : '0';

	if (widthType == 1) {
		$(elem).html('窄屏模式');
		$('.container').css('width', '80%');
	} else {
		$(elem).html('宽屏模式');
		$('.container').css('width', '60%');
	}

	$.get('/Utils/Nav/changeTheme/' + (bgType + "_" + widthType), function(
			theme) {
		$('#theme').attr('theme', theme);
	});
}

function changeBG(elem) {
	let theme = $('#theme').attr('theme');
	let bgType = theme.split('_')[0] == '0' ? '1' : '0';
	let widthType = theme.split('_')[1];

	if (bgType == 1) {
		$(elem).html('普通模式');
		$('.body-bg').css('backgroundImage',
				'url(/static/jsp/utils/_02_nav/img/bg4.jpg)');
	} else {
		$(elem).html('绅士模式');
		$('.body-bg').css('backgroundImage',
				'url(/static/jsp/utils/_02_nav/img/bg.jpg)');
	}

	$.get('/Utils/Nav/changeTheme/' + (bgType + "_" + widthType), function(
			theme) {
		$('#theme').attr('theme', theme);
	});
}
// </script>

function getTheme() {
	let theme = $('#theme').attr('theme');
	let bgType = theme.split('_')[0];
	let widthType = theme.split('_')[1];
	// alert(bgType + "_" + widthType);

	$.get('/Utils/Nav/changeTheme/' + theme, function(theme) {
		$('#theme').attr('theme', theme);
	});

	if (bgType == 1) {
		$('#bgChange').html('普通模式');
		$('.body-bg').css('backgroundImage',
				'url(/static/jsp/utils/_02_nav/img/bg4.jpg)');
	} else {
		$('#bgChange').html('绅士模式');
		$('.body-bg').css('backgroundImage',
				'url(/static/jsp/utils/_02_nav/img/bg.jpg)');
	}
	if (widthType == 1) {
		$('#widthChange').html('窄屏模式');
		$('.container').css('width', '80%');
	} else {
		$('#widthChange').html('宽屏模式');
		$('.container').css('width', '60%');
	}
}

getTheme();