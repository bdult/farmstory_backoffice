<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
			

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
			<li class="active">코드 관리
			</li>
		</ul>

		<div class="nav-search" id="nav-search">
			<form class="form-search" action="manage.do" method="post">
				<span class="input-icon">
					<input type="text" name="search" placeholder="Search ..." class="input-small nav-search-input" id="search-input" autocomplete="off" value="${search }" />
					<i class="icon-search nav-search-icon"></i>
				</span>
			</form>
		</div><!--#nav-search-->
	</div><!--.breadcrumb-->

	<div class="page-content">
		<div class="row-fluid">
			<h3 class="header smaller lighter blue">코드 리스트
			</h3>
			<div class="table-header" align="right">
				<button id="create-code-btn" class="btn btn-success">추가</button>
			</div><!-- /. table-header -->
			<table class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th>인덱스</th>
						<th>코드</th>
						<th>코드 설명</th>
						<th>상위 코드</th>
						<th><i class="icon-time bigger-110 hidden-phone"></i>생성일</th>
					</tr>
				</thead>

				<tbody>
				<c:forEach var="code" items="${list}" varStatus="status">
					<tr>

						<td>
							<a href="${contextPath }/code/detail.do?pageNum=${pageInfo.pageNum}&code_idx=${code.IDX}">${code.IDX}</a>
						</td>
						<td>
							<a href="${contextPath }/code/detail.do?pageNum=${pageInfo.pageNum}&code_idx=${code.IDX}">${code.CODE}</a>
						</td>
						<td>${code.CODE_DETAIL}</td>
						<td>${code.PARENT_CODE}</td>											
						<td>${code.REG_DT}</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div><!--/.row-fluid-->
		
		<div class="row-fluid">
				<div class="span6">
					<div class="dataTables_info">Total ${pageInfo.totalCount } entries</div>
				</div>
				<div class="span6">
					<div class="dataTables_paginate paging_bootstrap pagination">
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
		
	</div><!--/ .page-content-->
</div><!--/ .main-content-->

<!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='assets/js/jquery-1.10.2.min.js'>"+"<"+"/script>");
</script>
<![endif]-->
		
		<script type="text/javascript">
			if("ontouchend" in document) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
		</script>
		<script src="assets/js/bootstrap.min.js"></script>

		<!--ace scripts-->

		<script src="assets/js/ace-elements.min.js"></script>
		<script src="assets/js/ace.min.js"></script>

		<!--inline scripts related to this page-->

		<script type="text/javascript">
		
			$(function(){
				$("#side-code-code").attr("class", "active");
				
					$("#create-code-btn").click(function(){
						location.href="${contextPath}/code/createView.do";
					});
				
				$("#modify_icon").click(function(){
					
				});
				$("#detail_icon").click(function(){
				
				});
			});
		</script>
		
		</script>