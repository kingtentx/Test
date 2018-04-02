<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="test2.aspx.cs" Inherits="h5upload.test2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, width=device-width" />
	<title></title>
</head>
<body>
	<script type="text/javascript">
		//function showPreview(source) {
		//	var file = source.files[0];

		//	//限定上传文件的类型
		//	if (!/image\/\w+/.test(file.type)) {
		//		alert("请确保文件为图像类型");
		//		return false;
		//	}

		//	if (window.FileReader) {
		//		var fr = new FileReader();
		//		fr.onloadend = function (e) {
		//			document.getElementById("portrait").src = e.target.result;
		//		};
		//		fr.readAsDataURL(file);
		//	}
		//}

		var h = {
			init: function () {
				var me = this;

				document.getElementById('File').onchange = me.fileHandler;
				document.getElementById('Abort').onclick = me.abortHandler;

				me.status = document.getElementById('Status');
				me.progress = document.getElementById('Progress');
				me.percent = document.getElementById('Percent');

				me.loaded = 0;
				//每次读取1M
				me.step = 1024 * 1024;
				me.times = 0;
			},
			fileHandler: function (e) {
				var me = h;

				var file = me.file = this.files[0];

				var reader = me.reader = new FileReader();

				//
				me.total = file.size;

				reader.onloadstart = me.onLoadStart;
				reader.onprogress = me.onProgress;
				reader.onabort = me.onAbort;
				reader.onerror = me.onerror;
				reader.onload = me.onLoad;
				reader.onloadend = me.onLoadEnd;
				//读取第一块
				me.readBlob(file, 0);
			},
			onLoadStart: function () {
				var me = h;
			},
			onProgress: function (e) {
				var me = h;

				me.loaded += e.loaded;
				//更新进度条
				me.progress.value = (me.loaded / me.total) * 100;
			},
			onAbort: function () {
				var me = h;
			},
			onError: function () {
				var me = h;

			},
			onLoad: function () {
				var me = h;

				if (me.loaded < me.total) {
					me.readBlob(me.loaded);
				} else {
					me.loaded = me.total;
				}
			},
			onLoadEnd: function () {
				var me = h;

			},
			readBlob: function (start) {
				var me = h;

				var blob,
					file = me.file;

				me.times += 1;

				if (file.webkitSlice) {
					blob = file.webkitSlice(start, start + me.step + 1);
				} else if (file.mozSlice) {
					blob = file.mozSlice(start, start + me.step + 1);
				}

				me.reader.readAsText(blob);
			},
			abortHandler: function () {
				var me = h;

				if (me.reader) {
					me.reader.abort();
				}
			}
		};

		h.init();

	</script>

	<%--<input type="file" name="file" onchange="showPreview(this)" />
		<img id="portrait" src="" width="300" />--%>



	<form>
		<fieldset>
			<legend>分度读取文件：</legend>
			<input type="file" id="File" />
			<input type="button" value="中断" id="Abort" />
			<p>
				<label>读取进度：</label><progress id="Progress" value="0" max="100"></progress>
			</p>
			<p id="Status"></p>
		</fieldset>
	</form>

</body>
</html>
