<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>			

<div class="main-content">
	<div class="breadcrumbs" id="breadcrumbs">
		<ul class="breadcrumb">
			<li>
				<i class="icon-home home-icon"></i>
				<a href="#">Main</a>

				<span class="divider">
					<i class="icon-angle-right arrow-icon"></i>
				</span>
			</li>
			<li class="active">게시판 관리</li>
		</ul><!--.breadcrumb-->

		<div class="nav-search" id="nav-search">
			<form class="form-search" action="search.do" method="post">
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
					<div class="table-header">
						<button id="create-board-btn" class="btn btn-info">게시판 추가</button>
					</div><!-- /. table-header -->
					<table id="board_table" class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th class="center">
									<label>
										<input type="checkbox" />
										<span class="lbl"></span>
									</label>
								</th>
								<th>게시판 ID</th>
								<th>게시판명</th>
								<th>생성자 ID</th>
								<th>변경자 ID</th>
								<th>댓글 사용여부</th>
								<th>파일 업로드 사용여부</th>
								<th>생성일자</th>
								<th></th>
							</tr>
						</thead>

						<tbody>
						<c:forEach items="${boardList }" var="board">
							<tr>
								<td class="center">
									<label>
										<input type="checkbox" />
										<span class="lbl"></span>
									</label>
								</td>

								<td>${board.BOARD_ID }</td>
								<td>${board.BOARD_NM }</td>
								<td>${board.REG_MEMBER_ID }</td>
								<td>${board.MOD_MEMBER_ID }</td>
								<td>${board.COMMENT_USE_YN }</td>
								<td>${board.FILEUPLOAD_USE_YN }</td>
								<td>${board.REG_DT }</td>
								<td class="td-actions">
									<div class="hidden-phone visible-desktop action-buttons">
										<a class="blue" href="detail.do?board_id=${board.BOARD_ID }">
											<i id="detail_icon" class="icon-zoom-in bigger-130"></i>
										</a>
		
										<a class="green" href="detail.do?board_id=${board.BOARD_ID }">
											<i id="modify_icon" class="icon-pencil bigger-130"></i>
										</a>
		
										<a class="red" href="delete.do?board_id=${board.BOARD_ID }">
											<i id="delete_icon" class="icon-trash bigger-130"></i>
										</a>
									</div>
								</td>
							</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
			</div><!--/. board table div-->
			
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
		$("#side-board-board").attr("class", "open active");
			$(function() {
				$("#create-board-btn").click(function(){
					window.location.href="${contextPath}/board/createView.do";
				});
			});
		</script>

