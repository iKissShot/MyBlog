<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<head>

<script type="text/javascript" src="/static/jsp/web/js/jquery.min.js"></script>
<script type="text/javascript" src="/static/jsp/web/js/mouse.js"></script>

<style>
* {
	margin: 5px;
}

#show {
	display: none;
}

.show-box {
	display: flex;
	justify-content: center;
}

.show-box div {
	margin: 10px;
}

table {
	margin: 0 auto;
	width: 80%;
	max-width: 1100px;
	min-width: 700px;
	border: 1px #f99 solid;
}

td {
	text-align: center;
	vertical-align: middle;
	padding: 5px;
}

ul {
	margin: 50px;
	margin-left: 100px;
	width: 80%;
	list-style-type: none;
}

li {
	margin: 10px;
}

li span {
	display: none;
}

li:last-child span input {
	width: 80px;
}
</style>

</head>

<body>
	<h1>七日天气预报</h1>

	<div id="contain">
		<div>
			<ul>
				<li>
					<label>
						<input checked="checked" name="type" type="radio" value="auto" />
						自动获取IP
					</label>
				</li>
				<li>
					<label>
						<input name="type" type="radio" value="select" />
						手动选取IP
						<span>
							<select id="province">
								<optgroup label="请选择所在省份">
								</optgroup>
							</select>
							<select id="leader">
								<optgroup label="请选择所在地级市">
								</optgroup>
							</select>
							<select id="city">
								<optgroup label="请选择所在县级市">
								</optgroup>
							</select>
						</span>
					</label>
				</li>
				<li>
					<label>
						<input name="type" type="radio" value="manaul" />
						手动设置IP
						<span>
							纬度：
							<input type="number" id="lat" placeholder="116.412534" />
							经度：
							<input type="number" id="lon" placeholder="39.903749" />
						</span>
					</label>
				</li>
				<li>
					<input onclick="submit()" type="button" value="获取" />
				</li>
			</ul>
		</div>
		<div id="show">
			<div class="show-box">
				<div>当前时间</div>
				<div>所在城市</div>
			</div>
			<table border='1' cellpadding='1px'>
				<tr>
					<td>日期</td>
				</tr>
				<tr>
					<td>天气</td>
				</tr>
				<tr>
					<td>温度</td>
				</tr>
				<tr>
					<td>风向</td>
				</tr>
				<tr>
					<td>风级</td>
				</tr>
				<tr id="more">
					<td>更多</td>
				</tr>
			</table>
		</div>
	</div>



	<script type="text/javascript">
		function details(curData, elem) {
			$('#more').nextAll().remove();
			
			let hours = curData['hours'];
			let index = curData['index'];

			let t1 = ("<tr><td colspan='7'>");
			t1 += "<table><tbody>";
			for (let i = 0; i < hours.length; i++) {
				let data = hours[i];
				t1 += ("<tr><td>时间" + data['day'].split('日')[1] + "</td>");
				t1 += ("<td>天气" + data['wea'] + "</td>");
				t1 += ("<td>温度" + data['tem'] + "</td>");
				t1 += ("<td>风向" + data['win'] + "</td>");
				t1 += ("<td>风级" + data['win_speed'] + "</td></tr>");
			}
			t1 += ("</tbody></table>");
			$('table').append(t1 + "</td></tr>");

			let t2 = ("<tr><td colspan='7'>");
			t2 += ("<table><tbody>");
			for (let i = 0; i < index.length; i++) {
 				let data = index[i];
				t2+= ("<tr><td>" + (data['title'] == ""  ? "--" :data['title'] ) + "</td>");
				t2　+= ("<td>" + (data['level'] == null ? "--":data['level'] ) + "</td>");
				t2　+= ("<td>" + data['desc'] + "</td></tr>");
			}
 			t2　+= ("</tbody></table>");
			$('table').append(t2 + "</td></tr>");
			
 			$('#more').nextAll().last().remove();
		}

		function submit() {
			$('#show').css('display', 'block');
			
			let province = $('#province option:selected').val();
			let leader = $('#leader option:selected').val();
			let city = $('#city option:selected').val();
			
			let type =$('input[name="type"]:checked').val(); 
			switch(type){
				case 'auto':
					break;
				case 'select':
					city = 'city=' + $('#city').val();
					break;
				default:
					if($('#lat').val() == null)
						$('#lat').val('117.214536');
					if($('#lon').val() == null)
						$('#lon').val('39.0941689');
					ip = 'ip=' + $('#lat').val() + "," + $('#lon').val();
					break;
			}
 			ip = "ip=120.246763,30.20961";
			let appid = "appid" + "=" + "67137857" + "&";
			let appsecret = "appsecret" + "=" + "iU6iuYMW" + "&";
			let version = "version" + "=" + "v1" + "&";
			let data = appid + appsecret + version;
			var city_;
			var ip;
			if (city_ != null)
				data += city + "&";
			if (ip != null)
				data += ip + "&";
			//alert(data);

			$
					.ajax({
						type : 'GET',
						url : 'https://www.tianqiapi.com/api/',
						data : data,
						error : function() {
							alert('网络错误');
						},
						success : function(res) {
							$('table').find('tr').empty();
							$('#show .show-box').children().empty();

							let img_ = "/static/jsp/utils/_03_weather/img/icon/";
							let data = res['data'];
							$('#show .show-box').children().eq(0).append(
									res['update_time']);
							$('#show .show-box').children().eq(1).append(
									res['country'] + "/" + province + "/" + leader + "/" + city);
							for (let i = 0; i < data.length; i++) {
								let d = data[i];
								$('table').find('tr').eq(0).append(
										"<td>" + d['day'] + " " + d['week']
												+ "</td>");
								$('table')
										.find('tr')
										.eq(1)
										.append(
												"<td>"
														+ "<img src=\"" + img_ + d['wea_img'] + ".png\">"
														+ d['wea'] + "</td>");
								$('table').find('tr').eq(2).append(
										"<td>" + d['tem2'] + "~" + d['tem1']
												+ "</td>");
								$('table').find('tr').eq(3).append(
										"<td>" + d['win'] + " " + "</td>");
								$('table').find('tr').eq(4).append(
										"<td>" + d['win_speed'] + "</td>");
								$('table').find('tr').eq(5).append(
										"<td>" + "<button onclick='details("
												+ JSON.stringify(d)
												+ ", this)'>查看详情</button>"
												+ "</td>");
							}
						}
					});
			return false;
		}
	</script>

	<script type="text/javascript">
		$(':radio').change(function(){
			$(':radio').each(function(){
				$(this).next().css('display', 'none');
			});
			$(this).next().css('display', 'inline');
		});
	</script>

	<script type="text/javascript">
		var MAP;
		
		$.ajax({
			url: '/static/jsp/utils/_03_weather/city.json', 
			complete: function(data){
				//data 是 Unicode string 对象，[{}, {}]
				//由于是请求本地资源，实际是这样{"readState":4,"responseText": data},而这个data是个string
				var provinceMap = new Map();
				//var leaderMap = new Map();
				//var cityMap = new Map();
				//string
				data = data['responseText'];

				//json
				data = JSON.parse(data);
				DATA = data;

				/*
				console.log(provinceMap['p'] == undefined);
				if(provinceMap['江西'] == undefined)
					provinceMap['江西'] = new Map();
				if(provinceMap['江西']['赣州'] == undefined)
					provinceMap['江西']['赣州'] = new Map();
				provinceMap['江西']['赣州']['于都'] = 'a'
				provinceMap['江西']['赣州']['石城'] = 'b'
				console.log(provinceMap['江西']['赣州']['石城']);
				*/
				
				/* 
				for(i = 0; i < 5; i++){
				console.log((provinceMap['江西'] == undefined) + ":" + provinceMap['江西']);
				if((provinceMap['江西'] == undefined)){
					provinceMap['江西'] = new Map();
				}
				console.log((provinceMap['江西'] == undefined) + ":" + provinceMap['江西']);
				}
				*/
				
				for(let i = 0; i < data.length; i++){
					d = data[i];
					p = d['provinceZh'];
					l = d['leaderZh'];
					c = d['cityZh'];
					
					if(provinceMap[p]== undefined){
						provinceMap[p] = new Map();
					}
					//console.log(i + ":" + (provinceMap[p][l] == undefined) + ":" + provinceMap[p][l]);
					if(provinceMap[p][l]== undefined){
						provinceMap[p][l] = new Map();
					}
					console.log(i + ":" + (provinceMap[p][l] == undefined) + ":" + provinceMap[p][l]);
					provinceMap[p][l][c]= c;
					
					//console.log(p + "_" + l + "_" + c + ":" + provinceMap[p][l][c]);
				}
				
				let provContain = $('#province').find('optgroup');
				let leaderContain = $('#leader').find('optgroup');
				let cityContain = $('#city').find('optgroup');
				$('#province').find('optgroup').empty();
				$('#leader').find('optgroup').empty();
				$('#city').find('optgroup').empty();
				
				for(var p in provinceMap){
					//console.log(p);
					provContain.append("<option>" + p + "</option>");
					//console.log(p);
				}
				//console.log(Object.keys(provinceMap['北京']).length);
				for(var l in provinceMap['北京']){
					console.log(l);
					leaderContain.append("<option>" + l + "</option>");
				}
				for(var c in provinceMap['北京']['北京']){
					console.log(c);
					cityContain.append("<option>" + c + "</option>");
				}
				
				MAP = provinceMap;
			}
		});
		
		function toGBK(unicodeStr){
			return unescape(str.replace(/\\u/gi, '%u'));
		}

		$('#province').change(function(){
			flushLeader();
		});
		$('#leader').change(function(){
			flushCity();
		});
		
		function flushLeader(){
			province = $('#province option:selected').val();
			leader;
			$('#leader').find('optgroup').empty();
			$('#city').find('optgroup').empty();
			
			for(var l in MAP[province]){
				$('#leader').find('optgroup').append("<option>" + l + "</option>");
				leader = l;
			}

			for(var c in MAP[province][leader]){
				$('#city').find('optgroup').append("<option>" + c + "</option>");
			}
		}
		function flushCity(){
			province = $('#province option:selected').val();
			leader = $('#leader option:selected').val();
			$('#city').find('optgroup').empty();

			for(var c in MAP[province][leader]){
				$('#city').find('optgroup').append("<option>" + c + "</option>");
			}
		}
	</script>


	<footer></footer>
</body>