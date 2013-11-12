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
			<li>FAQ 관리
				<span class="divider">
					<i class="icon-angle-right arrow-icon"></i>
				</span>
			</li>
			<li class="active">FAQ 리스트</li>
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
			<h3 class="header smaller lighter blue">FAQ 리스트</h3>
			<!-- /. table-header -->
			
				<form class="form-horizontal well" id="searchForm">
					<div class="row-fluid">
						<div class="span12">
							<div class="control-group">
   								<label class="control-label">제목검색</label>
    							<div class="controls">
    								<input type="hidden" name="search_type" value="title">
									<input class="input-xxlarge span10" type="text" name="search" placeholder="검색어를 입력하세요">
								</div>
							</div>
						</div>
					</div>

					<div class="row-fluid">
						<div class="span4">
							<div class="control-group" style="margin: 0;">
   								<label class="control-label">카테고리</label>
    							<div class="controls">
									<select class="span12" name="contents_code">
									  <option value="">전체</option>
    								<c:forEach var="cateList" items="${ cateList }">
									  <option value="${cateList.CODE }" >${ cateList.CODE_DETAIL }</option>
    								</c:forEach>
									</select>
								</div>
							</div>
						</div>
						<div class="span8 text-right">
							<a class="btn btn-success input-small" id="reset" style="line-height: 20px;">초기화</a>
							<a class="btn btn-info input-small" id="search">검색</a>
						</div>
					</div>
				</form>
				
			<div class="table-header" align="right">
				<a class="btn btn-info btn-success" href="${ contextPath }/cscenter/faqInfo.do">추가</a>
			</div>
			<table class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th>번호</th>
						<th>카테고리</th>
						<th>제목</th>
					</tr>
				</thead>

				<tbody>
				<c:forEach var="faqList" items="${faqList}" varStatus="status">
					<tr>
						<td><a href="${ contextPath }/cscenter/faqInfo.do?board_contents_id=${ faqList.CONTENTS_ID }">${ faqList.CONTENTS_ID }</a></td>
						<td><a href="${ contextPath }/cscenter/faqInfo.do?board_contents_id=${ faqList.CONTENTS_ID }">${ faqList.CONTENTS_CODE_DESC }</a></td>
						<td><a href="${ contextPath }/cscenter/faqInfo.do?board_contents_id=${ faqList.CONTENTS_ID }">${ faqList.TITLE }</a></td>
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
								<li class="prev"><a href="faqManage.do?blockPage=${pageInfo.preBlockPage}"><i class="icon-double-angle-left"></i></a></li>
							</c:otherwise>
						</c:choose>
						<c:forEach items="${pageList }" var="page">
							<c:choose>
								<c:when test="${pageInfo.pageNum == page.pageNum}">
									<li class="active"><a href="faqManage.do?pageNum=${page.pageNum}&blockPage=${pageInfo.blockPage}&search_type=title&search=${pageInfo.search}&contents_code=${pageInfo.contents_code}">${page.pageNum}</a></li>
								</c:when>
								<c:otherwise>
									<li><a href="faqManage.do?pageNum=${page.pageNum}&blockPage=${pageInfo.blockPage}&search_type=title&search=${pageInfo.search}&contents_code=${pageInfo.contents_code}">${page.pageNum}</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:choose>
							<c:when test="${pageInfo.blockPage == pageInfo.totalBlockPage}">
								<li class="next disabled"><a href="#null"><i class="icon-double-angle-right"></i></a></li>
							</c:when>
							<c:otherwise>
								<li class="next"><a href="faqManage.do?blockPage=${pageInfo.nextBlockPage}"><i class="icon-double-angle-right"></i></a></li>
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
	$("#side-cscenter-faq").addClass("active");

	//page init
	$("#searchForm input[name=search").val("${ pageInfo.search }");
	$("#searchForm select[name=contents_code]").val("${ pageInfo.contents_code }").attr("selected", "selected");

	$("#reset").click(function(){
		$("#searchForm input[name=search").val("");
		$("#searchForm select[name=contents_code]").val("").attr("selected", "selected");
	});
	
	$("#search").click(function(){
		$("#searchForm").attr({
			method: 'post',
			action: '${ contextPath }/cscenter/faqManage.do'
		}).submit();	
	});
</script>