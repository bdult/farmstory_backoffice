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

						<li>
							<a href="#">게시판 관리</a>

							<span class="divider">
								<i class="icon-angle-right arrow-icon"></i>
							</span>
						</li>
						<li class="active">컨텐츠 추가</li>
					</ul><!--.breadcrumb-->

				</div>

				<div class="page-content">
					<div class="page-header position-relative">
						<h1>
							컨텐츠 추가
							<small>
								<i class="icon-double-angle-right"></i>
								컨텐츠에 대한 상세한 정보를 입력한다
							</small>
						</h1>
					</div><!--/.page-header-->

					<div class="row-fluid">
						<div class="span12">
							<!--PAGE CONTENT BEGINS-->

							<form id="create-form" method="post" action="${contextPath }/board/create.do" class="form-horizontal" >
								<div class="control-group">
									<label class="control-label" for="board_id">게시판 ID</label>

									<div class="controls">
										<input readonly="" type="text" />
									</div>
								</div>

								<div class="control-group">
									<label class="control-label" for="board_nm">게시판 명</label>

									<div class="controls">
										<input type="text" id="board_nm" name="board_nm" placeholder="board name" />
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="fileupload_use_yn">파일 업로드 사용 여부</label>
									<div class="controls">
										<select name="fileupload_use_yn">
											<option value="Y">사용</option>
											<option value="N">미사용</option>
										</select>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="comment_use_yn">댓글 사용 여부</label>
									<div class="controls">
										<select name="comment_use_yn">
											<option value="Y">사용</option>
											<option value="N">미사용</option>
										</select>
									</div>
								</div>
								
								<div class="form-actions">
									<button class="btn btn-info" type="submit">
										<i class="icon-ok bigger-110"></i>
										등록
									</button>

									&nbsp; &nbsp; &nbsp;
									<button class="btn" type="reset">
										<i class="icon-undo bigger-110"></i>
										취소
									</button>
								</div>
							</form>
						</div><!--/.span-->
					</div><!--/.row-fluid-->
				</div><!--/.page-content-->
			</div><!--/.main-content-->


<script type="text/javascript">
$("#side-board-master").attr("class", "active");
$("#side-board-board").attr("class", "open active");
	$(function(){
	});
	
</script>