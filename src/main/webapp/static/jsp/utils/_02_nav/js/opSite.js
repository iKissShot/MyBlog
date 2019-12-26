// <!-- 修改站点信息 -->
// <script type="text/javascript">

function delItem(elem) {
	if ($(elem).closest('.item').siblings().length == 0) {
		alert('至少保留一个站点叭');
		return;
	}
	let sid = $(elem).parent().prev().attr('sid');
	let nextAll = $(elem).parent().parent().nextAll();
	if (confirm('确认删除')) {
		$.get('/Utils/Nav/deleteSite/' + sid, function(b) {
			if (b) {
				$(elem).parent().parent().remove();
				let times = 0;
				for (let i = 0; i < nextAll.length; i++) {
					let a = nextAll.eq(i).find('a').first();
					$.get('/Utils/Nav/reOrderSite/' + a.attr('sid') + "/"
							+ (a.attr('order') * 1 - 1), function(b) {
						if (!b) {
							alert('删除失败');
							document.location.href = '#';
							return;
						} else {
							nextAll.eq(i).find('a').first().attr('order',
									a.attr('order') * 1 - 1);
						}
					});
				}
			} else {
				alert('删除失败');
				document.location.href = '#';
			}
		});
	}
}

function reNameItem(elem) {
	let sid = $(elem).parent().prev().attr('sid');
	let oldName = $(elem).parent().prev().find('span').html();
	let newName = prompt('请输入新的网址名');
	if (newName != null) {
		let data = {
			"sid" : sid,
			"name" : newName
		}
		let jsonData = JSON.stringify(data);
		$.ajax({
			type : 'PUT',
			url : "/Utils/Nav/reNameSite",
			data : jsonData,
			dataType : 'json',
			contentType : "application/json;charset=utf-8",
			complete : function(b) {
				if (b) {
					alert('重命名成功');
					$(elem).parent().prev().find('span').html(newName);
				} else {
					alert('重命名失败');
				}
			},
			error : function() {
				alert('重命名失败');
			}
		});
	}
}

function reUrlItem(elem) {
	let sid = $(elem).parent().prev().attr('sid');
	let oldUrl = $(elem).parent().prev().attr("href");
	let newUrl = prompt('请输入新的网址链接');
	if (newUrl != null) {
		if (confirm('确认重定向') != false) {
			let data = {
				"sid" : sid,
				"url" : newUrl
			}
			let jsonData = JSON.stringify(data);
			alert(jsonData);
			$.ajax({
				type : 'PUT',
				url : "/Utils/Nav/reUrlSite",
				data : jsonData,
				dataType : 'json',
				contentType : "application/json;charset=utf-8",
				complete : function(b) {
					if (b) {
						alert('重定向成功');
						$(elem).parent().prev().attr('href', newUrl);
					} else {
						alert('重定向失败');
					}
				},
				error : function() {
					alert('重定向失败');
				}
			});
		}
	}
}

function reIconItem(elem) {
	alert('暂未添加此功能');
}
// </script>

// <!-- 排序和新增 -->
// <script type="text/javascript">
function mvUpItem(elem) {
	let cur_tr = $(elem).parent().parent();
	let tar_tr = cur_tr.prev();
	let cur_td = cur_tr.find('a').first();
	let tar_td = tar_tr.find('a').first();

	if (tar_tr.length == 0) {
		alert('已是第一个');
	} else {
		url = "/Utils/Nav/reOrderSite/" + cur_td.attr('sid') + "/"
				+ (cur_td.attr('order') * 1 - 1);
		$.get(url, function(b) {
			if (b) {
				cur_td.attr('order', cur_td.attr('order') * 1 - 1);
				url = "/Utils/Nav/reOrderSite/" + tar_td.attr('sid') + "/"
						+ (tar_td.attr('order') * 1 + 1);
				$.get(url, function(b) {
					if (b) {
						tar_td.attr('order', tar_td.attr('order') * 1 + 1);
						tar_tr.before(cur_tr);
					} else {
						alert('下移失败');
					}
				});
			} else {
				alert('上移失败');
			}
		});
	}
}

function mvDownItem(elem) {
	let cur_tr = $(elem).parent().parent();
	let tar_tr = cur_tr.next();
	let cur_td = cur_tr.find('a').first();
	let tar_td = tar_tr.find('a').first();

	if (tar_tr.length == 0) {
		alert('已是最后一个');
	} else {
		url = "/Utils/Nav/reOrderSite/" + cur_td.attr('sid') + "/"
				+ (cur_td.attr('order') * 1 + 1);
		$.get(url, function(b) {
			if (b) {
				cur_td.attr('order', cur_td.attr('order') * 1 + 1);
				url = "/Utils/Nav/reOrderSite/" + tar_td.attr('sid') + "/"
						+ (tar_td.attr('order') * 1 - 1);
				$.get(url, function(b) {
					if (b) {
						tar_td.attr('order', tar_td.attr('order') * 1 - 1);
						tar_tr.after(cur_tr);
					} else {
						alert('下移失败');
					}
				});
			} else {
				alert('下移失败');
			}
		});
	}
}

