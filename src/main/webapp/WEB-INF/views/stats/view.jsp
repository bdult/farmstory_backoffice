<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="main-content">
	<div class="breadcrumbs" id="breadcrumbs">
		<ul class="breadcrumb">
			<li><i class="icon-home home-icon"></i> <a
				href="${contextPath }/">Home</a> <span class="divider"> <i
					class="icon-angle-right arrow-icon"></i>
			</span></li>
			<li>통계관리 <span class="divider"> <i
					class="icon-angle-right arrow-icon"></i>
			</span>
			</li>
			<li class="active">통계 조회</li>
		</ul>
		<!--.breadcrumb-->
	</div>

	<div class="page-content">
		<div class="page-header position-relative">
			<h1>
				대쉬보드 
				<small> 
					<i class="icon-double-angle-right"></i>
					Google analytics <a href="http://www.google.com/analytics/">click</a> 
				</small>
			</h1>
		</div>
		<!--/.page-header-->

		<div class="row-fluid">
			<div class="span6">
				<div class="widget-box">
					<div class="widget-header widget-header-flat widget-header-small">
						<h5>
							<i class="icon-signal"></i>
							신규 방문수
						</h5>
					</div>
	
					<div class="widget-body">
						<div id="lineChart" data-line-chart='${ lineChartData }'></div>
					</div><!-- /widget-body -->
				</div>
			</div>
			<div class="span6">
				<div class="widget-box">
					<div class="widget-header widget-header-flat widget-header-small">
						<h5>
							<i class="icon-signal"></i>
							순 방문자수
						</h5>
					</div>
	
					<div class="widget-body">
						<div id="visitsChart"></div>
					</div><!-- /widget-body -->
				</div>
			</div>
		</div>
		
		<br />

		<div class="row-fluid">
			<div class="span6">
				<div class="widget-box">
					<div class="widget-header widget-header-flat widget-header-small">
						<h5>
							<i class="icon-signal"></i>
							방문수
						</h5>
					</div>
	
					<div class="widget-body">
						<div id="geoChart"></div>
					</div><!-- /widget-body -->
				</div>
			</div>
			<div class="span6">
				<div class="widget-box">
					<div class="widget-header widget-header-flat widget-header-small">
						<h5>
							<i class="icon-signal"></i>
							브라우저별 방문수
						</h5>
					</div>
	
					<div class="widget-body">
						<table class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<th>Browser</th>
									<th>Visits</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${ browserData.rows }" var="obj">
									<tr>
										<td>${ obj[0] }</td>
										<td>${ obj[1] }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div><!-- /widget-body -->
				</div>

				<br />
				
				<div class="widget-box">
					<div class="widget-header widget-header-flat widget-header-small">
						<h5>
							<i class="icon-signal"></i>
							평균 방문 시간 및 방문당 페이지수
						</h5>
					</div>
	
					<div class="widget-body">
						<div id="avgChart"></div>
					</div><!-- /widget-body -->
				</div>
			</div>
		</div>
		
		<br />
		
		<div class="row-fluid">
			<div class="span6 infobox-container" id="avgBox" data-avg='${ averageData }'>
				<div class="infobox infobox-green  ">
					<div class="infobox-data">
						<span class="infobox-data-number" id="visits"></span>
						<div class="infobox-content">방문수</div>
					</div>
				</div>

				<div class="infobox infobox-blue  ">
					<div class="infobox-data">
						<span class="infobox-data-number" id="visitors"></span>
						<div class="infobox-content">순 방문자수</div>
					</div>
				</div>

				<div class="infobox infobox-pink  ">
					<div class="infobox-data">
						<span class="infobox-data-number" id="pageviews"></span>
						<div class="infobox-content">페이지뷰 수</div>
					</div>
				</div>

				<div class="infobox infobox-red  ">
					<div class="infobox-data">
						<span class="infobox-data-number" id="avgVisitOnPage"></span>
						<div class="infobox-content">페이지/방문</div>
					</div>
				</div>

				<div class="infobox infobox-orange2  ">
					<div class="infobox-data">
						<span class="infobox-data-number" id="avgTimeOnSite"></span>
						<div class="infobox-content">평균 방문 시간</div>
					</div>
				</div>

				<div class="infobox infobox-blue2  ">
					<div class="infobox-data">
						<span class="infobox-data-number" id="visitorsRate"></span>
						<div class="infobox-content">신규 방문 비율(%)</div>
					</div>
				</div>
			</div>
			<div class="span6">
				<div class="widget-box">
					<div class="widget-header widget-header-flat widget-header-small">
						<h5>
							<i class="icon-signal"></i>
							방문자 비교
						</h5>
					</div>
	
					<div class="widget-body">
						<div id="pieChart" data-line-chart='${pieChartData }'></div>
					</div><!-- /widget-body -->
				</div>
			</div>
		</div>
	
	</div>
	<!--/.page-content-->
</div>
<!--/.main-content-->

<script>
$(function(){
	//사이드바 활성화
	$("#side-stats-view").addClass("active");
	$("#side-stats").addClass("open active");
});
</script>

