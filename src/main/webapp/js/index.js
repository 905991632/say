	var t = n = 0,
		count;

	$(document).ready(function() {

		count = $("#banner_list a").length;

		$("#banner_list a:not(:first-child)").hide();

		$("#banner_info").html($("#banner_list a:first-child").find("img").attr('alt'));

		$("#banner_info").click(function() {
			window.open($("#banner_list a:first-child").attr('href'), "_blank")
		});

		$("#banner li").click(function() {

			var i = $(this).text() - 1; //获取Li元素内的值，即1，2，3，4

			n = i;

			if (i >= count) return;

			$("#banner_info").html($("#banner_list a").eq(i).find("img").attr('alt'));

			$("#banner_info").unbind().click(function() {
				window.open($("#banner_list a").eq(i).attr('href'), "_blank")
			})

			$("#banner_list a").filter(":visible").fadeOut(500).parent().children().eq(i).fadeIn(1000);

			document.getElementById("banner").style.background = "";

			$(this).toggleClass("on");

			$(this).siblings().removeAttr("class");

		});

		t = setInterval("showAuto()", 4000);

		$("#banner").hover(function() {
			clearInterval(t)
		}, function() {
			t = setInterval("showAuto()", 4000);
		});

	})


	function showAuto() {
		n = n >= (count - 1) ? 0 : ++n;

		$("#banner li").eq(n).trigger('click');

	}
	
	$(function() {
		var thisTime;
		//鼠标离开左侧内容栏
		$('.cat_wrap .cat_list .float').mouseleave(function(even) {
			thisTime = setTimeout(thisMouseOut, 1);
		});
		//鼠标点击左侧内容栏   滑动出弹层
		$('.cat_wrap .cat_list .float').mouseenter(function() {
			$(this).addClass("active").siblings().removeClass("active");
			clearTimeout(thisTime);
			var thisUB = $('.cat_wrap .cat_list .float').index($(this));
			if ($.trim($('.cat_subcont .cat_sublist').eq(thisUB).html()) != "") {
				$('.cat_subcont').addClass('active');
				$('.cat_sublist').hide();
				$('.cat_sublist').eq(thisUB).show();
			} else {
				$('.cat_subcont').removeClass('active');
			}
		});
		//函数——执行鼠标离开左侧内容栏的动作
		function thisMouseOut() {
			$('.cat_subcont').removeClass('active');
			$('.cat_wrap .cat_list .float').removeClass('active');
		}
		$('.cat_subcont').mouseenter(function() {
			clearTimeout(thisTime);
			$('.cat_subcont').addClass('active');
		});
		$('.cat_subcont').mouseleave(function() {
			$('.cat_subcont').removeClass('active');
			$('.cat_wrap .cat_list .float').removeClass('active');
		});
	});