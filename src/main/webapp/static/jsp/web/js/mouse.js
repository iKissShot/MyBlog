// 禁用拖拽
document.ondragstart = function() {
	return false;
};
// 禁用右键菜单
document.oncontextmenu = function() {
	event.returnValue = false;
};

// 禁用选中功能
document.onselectstart = function() {
	event.returnValue = false;
	return false;
};

// 禁用复制功能
document.oncopy = function() {
	//event.returnValue = false;
};

// 禁用鼠标的左右键
document.onmousedown = function() {
	if (event.which == 1) {// 鼠标左键
		// return false;
	}
	if (event.which == 3) {// 鼠标右键
		return false;
	}
};

// 获取键盘上的输入值
document.onkeydown = function() {
	console.info(event.which);
	if (event.which == 13) {
		console.info("回车键");
	}
};

/* 鼠标特效 */
var a_idx = 0;
$(document).ready(
		function() {
			$("body").click(
					function(e) {
						var a = new Array("❤KissShot我老婆~❤", "❤Kirito老爷~❤",
								"❤Asuna还是我老婆~❤", "❤没有未来的未来不是我想要的未来!❤", "❤达令~❤",
								"❤欢迎来到我的小窝~❤", "❤KissShot.top~❤", "❤喵帕斯~❤",
								"❤萝莉赛高~❤", "❤欧尼酱~❤", "❤勇者部第一点：要好好打招呼~❤",
								"❤勇者部第二点：尽量不要放弃~❤", "❤勇者部第三点：好好吃好好睡~❤",
								"❤勇者部第四点：有烦恼就要一起商量❤", "❤勇者部第五点：凡事都有办法解决~❤");
						// var $i = $("<span></span>").text(a[a_idx]);
						var $i = $("<span></span>").text(
								a[Math.floor(Math.random() * a.length)]);
						a_idx = (a_idx + 1) % a.length;
						var x = e.pageX, y = e.pageY;
						$i.css({
							"z-index" : 999,
							"top" : y - 30,
							"left" : x,
							"position" : "absolute",
							"font-weight" : "bold",
							"color" : "rgba(" + (255 * Math.random()) + ","
									+ (255 * Math.random()) + ","
									+ (255 * Math.random()) + ","
									+ (Math.random() + 0.8) + ")"
						});
						$("body").append($i);
						$i.animate({
							"top" : y - 180,
							"opacity" : 0
						}, 1500, function() {
							$i.remove();
						});
					});
		});