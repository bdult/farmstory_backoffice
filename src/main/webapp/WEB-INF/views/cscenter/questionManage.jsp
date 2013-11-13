<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="main-content">
	<div class="breadcrumbs" id="breadcrumbs">
		<ul class="breadcrumb">
			<li>
				<i class="icon-home home-icon"></i>
				<a href="#">Home</a>

				<span class="divider">
					<i class="icon-angle-right arrow-icon"></i>
				</span>
			</li>
			<li>CS
				<span class="divider">
					<i class="icon-angle-right arrow-icon"></i>
				</span>
			</li>
			<li class="active">Custom Voice</li>
		</ul>
	</div><!--.breadcrumb-->
	
	<div class="page-content">
		<div class="row-fluid">
			<h3 class="header smaller lighter blue">Custom Voice List</h3>
			<!-- /. table-header -->
			
				<form class="form-horizontal well" id="searchForm">
					<div class="row-fluid">
						<div class="span4">
							<div class="control-group">
   								<label class="control-label">Search</label>
    							<div class="controls">
									<select class="span12" name="search_type">
									  <option value="member_id">Writer</option>
									  <option value="title">Title</option>
									</select>
								</div>
							</div>
						</div>
						<div class="span8">
							<input class="input-xxlarge" name="search" type="text">
						</div>
					</div>
					<div class="row-fluid">
						<div class="span4">
							<div class="control-group">
   								<label class="control-label">Status</label>
    							<div class="controls">
									<select class="span12" name="complete_yn">
									  <option value="">All</option>
									  <option value="N">No Response</option>
									  <option value="Y">Response</option>
									</select>
								</div>
							</div>
						</div>
						<div class="span8">
						</div>
					</div>
					<div class="row-fluid">
						<div class="span12">
							<div class="control-group">
   								<label class="control-label">Date</label>
   									
    							<div class="controls">
    								<div class="span6">
										<div class="input-append">
											<input class="input-medium" id="date-picker-first" name="search_start_date" type="text" data-date-format="yyyy-mm-dd">
											<span class="add-on start_date">
												<i class="icon-calendar"></i>
											</span>
										</div>
										~
										<div class="input-append">
											<input class="input-medium" id="date-picker-last" name="search_end_date" type="text" data-date-format="yyyy-mm-dd">
											<span class="add-on end_date">
												<i class="icon-calendar"></i>
											</span>
										</div>
									</div>
									
									<div data-toggle="buttons-radio" class="span6 btn-group">
										<a class="btn btn-light" id="todayCalenderBtn">Today</a>
										<a class="btn btn-light" id="weekCalenderBtn">Week</a>
										<a class="btn btn-light" id="monthCalenderBtn">Month</a>
										<a class="btn btn-light" id="yearCalenderBtn">Year</a>
										<a class="btn btn-light" id="allCalenderBtn">All</a>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<div class="row-fluid">
						<div class="span12 text-right">
							<a class="btn btn-success input-small" id="reset" style="line-height: 20px;">Reset</a>
							<a class="btn btn-info input-small" id="search">Searching..</a>
						</div>
					</div>
				</form>

			<table class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th>NO</th>
						<th>Writer</th>
						<th>Title</th>
						<th>Date</th>
						<th>Reply Date</th>
						<th>Status</th>
					</tr>
				</thead>
				
				<tbody>
				<c:forEach var="questionList" items="${ questionList }" varStatus="status">
					<tr>
						<td><a href="${ contextPath }/cscenter/questionInfo.do?board_contents_id=${ questionList.CONTENTS_ID }">${ questionList.CONTENTS_ID }</a></td>
						<td><a href="${ contextPath }/cscenter/questionInfo.do?board_contents_id=${ questionList.CONTENTS_ID }">${ questionList.MEMBER_ID }</a></td>
						<td><a href="${ contextPath }/cscenter/questionInfo.do?board_contents_id=${ questionList.CONTENTS_ID }">${ questionList.TITLE }</a></td>
						<td>${ questionList.REG_DT }</td>
						<td>${ questionList.MOD_DT }</td>
						<td>
							<c:choose>
								<c:when test="${ questionList.SUB_CONTENTS_YN eq 'Y' }">Response</c:when>
								<c:otherwise>No Response</c:otherwise>
							</c:choose>
						</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
				
		<div class="row-fluid">
				<div class="span12 text-center">
					<div class="paging_bootstrap pagination">
						<ul>
							<c:choose>
								<c:when test="${pageInfo.blockPage == 1}">
									<li class="prev disabled"><a href="#null" ><i class="icon-double-angle-left"></i></a></li>
								</c:when>
								<c:otherwise>
									<li class="prev"><a href="questionManage.do?blockPage=${pageInfo.preBlockPage}"><i class="icon-double-angle-left"></i></a></li>
								</c:otherwise>
							</c:choose>
							<c:forEach items="${pageList }" var="page">
								<c:choose>
									<c:when test="${pageInfo.pageNum == page.pageNum}">
										<li class="active"><a href="questionManage.do?pageNum=${page.pageNum}&blockPage=${pageInfo.blockPage}&search_type=${pageInfo.search_type}&search=${pageInfo.search}&complete_yn=${pageInfo.complete_yn}&search_start_date=${pageInfo.search_start_date}&search_end_date=${pageInfo.search_end_date}">${page.pageNum}</a></li>
									</c:when>
									<c:otherwise>
										<li><a href="questionManage.do?pageNum=${page.pageNum}&blockPage=${pageInfo.blockPage}&search_type=${pageInfo.search_type}&search=${pageInfo.search}&complete_yn=${pageInfo.complete_yn}&search_start_date=${pageInfo.search_start_date}&search_end_date=${pageInfo.search_end_date}">${page.pageNum}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:choose>
								<c:when test="${pageInfo.blockPage == pageInfo.totalBlockPage}">
									<li class="next disabled"><a href="#null"><i class="icon-double-angle-right"></i></a></li>
								</c:when>
								<c:otherwise>
									<li class="next"><a href="questionManage.do?blockPage=${pageInfo.nextBlockPage}"><i class="icon-double-angle-right"></i></a></li>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>
				</div>
			</div><!--  page-link -->
			
	</div>
