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
			<li>공지사항 관리
				<span class="divider">
					<i class="icon-angle-right arrow-icon"></i>
				</span>
			</li>
			<li class="active">공지사항 리스트</li>
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
			<h3 class="header smaller lighter blue">공지사항 리스트</h3>
			<!-- /. table-header -->
			
				<form class="form-horizontal well" id="searchForm">
					<div class="row-fluid">
						<div class="span12">
							<div class="control-group">
   								<label class="control-label">제목검색</label>
    							<div class="controls">
    								<input type="hidden" name="search_type" value="title">
									<input class="input-xxlarge span10" name="search" type="text" placeholder="검색어를 입력하세요">
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
				
			<div class="table-header" align="right">
				<a class="btn btn-info btn-success" href="${ contextPath }/cscenter/noticeInfo.do">추가</a>
			</div>
			<table class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th>NO</th>
						<th>제목</th>
						<th>등록일시</th>
						<th>조회</th>
					</tr>
				</thead>
				
				<tbody>
				<c:forEach var="noticeList" items="${noticeList}" varStatus="status">
					<tr>
						<td><a href="${ contextPath }/cscenter/noticeInfo.do?board_contents_id=${ noticeList.CONTENTS_ID }">${ noticeList.CONTENTS_ID }</td>
						<td><a href="${ contextPath }/cscenter/noticeInfo.do?board_contents_id=${ noticeList.CONTENTS_ID }">${ noticeList.TITLE }</a></td>
						<td>${ noticeList.REG_DT }</td>
						<td>${ noticeList.HITS }</td>
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
								<li class="prev"><a href="noticeManage.do?blockPage=${pageInfo.preBlockPage}&search_type=title&search=${page.search}"><i class="icon-double-angle-left"></i></a></li>
							</c:otherwise>
						</c:choose>
						<c:forEach items="${pageList }" var="page">
							<c:choose>
								<c:when test="${pageInfo.pageNum == page.pageNum}">
									<li class="active"><a href="noticeManage.do?pageNum=${page.pageNum}&blockPage=${pageInfo.blockPage}&search_type=title&search=${pageInfo.search}">${page.pageNum}</a></li>
								</c:when>
								<c:otherwise>
									<li><a href="noticeManage.do?pageNum=${page.pageNum}&blockPage=${pageInfo.blockPage}&search_type=title&search=${pageInfo.search}">${page.pageNum}</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:choose>
							<c:when test="${pageInfo.blockPage == pageInfo.totalBlockPage}">
								<li class="next disabled"><a href="#null"><i class="icon-double-angle-right"></i></a></li>
							</c:when>
							<c:otherwise>
								<li class="next"><a href="noticeManage.do?blockPage=${pageInfo.nextBlockPage}&search_type=title&search=${pageInfo.search}"><i class="icon-double-angle-right"></i></a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</div>
			</div>
		</div><!--  page-link -->
		
	</div>
</div>

<script type="text/javascript">

//side active
$("#side-cscenter").addClass("open active");
	$("#side-cscenter-notice").addClass("active");

	$("#search").click(function(){
		$("#searchForm").attr({
			method: 'post',
			action: '${ contextPath }/cscenter/noticeManage.do'
		}).submit();	
	});
	
</script>