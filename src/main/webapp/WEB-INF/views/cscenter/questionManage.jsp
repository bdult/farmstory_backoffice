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
			<li>문의하기 관리
				<span class="divider">
					<i class="icon-angle-right arrow-icon"></i>
				</span>
			</li>
			<li class="active">문의하기 리스트</li>
		</ul>
		<div class="nav-search" id="nav-search">
			<form class="form-search" action="manage.do" method="post">
				<span class="input-icon">
					<input type="text" name="search" placeholder="Search ..." class="input-small nav-search-input" autocomplete="off"  value="${search }" />
					<i class="icon-search nav-search-icon"></i>
				</span>
			</form>
		</div><!--#nav-search-->
	</div><!--.breadcrumb-->
	
	<div class="page-content">
		<div class="row-fluid">
			<h3 class="header smaller lighter blue">문의하기 리스트</h3>
			<!-- /. table-header -->
			
				<form class="form-horizontal well" id="searchForm">
					<div class="row-fluid">
						<div class="span4">
							<div class="control-group">
   								<label class="control-label">검색</label>
    							<div class="controls">
									<select class="span12" name="search_type">
									  <option value="">전체</option>
									  <option value="member_id">작성자</option>
									  <option value="title">제목</option>
									</select>
								</div>
							</div>
						</div>
						<div class="span8">
							<input class="input-xxlarge" name="" type="text" placeholder="검색어를 입력하세요">
						</div>
					</div>
					<div class="row-fluid">
						<div class="span4">
							<div class="control-group">
   								<label class="control-label">처리여부</label>
    							<div class="controls">
									<select class="span12" name="comment_yn">
									  <option value="">전체</option>
									  <option value="N">미처리</option>
									  <option value="Y">처리완료</option>
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
   								<label class="control-label">문의일</label>
   									
    							<div class="controls">
    								<div class="span6">
										<div class="input-append">
											<input class="input-medium" id="date-picker-first" name="search_start_date" type="text" data-date-format="yyyy-mm-dd">
											<span class="add-on">
												<i class="icon-calendar"></i>
											</span>
										</div>
										~
										<div class="input-append">
											<input class="input-medium" id="date-picker-last" name="search_end_date" type="text" data-date-format="yyyy-mm-dd">
											<span class="add-on">
												<i class="icon-calendar"></i>
											</span>
										</div>
									</div>
									
									<div data-toggle="buttons-radio" class="span6 btn-group">
										<a class="btn btn-light" id="todayCalenderBtn">오늘</a>
										<a class="btn btn-light" id="weekCalenderBtn">1주</a>
										<a class="btn btn-light" id="monthCalenderBtn">1개월</a>
										<a class="btn btn-light" id="yearCalenderBtn">1년</a>
										<a class="btn btn-light" id="allCalenderBtn">전체</a>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<div class="row-fluid">
						<div class="span12 text-center">
							<a class="btn btn-info input-large" id="search">검색</a>
						</div>
					</div>
				</form>
				${ questionList }
			<table class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th>NO</th>
						<th>작성자</th>
						<th>제목</th>
						<th>등록일시</th>
						<th>답변일시</th>
						<th>답변방법</th>
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
								<c:when test="${ questionList.SUB_CONTENTS_YN eq 'Y' }">처리완료</c:when>
								<c:otherwise>미완료</c:otherwise>
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
									<li class="prev"><a href="manage.do?blockPage=${pageInfo.preBlockPage}&search=${page.search}"><i class="icon-double-angle-left"></i></a></li>
								</c:otherwise>
							</c:choose>
							<c:forEach items="${pageList }" var="page">
								<c:choose>
									<c:when test="${pageInfo.pageNum == page.pageNum}">
										<li class="active"><a href="manage.do?pageNum=${page.pageNum}&blockPage=${pageInfo.blockPage}&search=${pageInfo.search}">${page.pageNum}</a></li>
									</c:when>
									<c:otherwise>
										<li><a href="manage.do?pageNum=${page.pageNum}&blockPage=${pageInfo.blockPage}&search=${pageInfo.search}">${page.pageNum}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:choose>
								<c:when test="${pageInfo.blockPage == pageInfo.totalBlockPage}">
									<li class="next disabled"><a href="#null"><i class="icon-double-angle-right"></i></a></li>
								</c:when>
								<c:otherwise>
									<li class="next"><a href="manage.do?blockPage=${pageInfo.nextBlockPage}&search=${pageInfo.search}"><i class="icon-double-angle-right"></i></a></li>
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
	$('#date-picker-last').datepicker();
});

//side active
$("#side-cscenter").addClass("open active");
	$("#side-cscenter-question").addClass("active");

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