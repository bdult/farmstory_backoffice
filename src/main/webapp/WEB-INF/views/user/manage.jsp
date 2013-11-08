<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- <style>
.btn-group form{
	margin: 0;
	float: left;
}

#userCreatebtn {
	float: right;
}

</style> -->
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
			<li>회원 관리
				<span class="divider">
					<i class="icon-angle-right arrow-icon"></i>
				</span>
			</li>
			<li class="active">일반 회원 관리</li>
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
			<h3 class="header smaller lighter blue">일반 회원 정보 리스트</h3>
			<%-- <c:if test="${ type == 'adminView' }">
				<h3 class="header smaller lighter blue">관리자 회원 정보 리스트</h3></li>
			</c:if> --%>
			<!-- /. table-header -->
		<!--/.page-header-->
		
				<!-- search -->
				<form id="searchForm" class="form-horizontal well">
					<div class="row-fluid">
						<div class="span4">
							<div class="control-group">
   								<label class="control-label">회원검색</label>
    							<div class="controls">
									<select name="search_type" class="span12">
									  <option value="">목록 선택</option>
									  <option value="id">아이디</option>
									  <option value="name">이름</option>
									  <option value="cel">휴대폰번호</option>
									</select>
								</div>
							</div>
						</div>
						<div class="span8">
							<input class="input-xxlarge" id="inputSearch" name="search" type="text" placeholder="검색어를 입력하세요">
						</div>
					</div>
					<div class="row-fluid">
						<div class="span4">
							<div class="control-group">
   								<label class="control-label">회원구분</label>
    							<div class="controls">
									<select name="member_role" class="span12">
									  <option value="">전체</option>
									  <option value="0">무료회원</option>
									  <option value="1">유료회원</option>
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
   								<label class="control-label">회원가입일</label>
   									
    							<div class="controls">
    								<div class="span6">
										<div class="input-append">
											<input class="input-medium" name="search_start_date" id="date-picker-first" type="text" data-date-format="yyyy-mm-dd">
											<span class="add-on">
												<i class="icon-calendar"></i>
											</span>
										</div>
										~
										<div class="input-append">
											<input class="input-medium" name="search_end_date" id="date-picker-last" type="text" data-date-format="yyyy-mm-dd">
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
				
			<div class="row-fluid text-right">
				<div class="dataTables_info">회원수: ${ pageInfo.totalCount }명</div>
			</div>
				
			<%-- <c:if test="${ type == 'userView' }">
			</c:if> --%>
			<%-- <c:if test="${ type == 'adminView' }">
				<div class="table-header" align="right">
					<a class="btn btn-info btn-success" href="${ contextPath }/user/admin/createView.do">추가</a>
				</div>
			</c:if> --%>
			<table class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th>NO</th>
						<th>아이디</th>
						<th>이름</th>
						<th>회원구분</th>
						<th>휴대폰번호</th>
						<th>구독 일시</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="userlist" items="${positionMap.memberList}" varStatus="status">
							<tr> 
								<td><a href="${ contextPath }/user/detail.do?member_id=${userlist.MEMBER_ID}">${userlist.IDX}</a></td>
								<td><a href="${ contextPath }/user/detail.do?member_id=${userlist.MEMBER_ID}">${userlist.MEMBER_ID}</a></td>
								<td><a href="${ contextPath }/user/detail.do?member_id=${userlist.MEMBER_ID}">${userlist.MEMBER_NM}</a></td>
								<td>${userlist.MEMBER_ROLE_DESC}</td>
								<td>${userlist.MEMBER_CEL}</td>
								<td>${userlist.REG_DT}</td>
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
										<li class="active"><a href="manage.do?pageNum=${page.pageNum}&blockPage=${pageInfo.blockPage}&search_type=${pageInfo.search_type}&search=${pageInfo.search}&member_role=${pageInfo.member_role}&search_start_date=${pageInfo.search_start_date}&search_end_date=${pageInfo.search_end_date}">${page.pageNum}</a></li>
									</c:when>
									<c:otherwise>
										<li><a href="manage.do?pageNum=${page.pageNum}&blockPage=${pageInfo.blockPage}&search_type=${pageInfo.search_type}&search=${pageInfo.search}&member_role=${pageInfo.member_role}&search_start_date=${pageInfo.search_start_date}&search_end_date=${pageInfo.search_end_date}">${page.pageNum}</a></li>
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
	<!--/.page-content-->
</div>

<script type="text/javascript">
	//validate
	/* setValid();
	$("#searchForm").validate({
		rules: {
			search_type: {
				required: true
			}
		},
		messages: {
			search_type: {
				required: "회원검색 목록을 선택해 주세요."
			}
		}
	}); */
	

	jQuery(function($){
		$('#date-picker-first').datepicker();
		$('#date-picker-last').datepicker();
	});
	
	//side active
	$("#side-user").addClass("open active");

	//search init 
	$("#searchForm input[name=search").val("${ pageInfo.search }");
	$("#searchForm input[name=search_start_date]").val("${ pageInfo.search_start_date }");
	$("#searchForm input[name=search_end_date]").val("${ pageInfo.search_end_date }");
	$("#searchForm select[name=member_role]").val("${ pageInfo.member_role }").attr("selected", "selected");
	$("#searchForm select[name=search_type]").val("${ pageInfo.search_type }").attr("selected", "selected");

	$("#search").click(function(){
		if($("[name=search_type]").val() == 0 && $("#inputSearch").val() != ''){
			alert("회원검색 목록을 선택해 주세요.");
		}else {
			$("#searchForm").attr({
				method: 'post',
				action: '${ contextPath }/user/manage.do'
			}).submit();	
		}
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
</script>
