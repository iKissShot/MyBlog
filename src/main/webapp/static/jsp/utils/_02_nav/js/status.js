// <!-- 切换整体的修改状态 -->
// <script type="text/javascript">
function changeCategoryEdit(elem) {
	if ($(elem).html() == '修改全部分类') {
		$(elem).html('关闭修改分类');
		$('.list').find('.item').each(function() {
			$(this).css('float', 'none');
		});
		$('.item-select').each(function() {
			$(this).css('display', 'block');
		});
		$('.item-op').each(function() {
			$(this).css('display', 'flex');
		});
		$('.op-table').each(function() {
			$(this).css('display', 'table');
		});
		$('.btn').each(function() {
			$(this).css('display', 'block');
		});
	} else {
		$(elem).html('修改全部分类');
		$('.list').find('.item').each(function() {
			$(this).css('float', 'left');
		});
		$('.item-select').each(function() {
			$(this).css('display', 'none');
		});
		$('.item-op').each(function() {
			$(this).css('display', 'none');
		});
		$('.op-table').each(function() {
			$(this).css('display', 'none');
		});
		$('.btn').each(function() {
			$(this).css('display', 'none');
		});
	}
	$('tfoot').find('.item').css('float', 'left');
	$('tfoot').find('.item-select').css('display', 'none');
	$('tfoot').find('.item-op').css('display', 'none');
	$('tfoot').find('.op-table').css('display', 'none');
	$('tfoot').find('.btn').css('display', 'none');
}
// </script>

// <!-- 切换分类的修改状态 -->
// <script type="text/javascript">
function changeItemEdit(elem) {
	if ($(elem).find('#editBtn').css('visibility') == 'hidden') {
		$(elem).find('#editBtn').css('visibility', 'visible');
	} else {
		$(elem).find('#editBtn').css('visibility', 'hidden');
	}
	$('tfoot').find('#editBtn').css('visibility', 'hidden');
}
// </script>

// <!-- 切换单个分类的修改 -->
// <script type="text/javascript">
function commitItemEdit(elem) {
	let parent = $(elem).parent().parent();
	if ($(elem).html() == '修改') {
		$(elem).html('关闭');
		$(parent).find('.item-select').each(function() {
			$(this).css('display', 'block');
		});
		parent.find('.item-op').each(function() {
			$(this).css('display', 'flex');
		});
		parent.prev().find('.op-table').each(function() {
			$(this).css('display', 'table');
		});
		$(parent).find('#renameBtn').css('display', 'block');
	} else if ($(elem).html() == '关闭') {
		$(elem).parent().prev().find('.item').each(function() {
			$(this).css('background', 'transparent');
		});
		$(elem).html('修改');
		$(parent).find('.item-select').each(function() {
			$(this).css('display', 'none');
		});
		parent.find('.item-op').each(function() {
			$(this).css('display', 'none');
		});
		parent.prev().find('.op-table').each(function() {
			$(this).css('display', 'none');
		});
		$(parent).find('#renameBtn').css('display', 'none');
	}

	$('tfoot').find('.item').css('background', 'transparent');
	$('tfoot').find('.item-select').css('display', 'none');
	$('tfoot').find('.item-op').css('display', 'none');
	$('tfoot').find('.op-table').css('display', 'none');
	$('tfoot').find('.renameBtn').css('display', 'none');
}
// </script>
