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
				대쉬보드 <small> <i class="icon-double-angle-right"></i> 통계
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
					</div><!-- /widget-body -->
				</div>

				<div class="widget-box">
					<div class="widget-header widget-header-flat widget-header-small">
						<h5>
							<i class="icon-signal"></i>
							평균 방문 시간 및 방문당 페이지수
						</h5>
					</div>
	
					<div class="widget-body">
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

	google.load('visualization', '1', {'packages':['corechart']});
	
	{
		//선 차트
		google.setOnLoadCallback(drawLineChart);
		
		var rows = $("#lineChart").data("lineChart").rows;
		
		var ggData = [["","visitor"]];
		$(rows).each(function(){
			var $this = $(this);
			ggData.push([ $this[0], Number($this[1])]);
			
		});
		function drawLineChart() {
	        var data = google.visualization.arrayToDataTable( ggData );
	
	        var options = {
	          title: '',
	          hAxis: {title: 'Date',  titleTextStyle: {color: '#333'}},
	          vAxis: {minValue: 0},
	          pointSize: 5,
	          legend: {position: 'top', textStyle: {color: 'blue', fontSize: 16}}
	        };
	
	        var lineChart = new google.visualization.AreaChart(document.getElementById('lineChart'));
	        lineChart.draw(data, options);
	    }
	}
	
	{
		//평균정보
		var avgData = $("#avgBox").data("avg").rows[0];
		console.info( avgData );
		
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
</script>	