function mvTopItem(elem) {
	let curSid = $(elem).parent().prev().attr('sid');
	let parent = $(elem).parent().parent();
	let prevAll = parent.prevAll();
	let firstIndex = 1;
	if (parent.prev().length == 0) {
		alert('已是第一个');
	} else {
		times = 0;
		for (let i = 0; i < prevAll.length; i++) {
			let sid = prevAll.eq(i).find('a').first().attr('sid');
			let order = prevAll.eq(i).find('a').first().attr('order');
			url = "/Utils/Nav/reOrderSite/" + sid + "/" + (order * 1 + 1);
			$.get(url,
					function(b) {
						if (!b) {
							alert('置顶失败1');
							return;
						}
						prevAll.eq(i).find('a').first().attr('order',
								order * 1 + 1);
						if (++times == prevAll.length) {
							url = "/Utils/Nav/reOrderSite/" + curSid + "/"
									+ firstIndex;
							$.get(url, function(b) {
								if (!b) {
									alert('置顶失败2');
									document.location.href = '#';
								} else {
									prevAll.last().css('background', 'red');
									parent.css('background', 'green');
									prevAll.last().before(parent);
									$(elem).parent().prev().attr('order',
											firstIndex);
								}
							});
						}
					});
		}

	}
}

function mvBottomItem(elem) {
	let curSid = $(elem).parent().prev().attr('sid');
	let parent = $(elem).parent().parent();
	let nextAll = parent.nextAll();
	let lastIndex = parent.siblings().length + 1;
	if (parent.next().length == 0) {
		alert('已是最后一个');
	} else {
		times = 0;
		for (let i = 0; i < nextAll.length; i++) {
			let sid = nextAll.eq(i).find('a').first().attr('sid');
			let order = nextAll.eq(i).find('a').first().attr('order');
			url = "/Utils/Nav/reOrderSite/" + sid + "/" + (order * 1 - 1);
			$.get(url, function(b) {
				if (!b) {
					alert('置底失败1');
					return;
				}
				nextAll.eq(i).find('a').first().attr('order', order * 1 - 1);
				if (++times == nextAll.length) {
					url = "/Utils/Nav/reOrderSite/" + curSid + "/" + lastIndex;
					$.get(url, function(b) {
						if (!b) {
							alert('置底失败2');
							document.location.href = '#';
						} else {
							nextAll.last().css('background', 'red');
							parent.css('background', 'green');
							nextAll.last().after(parent);
							$(elem).parent().prev().attr('order', lastIndex);
						}
					});
				}
			});
		}

	}
}

function addItem(elem) {
	let tr = $(elem).parent().parent();
	let newTr = tr.clone(true);
	// let newTr = $('tfoot').find('.item').first().clone(true);

	let name = prompt('请输入网站名');
	if (name != null) {
		let url = prompt('请输入网址');

		let cid = tr.parent().parent().prev().find('#categoryName').attr('cid');
		let order = tr.find('a').first().attr('order') * 1 + 1;
		let data = {
			'cid' : cid,
			'name' : name,
			'url' : url,
			'order' : order
		};
		let jsonData = JSON.stringify(data);
		$.ajax({
			method : 'PUT',
			url : "/Utils/Nav/addSite",
			data : jsonData,
			dataType : 'json',
			contentType : 'application/json;charset=u/tf-8',
			success : function(sid) {
				alert(sid)
				newTr.find('a').first().attr('sid', sid);
				newTr.find('a').first().attr('order', order);
				newTr.find('a').first().attr('url', url);
				newTr.find('a').first().find('span').html(name);
				tr.after(newTr);

				let nextAll = newTr.nextAll();
				for (let i = 0; i < nextAll.length; i++) {
					let nextTd = nextAll.eq(i).find('a').first();
					let nextSid = nextTd.attr('sid') * 1;
					let newOrder = nextTd.attr('order') * 1 + 1;
					url = "/Utils/Nav/reOrderSite/" + nextSid + "/" + newOrder;
					$.get(url, function(b) {
						if (!b) {
							alert('增加失败');
							document.location.href = '#';
						} else {
							nextTd.attr('order', newOrder);
						}
					});
				}
			},
			error : function() {
				alert('增加失败');
				document.location.href = '#';
			}
		});
	}
}
// </script>

// 批量刪除
function deleteMulSite(elem) {
	let items = $(elem).closest('#list-op').next().find('.list').children(
			'.item');
	let index = 0;
	let size = 0;
	items.each(function() {
		if ($(this).find('input').is(':checked'))
			size++;
	});
	if (items.length == size) {
		alert('至少保留一个站点叭');
		return;
	}
	// alert(items.length);
	for (let i = 0; i < items.length; i++) {
		index++;
		let sid = items.eq(i).find('a').first().attr('sid');
		let order = items.eq(i).find('a').first().attr('order');
		if (items.eq(i).find('input').is(':checked')) {
			index--;
			// alert('刪除：' + sid + ":" + order + ":" + index);
			$.get('/Utils/Nav/deleteSite/' + sid, function(b) {
				if (!b) {
					alert('批量删除失败');
					document.location.href = '#';
					return;
				}
				items.eq(i).remove();
			});
		} else if (i == 0) {
			// alert('第一个未选中，什么都不做');
		} else if (index == (i + 1)) {
			// alert('上面无删除动作，这里也不移动');
		} else {
			// alert('上移：' + sid + ":" + order + ":" + index);
			$.get('/Utils/Nav/reOrderSite/' + sid + '/' + index, function(b) {
				if (!b) {
					alert('批量删除失败');
					document.location.href = '#';
					return;
				}
			});
			// order = items.eq(i).find('a').first().attr('order', index);
		}
	}
}