</div>

<script type="text/javascript">
jQuery(function($){
	$('#date-picker-first').datepicker();
	$('span.start_date')
	.click(function(){
		$('#date-picker-first').datepicker("show");
	})
	.hover(function(){
		$(this).css("cursor", "pointer");
	});
	$('#date-picker-last').datepicker();
	$('span.end_date')
	.click(function(){
		$('#date-picker-last').datepicker("show");
	})
	.hover(function(){
		$(this).css("cursor", "pointer");
	});
});

//side active
$("#side-cscenter").addClass("open active");
	$("#side-cscenter-question").addClass("active");

	//search init 
	$("#searchForm input[name=search").val("${ pageInfo.search }");
	if("${ pageInfo.search_type }" == ''){
		$("#searchForm select[name=search_type]").val("member_id").attr("selected", "selected");
	}else {
		$("#searchForm select[name=search_type]").val("${ pageInfo.search_type }").attr("selected", "selected");
	}
	$("#searchForm select[name=complete_yn]").val("${ pageInfo.complete_yn }").attr("selected", "selected");
	$("#searchForm input[name=search_start_date]").val("${ pageInfo.search_start_date }");
	$("#searchForm input[name=search_end_date]").val("${ pageInfo.search_end_date }");

	$("#reset").click(function(){
		$("#searchForm input[name=search").val("");
		$("#searchForm select[name=search_type]").val("member_id").attr("selected", "selected");
		$("#searchForm select[name=complete_yn]").val("").attr("selected", "selected");
		$("#searchForm input[name=search_start_date]").val("");
		$("#searchForm input[name=search_end_date]").val("");
	});
	
	$("#search").click(function(){
		$("#searchForm").attr({
			method: 'post',
			action: '${ contextPath }/cscenter/questionManage.do'
		}).submit();	
	});
	
	function getTimeStamp(type) {

		var mydate = new Date();

		switch (type) {
		case 'today':
			new Date(mydate);
			break;
		case 'week':
			var day = mydate.getDate();
			mydate.setDate(day - 7);
			break;
		case 'month':
			var month = mydate.getMonth();
			mydate.setMonth(month - 1);
			break;
		case 'year':
			var year = mydate.getFullYear();
			mydate.setFullYear(year - 1);
			break;
		}
		
		var fdate = 
		    leadingZeros(mydate.getFullYear(), 4) + '-' +
		    leadingZeros(mydate.getMonth() + 1, 2) + '-' +
		    leadingZeros(mydate.getDate(), 2)
		
		return fdate;
	}
	
	function leadingZeros(n, digits) {
		  var zero = '';
		  n = n.toString();

		  if (n.length < digits) {
		    for (i = 0; i < digits - n.length; i++)
		      zero += '0';
		  }
		 return zero + n;
	}
	
	$("#todayCalenderBtn").click(function() {
		$("#date-picker-first").val(getTimeStamp('today'));
		$("#date-picker-last").val(getTimeStamp('today'));
	});
	$("#weekCalenderBtn").click(function() {
		$("#date-picker-first").val(getTimeStamp('week'));
		$("#date-picker-last").val(getTimeStamp('today'));
	});
	$("#monthCalenderBtn").click(function() {
		$("#date-picker-first").val(getTimeStamp('month'));
		$("#date-picker-last").val(getTimeStamp('today'));
	});
	$("#yearCalenderBtn").click(function() {
		$("#date-picker-first").val(getTimeStamp('year'));
		$("#date-picker-last").val(getTimeStamp('today'));
	});
	$("#allCalenderBtn").click(function() {
		$("#date-picker-first").val(null);
		$("#date-picker-last").val(null);
	});
	
	/* $(".btn-group>a").click(function(){
		$(this).attr("class", "btn btn-light active");
	}); */
</script>