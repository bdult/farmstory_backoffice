<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>			

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
			<li>게시판 관리
				<span class="divider">
					<i class="icon-angle-right arrow-icon"></i>
				</span>
			</li>
			<li class="active">마스터</li>
		</ul><!--.breadcrumb-->

		<div class="nav-search" id="nav-search">
			<form class="form-search" action="manage.do" method="post">
				<span class="input-icon" >
					<input type="text" name="search" placeholder="Search ..." class="input-small nav-search-input"  autocomplete="off" value="${search }"/>
					<i class="icon-search nav-search-icon"></i>
				</span>
			</form>
		</div><!--#nav-search-->
	</div>

	<div class="page-content">
		<div class="row-fluid">
			<div class="row-fluid">
					<h3 class="header smaller lighter blue">게시판 리스트</h3>
					<div class="table-header" align="right">
						<button id="create-board-btn" class="btn btn-success">추가</button>
					</div><!-- /. table-header -->
					<table id="board_table" class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th>게시판 ID</th>
								<th>게시판명</th>
								<th>생성자 명</th>
								<th>변경자 명</th>
								<th>댓글 사용여부</th>
								<th>파일 업로드 사용여부</th>
								<th><i class="icon-time bigger-110 hidden-phone"></i>생성일자</th>
							</tr>
						</thead>

						<tbody>
						<c:forEach items="${boardList }" var="board">
							<tr>
								<td><a href="${contextPath}/board/detail.do?board_id=${board.BOARD_ID }">${board.BOARD_ID }</a></td>
								<td><a href="${contextPath}/board/detail.do?board_id=${board.BOARD_ID }">${board.BOARD_NM }</a></td>
								<td>${board.REG_MEMBER_NM }</td>
								<td>${board.MOD_MEMBER_NM }</td>
								<td>${board.COMMENT_USE_YN }</td>
								<td>${board.FILEUPLOAD_USE_YN }</td>
								<td>${board.REG_DT }</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
			</div><!--/. board table div-->
			
			<div class="row-fluid">
				<div class="span6">
					<div class="dataTables_info">Total ${pageInfo.totalCount } entries</div>
				</div>
				<div class="span6">
					<div class="dataTables_paginate paging_bootstrap pagination">
						<ul>
							<li class="prev disabled"><a href="#null"><i
									class="icon-double-angle-left"></i></a></li>
							<c:forEach items="${pageList }" var="page">
								<c:choose>
									<c:when test="${pageInfo.pageNum == page.pageNum}">
										<li class="active"><a href="manage.do?pageNum=${page.pageNum}&search=${pageInfo.search}">${page.pageNum}</a></li>
									</c:when>
									<c:otherwise>
										<li><a href="manage.do?pageNum=${page.pageNum}&search=${pageInfo.search}">${page.pageNum}</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<li class="next"><a href="#"><i
									class="icon-double-angle-right"></i></a></li>
						</ul>
					</div>
				</div>
			</div><!--  page-link -->
			
		</div><!--/. page-content-->
	</div><!--/.main-content-->

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
			$("#side-board-master").attr("class", "active");
			$("#side-board").attr("class", "open active");
		
			$(function() {
				$("#create-board-btn").click(function(){
					window.location.href="${contextPath}/board/createView.do";
				});
			});
		</script>

