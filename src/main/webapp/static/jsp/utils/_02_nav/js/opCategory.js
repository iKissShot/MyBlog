function renameCategory(elem) {
	let cid = $(elem).prev().attr('cid');
	let oldName = $(elem).prev().html();
	let newName = prompt('请输入新的分类名');
	if (newName != null)
		if (confirm('确认修改分类名') != false) {
			$(elem).prev().html(newName);
			let data = {
				"cid" : cid,
				"name" : newName
			}
			let jsonData = JSON.stringify(data);
			$.ajax({
				type : 'PUT',
				url : '/Utils/Nav/reNameCategory',
				data : jsonData,
				dataType : 'json',
				contentType : "application/json;charset=utf-8",
				complete : function(b) {
					if (!b) {
						alert('修改分类名失败');
						$(elem).prev().html(oldName);
					}
				},
				error : function() {
					alert('修改分类名失败');
					$(elem).prev().html(oldName);
				}
			});
		}
}

function categoryUp(elem) {
	let parent = $(elem).closest('#list-op');
	if (parent.prev().length == 0) {
		alert('已是第一个');
		return;
	}
	let aside = parent.next();
	let line = aside.next();
	let prevLine = parent.prev();
	let prevAside = prevLine.prev();
	let prevParent = prevAside.prev();

	let cid = aside.find('#categoryName').attr('cid');
	let order = aside.find('#categoryName').attr('order');
	let prevCid = prevAside.find('#categoryName').attr('cid');
	let prevOrder = prevAside.find('#categoryName').attr('order');
	// alert(cid + ":" + order + ":" + prevCid + ":" + prevOrder);
	$.get('/Utils/Nav/reOrderCategory/' + cid + '/' + (order * 1 - 1),
			function(b) {
				if (!b) {
					alert('上移失败');
					document.location.href = '#';
					return;
				}
				aside.find('#categoryName').attr('order', order * 1 - 1);
				$.get('/Utils/Nav/reOrderCategory/' + prevCid + '/'
						+ (prevOrder * 1 + 1), function(b) {
					if (!b) {
						alert('上移失败');
						document.location.href = '#';
						return;
					}
					prevAside.find('#categoryName').attr('order',
							prevOrder * 1 + 1);

					parent.css('background', 'red');
					aside.css('background', 'red');
					line.css('background', 'red');
					prevParent.css('background', 'green');
					prevAside.css('background', 'green');
					prevLine.css('background', 'green');

					prevParent.before(line);
					line.before(aside);
					aside.before(parent);
				});
			});
}

function categoryDown(elem) {
	let parent = $(elem).closest('#list-op');
	let aside = parent.next();
	let line = aside.next();
	if (line.next().length == 0) {
		alert('已是最后一个');
		return;
	}
	let nextParent = line.next();
	let nextAside = nextParent.next();
	let nextLine = nextAside.next();

	let cid = aside.find('#categoryName').attr('cid');
	let order = aside.find('#categoryName').attr('order');
	let nextCid = nextAside.find('#categoryName').attr('cid');
	let nextOrder = nextAside.find('#categoryName').attr('order');
	// alert(cid + ":" + order + ":" + nextCid + ":" + nextOrder);
	$.get('/Utils/Nav/reOrderCategory/' + cid + '/' + (order * 1 + 1),
			function(b) {
				if (!b) {
					alert('下移失败');
					document.location.href = '#';
					return;
				}
				aside.find('#categoryName').attr('order', order * 1 + 1);
				$.get('/Utils/Nav/reOrderCategory/' + nextCid + '/'
						+ (nextOrder * 1 - 1), function(b) {
					if (!b) {
						alert('下移失败');
						document.location.href = '#';
						return;
					}
					nextAside.find('#categoryName').attr('order',
							nextOrder * 1 - 1);

					parent.css('background', 'red');
					aside.css('background', 'red');
					line.css('background', 'red');
					nextParent.css('background', 'green');
					nextAside.css('background', 'green');
					nextLine.css('background', 'green');

					nextLine.after(parent);
					parent.after(aside);
					aside.after(line);
				});
			});
}

function categoryTop(elem) {
	let parent = $(elem).closest('#list-op');
	if (parent.prev().length == 0) {
		alert('已是第一个');
		return;
	}
	let aside = parent.next();
	let line = aside.next();

	let cid = aside.find('#categoryName').attr('cid');
	let newOrder = 1;

	$.get('/Utils/Nav/reOrderCategory/' + cid + "/" + newOrder, function(b) {
		if (!b) {
			alert('置顶失败');
			document.location.href = '#';
			return;
		}
		aside.find('#categoryName').attr('order', newOrder);

		let prevAll = parent.prevAll().filter('#list-body');
		let times = 0;
		for (let i = 0; i < prevAll.length; i++) {
			let prevElem = prevAll.eq(i).find('#categoryName');
			let prevOrder = prevElem.attr('order');

			$.get('/Utils/Nav/reOrderCategory/' + prevElem.attr('cid') + "/"
					+ (prevOrder * 1 + 1), function(b) {
				if (!b) {
					alert('置顶失败');
					document.location.href = '#';
					return;
				}
				prevElem.attr('order', prevOrder * 1 + 1);
				if (++times == prevAll.length) {
					prevAll.last().prev().before(line);
					line.before(aside);
					aside.before(parent);
				}

			});

		}
	});
}

