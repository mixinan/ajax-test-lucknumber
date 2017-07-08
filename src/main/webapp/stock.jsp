<%@ page contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="js/jquery-1.4.3.js"></script>
<script type="text/javascript">
	//页面加载完执行
	$(function(){
		setInterval(quoto, 3000);
	});
	
	/*
		该函数通过调用ajax对象向服务器发送异步请求
		服务器返回json字符串
	*/
	function quoto(){
		$.ajax({
			"url":"quoto.do",
			"type":"post",
			"dataType":"json",
			"success":function(stocks){
				$('#tb1').empty();
				for (var i = 0; i < stocks.length; i++) {
					var s = stocks[i];
					//更新表格
					$("#tb1").append(
							'<tr><td>'+s.code+'</td><td>'+s.name
							+'</td><td>'+s.price+'</td></tr>');
				}
			}
		});		
		
	}
</script>
<title>Insert title here</title>
<style type="text/css">
	#d1{
		width:450px;
		height:350px;
		background-color: black;
		margin:20px auto;
	}
	
	#d2{
		height:32px;
		background-color: red;
		color: yellow;
		font-size:26px;
	}
	
	table{
		color:white;
		font-style: italic;
		font-size:24px;
	}
</style>
</head>
<body>
	<div id="d1">
		<div id="d2">股票行情</div>
		<div id="d3">
			<table width="100%">
				<thead>
					<tr>
						<td>代码</td>
						<td>名称</td>
						<td>价格</td>
					</tr>
				</thead>
				<tbody id="tb1">
					
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>