<!-- GOOGLE CHART API -->
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript">
	//초를 hh:MM:ss
	var toHHMMSS = function (seconds) {
	    var sec_num = parseInt(seconds, 10);
	    var hours   = Math.floor(sec_num / 3600);
	    var minutes = Math.floor((sec_num - (hours * 3600)) / 60);
	    var seconds = sec_num - (hours * 3600) - (minutes * 60);
	
	    if (hours   < 10) {hours   = "0"+hours;}
	    if (minutes < 10) {minutes = "0"+minutes;}
	    if (seconds < 10) {seconds = "0"+seconds;}
	    var time    = hours+':'+minutes+':'+seconds;
	    return time;
	};

	var gaData = ${ gaData }.rows;
	
	google.load('visualization', '1', {'packages':['corechart']});
	
	{
		
		var rows = $("#lineChart").data("lineChart").rows;
		
		var newVisitorData = [["", "신규방문수"]];
		var visitsData = [["", "순방문수"]];
		var avgVisitData = [];
		$(gaData).each(function(idx){
			var $this = $(this);
			newVisitorData.push([ $this[0], Number($this[2])]);
			
			visitsData.push([ $this[0], Number($this[1])]);
			
			avgVisitData.push([ $this[0], Number($this[3])/50, "평균 방문시간 " + toHHMMSS( Number($this[3]) ), Number($this[4]), "평균 페이지 수 " + Number($this[4]).toFixed(2)]);
		});
		
		//신규방문자
		google.setOnLoadCallback(drawNewVisitorChart);
		function drawNewVisitorChart() {
	        var data = google.visualization.arrayToDataTable( newVisitorData );
	        
	        var options = {
	          title: '',
	          hAxis: {title: 'Date',  titleTextStyle: {color: '#333'}, showTextEvery: 7 },
	          vAxis: {minValue: 0},
	          pointSize: 5,
	          legend: {position: 'top', textStyle: {color: 'blue', fontSize: 15}}
	        };
	
	        var newVisitorChart = new google.visualization.AreaChart(document.getElementById('lineChart'));
	        newVisitorChart.draw(data, options);
	    }
		
		//순 방문
		google.setOnLoadCallback(drawVisitsChart);
		function drawVisitsChart() {
	        var data = google.visualization.arrayToDataTable( visitsData );
	
	        var options = {
	          title: '',
	          hAxis: {title: 'Date',  titleTextStyle: {color: '#333'}, showTextEvery: 7 },
	          vAxis: {minValue: 0},
	          pointSize: 5,
	          legend: {position: 'top', textStyle: {color: 'blue', fontSize: 16}}
	        };
	
	        var visitsChart = new google.visualization.AreaChart(document.getElementById('visitsChart'));
	        visitsChart.draw(data, options);
	    }
		
		//평균방문 시간 및 평균 페이지뷰 수
		google.setOnLoadCallback(drawAvgChart);
		function drawAvgChart() {
				console.info( avgVisitData );
	        //var data = google.visualization.arrayToDataTable( avgVisitData );
	        var data = new google.visualization.DataTable();
			data.addColumn('string', 'Month'); // Implicit domain label col.
			data.addColumn('number', '평균방문시간'); // Implicit series 1 data col.
			data.addColumn({type:'string', role:'tooltip'}); // annotation role col.
			data.addColumn('number', '방문당페이지수'); // Implicit series 1 data col.
			data.addColumn({type:'string',role:'tooltip'}); // certainty col.
			data.addRows(avgVisitData);
	
	        var options = {
	          title: '',
	          hAxis: {title: 'Date',  titleTextStyle: {color: '#333'}, showTextEvery: 7 },
	          vAxis: {minValue: 0},
	          pointSize: 5,
	          legend: {position: 'top', textStyle: {color: 'blue', fontSize: 16}}
	        };
	
	        var avgChart = new google.visualization.AreaChart(document.getElementById('avgChart'));
	        avgChart.draw(data, options);
	    }
		
	}
	
	{
		//평균정보
		var avgData = $("#avgBox").data("avg").rows[0];
		
		var visitors = avgData[0];
		var visits = avgData[1];
		var avgTimeOnSite = avgData[2];
		var pageviews = avgData[3];
		
		$("#visitors").text( visitors );
		$("#visits").text( visits );
		$("#avgTimeOnSite").text( toHHMMSS( avgTimeOnSite ) );
		$("#pageviews").text( pageviews );
		$("#avgVisitOnPage").text( Number(pageviews/visits).toFixed(2) );
		$("#visitorsRate").text( Number((visitors/visits)*100).toFixed(2) + "%" );
		
		//초를 분으로 변경
		
		//파이 차트
		google.setOnLoadCallback(drawPieChart);
	    function drawPieChart() {
		      var data = google.visualization.arrayToDataTable([
		          ['retuning visitor', 'new visitor'],
			      ['retuning visitor', (visits - visitors)],
		          ['new visitor', Number(visitors)],
		      ]);
	
	      var options = {
	        title: '',
	        legend: "top",
	        colors:['#058dc7', '#50b432']
	      };
	
	      var pieChart = new google.visualization.PieChart(document.getElementById('pieChart'));
	      pieChart.draw(data, options);
		}
	}
	
	{
		google.load('visualization', '1', {'packages':['geochart']});
		//지도 차트
		google.setOnLoadCallback(drawRegionsMap);

		var gaData = $( ${countryData}.rows );
		
		var rows = [['Country', 'Popularity']];
		gaData.each(function(){
			rows.push(this);
		});
		
		function drawRegionsMap() {
			var data = google.visualization.arrayToDataTable(rows);
			var options = {};
			var chart = new google.visualization.GeoChart(document.getElementById('geoChart'));
			chart.draw(data, options);
		};
	}
</script>	