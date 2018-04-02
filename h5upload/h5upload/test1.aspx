<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="test1.aspx.cs" Inherits="h5upload.test1" %>


<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>html5+canvas+js头像缩放裁剪，支持微信（不支持拍照）</title>
<style>*,html,body{padding:0px;margin:0px;}</style>
<script src="test1_js/jquery-2.0.3.min.js"></script>
<script src="test1_js/layer.m.js"></script>
<script src="test1_js/touch-0.2.14.min.js"></script>
<script src="test1_js/jquery.crop.js"></script>
<script>
	$(function () {
		var w = $(window).width();
		var h = $(window).height();
		$('.cutbox').crop({
			w: w > h ? h : w,
			h: h,
			r: (w - 30) * 0.5,
			res: '',
			callback: function (ret) {
				alert(ret);
				$('#imgbase64').val(ret);
				localStorage.setItem("new_avatar", ret);
				sessionStorage.setItem('edit_baby_avatar', true);
				//window.location.replace("http://baby.memiler.com/index.php?s=/wap");
			}
		});
	});

	function btnOk() {
		$.ajax({
			url: 'ajax.aspx?type=test',
			type: 'POST',
			data: { "imgbase64":$('#imgbase64').val()},
			
			success: function (responseStr) {
				alert("成功：" + JSON.stringify(responseStr));
			}
		});
	}
</script>
</head>

<body>
<div class="cutbox"></div>
	<input type="hidden" id="imgbase64" name="imgbase64" value="" />
	<input type="button" onclick="btnOk()" value="保存" />
</body>
</html>


