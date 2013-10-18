<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>


			<div class="main-content">
				<div class="breadcrumbs" id="breadcrumbs">
					<ul class="breadcrumb">
						<li>
							<i class="icon-home home-icon"></i>
							<a href="${contextPath }/">Home</a>

							<span class="divider">
								<i class="icon-angle-right arrow-icon"></i>
							</span>
						</li>
						<li>
							게시판 관리
							<span class="divider">
								<i class="icon-angle-right arrow-icon"></i>
							</span>
						</li>
						<li>
							마스터
							<span class="divider">
								<i class="icon-angle-right arrow-icon"></i>
							</span>
						</li>
						<li class="active">상세</li>
					</ul><!--.breadcrumb-->

				</div>

				<div class="page-content">
					<div class="page-header position-relative">
						<h1>
							게시판 상세
							<small>
								<i class="icon-double-angle-right"></i>
								게시판에 대한 상세한 정보를 입력한다
							</small>
						</h1>
					</div><!--/.page-header-->

					<div class="row-fluid">
						<div class="span12">
							<!--PAGE CONTENT BEGINS-->

							<form id="modify-form" method="post" action="${contextPath }/board/modify.do" class="form-horizontal" >
								<input type="hidden" name="reg_member_id" value="${ login_session.member_id }">
								<input type="hidden" name="mode" value="${mode}" />
								
								<div class="control-group">
									<label class="control-label" for="board_id">게시판 ID</label>

									<div class="controls">
										<input readonly="readonly" type="text" id="board_id" name="board_id" value="${data.BOARD_ID}" />
									</div>
								</div>

								<div class="control-group">
									<label class="control-label" for="board_nm">게시판 명</label>

									<div class="controls">
										<input type="text" id="board_nm" name="board_nm" placeholder="게시판 명" value="${data.BOARD_NM}" />
									</div>
								</div>
								
								
								<div class="control-group">
									<label class="control-label" for="src_path">댓글 사용여부</label>

									<div class="controls">
										<input type="text" value="${data.COMMENT_USE_YN== null? "Y" : data.COMMENT_USE_YN}" />
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="form-field-2">파일 업로드 사용여부</label>

									<div class="controls">
										<input type="text" value="${data.FILEUPLOAD_USE_YN== null? "Y" : data.FILEUPLOAD_USE_YN}" />
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="form-field-2">출판사 설명</label>
									<div class="controls">
										<c:choose>
											<c:when test="${data.BOARD_DESC != null}">
												<textarea rows="20" class="autosize-transition span12" id="board_desc" name="board_desc">${data.BOARD_DESC }</textarea>
											</c:when>
											<c:otherwise>
												<textarea rows="20" class="autosize-transition span12" id="board_desc" name="board_desc" ></textarea>
											</c:otherwise>
										</c:choose>
									</div>
								</div>
								

								<div class="form-actions">
									<button id="submit-btn" class="btn btn-primary" type="button">
										<i class="icon-ok bigger-110"></i>
										저장
									</button>

									&nbsp; &nbsp; &nbsp;
									<button id="cancel-btn" class="btn btn-inverse" type="button">
										<i class="icon-undo bigger-110"></i>
										취소
									</button>
									&nbsp; &nbsp; &nbsp;
									<button id="delete-btn" class="btn btn-danger" type="button">
										<i class="icon-remove-sign bigger-110"></i>
										삭제
									</button>
								</div>
							</form>
						</div><!--/.span-->
					</div><!--/.row-fluid-->
				</div><!--/.page-content-->
			</div><!--/.main-content-->
			
			<form id="delete-form" method="post" action="delete.do">
				<input type="hidden" name="board_id" value="${data.BOARD_ID }">
			</form>
			

<script type="text/javascript">
$("#side-board-master").attr("class", "active");
$("#side-board-board").attr("class", "open active");
	$(function(){
		
		$("#cancel-btn").click(function(){
			window.location.href="admin/manage.do?pageNum=1";
		});
		
		$("#delete-btn").click(function(){
			console.log("delete_btn");
			if(confirm("삭제 하시겠습니까?")){
				$("#delete-form").submit();
			}else{
				return false;				
			}
		});
		
		$("#submit-btn").click(function(){
			console.log("delete_btn");
			if(confirm("저장 하시겠습니까?")){
				$("#modify-form").submit();
			}else{
				return false;				
			}
		});
		
	}); // <!-- function() end 
	
	
</script>