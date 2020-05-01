<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/grafico.css">
</head>
<body>
<div class="container">
<!-- <div class="section-title"> -->
<!-- <h1>teste h1</h1> -->
<!-- <p>teste p</p> -->
<!-- </div> -->
		<div class="box">
			<div class="chart" data-percent="75">75%</div>
			<h2>graf1</h2>
		</div>
		<div class="box">
			<div class="chart" data-percent="50">50%</div>
			<h2>graf2</h2>
		</div>
</div>
<script src="js/jquery-3.4.1.js"></script>
<script src="js/jquery.easypiechart.js"></script>
<script>

$(function(){

	$('.chart').easyPieChart({
		
			size: 180,
			barColor: '#17d3e6',
			scaleColor: false,
			lineWidth: 15,
			trackColor: '#373737',
			
	})
})


</script>
</body>
</html>