function categoryBottom(elem) {
	let parent = $(elem).closest('#list-op');
	if (parent.next().nextAll().filter('#list-body').length == 0) {
		alert('已是最后一个');
		return;
	}
	let aside = parent.next();
	let line = aside.next();

	let cid = aside.find('#categoryName').attr('cid');
	let newOrder = parent.siblings().filter('#list-body').length;

	// alert(cid + ":" + newOrder);

	$.get('/Utils/Nav/reOrderCategory/' + cid + "/" + newOrder, function(b) {
		if (!b) {
			alert('置底失败');
			document.location.href = '#';
			return;
		}
		aside.find('#categoryName').attr('order', newOrder);

		let nextAll = aside.nextAll().filter('#list-body');
		let times = 0;
		for (let i = 0; i < nextAll.length; i++) {
			let nextElem = nextAll.eq(i).find('#categoryName');
			let nextCid = nextElem.attr('cid');
			let nextOrder = nextElem.attr('order');

			// alert(nextCid + ":" + nextOrder);
			$.get('/Utils/Nav/reOrderCategory/' + nextCid + "/"
					+ (nextOrder * 1 - 1), function(b) {
				if (!b) {
					alert('置底失败');
					document.location.href = '#';
					return;
				}
				nextElem.attr('order', nextOrder * 1 - 1);
				if (++times == nextAll.length) {
					nextAll.last().next().after(parent);
					parent.after(aside);
					aside.after(line);
				}
			});

		}
	});
}

function categoryAdd(elem) {
	let name = prompt('请输入分类名');
	if (name != null) {
		if(confirm('确认添加') != true)
			return
		let newOp = $('tfoot').find('#list-op').clone(true);
		let newBody = $('tfoot').find('#list-body').clone(true);
		let newLine = $('tfoot').children().last().clone(true);

		let op = $(elem).closest('#list-op');
		let order = op.next().find('#categoryName').attr('order') * 1;
		let data = {
			'order' : order,
			'name' : name
		};
		let jsonData = JSON.stringify(data, null, '  ');
// alert(jsonData);
		$.ajax({
			type : "PUT",
			url : "/Utils/Nav/addCategory",
			data : jsonData,
			dataType : "json",
			contentType : "application/json;charset=utf-8",
			success : function(cid) {
				newBody.find('#categoryName').attr('cid', cid);
				newBody.find('#categoryName').attr('order', order);
				newBody.find('#categoryName').html(name);

// alert(cid);
				data = {
					'cid' : cid,
					'name' : 'KissShot的康熙小窝',
					'url' : 'http://KissShot.top',
					'order' : 1
				};
				jsonData = JSON.stringify(data, null, '  ');
				$.ajax({
					type : "PUT",
					url : "/Utils/Nav/addSite",
					data : jsonData,
					dataType : "json",
					contentType : "application/json;charset=utf-8",
					success : function(sid) {
						newBody.find('a').first().attr('sid', sid);

						let times = 0;
						let nextAll = op.nextAll().filter('#list-body');
						for (let i = 0; i < nextAll.length; i++) {
							let nextCid = nextAll.eq(i).find('#categoryName')
									.attr('cid');
							let nextOrder = nextAll.eq(i).find('#categoryName')
									.attr('order') * 1;

							// alert(nextCid + ":" + nextOrder);
							$.get("/Utils/Nav/reOrderCategory/" + nextCid + "/"
									+ (nextOrder + 1), function(b) {
								if (!b) {
									alert('添加失败');
									document.location.href = "#";
								}
								nextAll.eq(i).find('#categoryName').attr(
										'order', nextOrder + 1);
								if (++times == nextAll.length) {
									op.before(newLine);
									newLine.before(newBody);
									newBody.before(newOp);
								}
							});
						}
					}
				});
			},
			error : function() {
				alert('添加失败');
				document.location.href = "#";
			}
		});
	}
}

function categoryDelete(elem) {
	if($(elem).closest('#list-op').siblings().filter('#list-body').length == 1){
		alert('至少保留一个分类叭');
		return;
	}
	alert($(elem).closest('#list-op').siblings().filter('#list-body').length);
	if(confirm('确认删除') != true)
		return;
	let cid = $(elem).closest('#list-op').next().find('#categoryName').attr('cid')  * 1; 
	$.get("/Utils/Nav/delCategory/" + cid, function(b) {
		if(!b){
			alert('删除失败');
			document.location.href = "#";
		}

		let times = 0;
		let nextAll = $(elem).closest('#list-op').nextAll().filter('#list-body');
		for(let i  = 0; i< nextAll.length; i++){
			let nextElem = nextAll.eq(i).find('#categoryName');
			let nextCid = nextElem.attr('cid');
			let nextOrder = nextElem.attr('order') * 1;
			$.get("/Utils/Nav/reOrderCategory/" + nextCid + "/" + (nextOrder - 1), function(b) {
				if(!b){
					alert('删除失败');
					document.location.href = "#";
				}
				
				nextElem.attr('order', nextOrder - 1);
				if (++times == nextAll.length) {
					$(elem).closest('#list-op').next().next().remove();
					$(elem).closest('#list-op').next().remove();
					$(elem).closest('#list-op').remove();
				}
			});
		}
	});
}