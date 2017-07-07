<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>lucky number</title>

</head>
<body>
	<button id="bt">你的幸运数字</button>
	<br>
	<h3 id="result"></h3>
	
	<script>
	function getXhr(){
		var xhr = null;
		if(window.XMLHttpRequest){
			xhr = new XMLHttpRequest();
		}else{
			xhr = new ActiveXObject("Microsoft.XMLHttp");
		}
		
		return xhr;
	}

	function $(id){
		return document.getElementById(id);
	}
	
	
	$('bt').onclick=function(){
		var xhr = getXhr();
		
		xhr.open('get','luck.do',true);
		
		xhr.onreadystatechange=function(){
			if(xhr.readyState==4 && xhr.status==200){
				var n = xhr.responseText;
				$('result').innerHTML = n;
			}
		}
		xhr.send(null);
	}
</script>
</body>
</html>