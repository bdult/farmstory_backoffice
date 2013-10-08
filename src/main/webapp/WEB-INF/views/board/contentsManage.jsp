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
			<li class="active">게시판 조회</li>
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
				<h3 class="header smaller lighter blue">
					게시판 조회
					<select id="boardSelect" style="margin-bottom: 0px;">
						<option value="0">선택해 주세요</option>
						<c:forEach items="${boardList}" var="obj">
							<option value="${obj.BOARD_ID}">${obj.BOARD_NM}</option>
						</c:forEach>
					</select>
				</h3>
				<div class="table-header" align="right">
					<button id="create-board-btn" class="btn btn-success">추가</button>
				</div><!-- /. table-header -->
				<table id="board_table" class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th>게시글 ID</th>
							<th>제목</th>
							<th>작성자</th>
							<th><i class="icon-time bigger-110 hidden-phone"></i>생성일자</th>
						</tr>
					</thead>

					<tbody>
					<c:forEach items="${ boardContents }" var="obj">
						<tr>
							<td>${ obj.CONTENTS_ID }</td>
							<td><a href="${contextPath}/board/contents/detail.do?contentsId=${ obj.CONTENTS_ID }">${ obj.TITLE }</a></td>
							<td>${ obj.MEMBER_ID }</td>
							<td>${ obj.REG_DT }</td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
		</div><!--/. board table div-->
			
			<div class="row-fluid">
				<div class="span6">
					<div class="dataTables_info">Total ${totalCount } entries</div>
				</div>
				<div class="span6">
					<div class="dataTables_paginate paging_bootstrap pagination">
						<ul>
							<li class="prev disabled"><a href="#null"><i
									class="icon-double-angle-left"></i></a></li>
							<c:forEach items="${pageList }" var="page">
								<c:choose>
									<c:when test="${pageInfo.pageNum == page.pageNum}">
										<li class="active"><a href="manage.do?pageNum=${page.pageNum}&search=${search}">${page.pageNum}</a></li>
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

	<div id="parameter" data-board-id="${ parameter.boardId }"></div>
	
	<script type="text/javascript">
		$("#side-board").attr("class", "open active");
		$("#side-board-board").attr("class", "active");
	
		$(function() {
			
			var boardId = $("#parameter").data("boardId");

			$("#create-board-btn").click(function(){
				if( $("#boardSelect").val() == 0 ) {
					return alert("게시판을 선택해 주세요.");
				}
				window.location.href="${contextPath}/board/contents/createView.do?BOARD_ID=" + boardId;
			});
			
			$("#boardSelect").change(function(){
				var $this = $(this);
				var boardId = $this.find(":selected").val();
				//'선택해 주세요' 선택시 화면 이동 없음
				if( boardId > 0 ) {
					window.location.href = "${contextPath }/board/contents/manage.do?boardId=" + boardId;
				}
			});
			
			//게시판 아이디 존재시 SELECT 변경 이벤트
			if( $.type( boardId ) == "number" ) {
				$("#boardSelect > option[value=" + boardId + "]").prop("selected", true);
			}
		});
	</script>

