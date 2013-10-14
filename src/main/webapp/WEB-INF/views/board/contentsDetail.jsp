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
							게시판 조회
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
							<c:choose>
								<c:when test="${ mode eq 'create' }">
									<form id="modify-form" method="post" action="${contextPath }/board/contents/create.do" class="form-horizontal" >
								</c:when>
								<c:otherwise>
									<form id="modify-form" method="post" action="${contextPath }/board/contents/modify.do" class="form-horizontal" >
								</c:otherwise>
							</c:choose>
								
								<input type="hidden" id="boardId" name="boardId" value="${ data.BOARD_ID }" />
								
								<c:if test="${ mode ne 'create' }">
									<div class="control-group">
										<label class="control-label" for="board_id">글번호</label>
	
										<div class="controls">
											<input readonly="readonly" type="text" id="contentsId" name="contentsId" value="${ data.CONTENTS_ID }" />
										</div>
									</div>
								</c:if>

								<div class="control-group">
									<label class="control-label" for="board_nm">제목</label>

									<div class="controls">
										<input type="text" id="title" name="title" placeholder="제목" value="${ data.TITLE }" />
									</div>
								</div>
								
								<c:if test="${ mode ne 'create' }">
									<div class="control-group">
										<label class="control-label" for="member_id">작성자 ID</label>
	
										<div class="controls">
											<input readonly="readonly" type="text" value="${ data.MEMBER_ID }" />
										</div>
									</div>
								</c:if>
								
								<c:if test="${ mode eq 'create' }">
									<c:if test="${ data.STATUS_USE_YN == 'Y' }">
										<div class="control-group">
											<label class="control-label" for="board_status">상태</label>
		
											<div class="controls">
												<input type="text" name="status" value="${ data.STATUS }" />
											</div>
										</div>
									</c:if>
									
									<c:if test="${ data.IMG_PATH_USE_YN == 'Y' }">
										<div class="control-group">
											<label class="control-label" for="board_img_path">이미지 경로</label>
		
											<div class="controls">
												<input readonly="readonly" class="span5" type="text" id="img_path" name="img_path" value="${data.IMG_PATH }" />
												<input  type="button" id="thumbnail-mod-btn" class="btn btn-primary" value="썸네일 변경" />
											</div>
										</div>
									</c:if>
								</c:if>
								
								<c:if test="${ mode ne 'create' }">
									<c:if test="${ data.STATUS != null }">
										<div class="control-group">
											<label class="control-label" for="board_status">상태</label>
		
											<div class="controls">
												<input type="text" name="status" value="${ data.STATUS }" />
											</div>
										</div>
									</c:if>
									
									<c:if test="${ data.IMG_PATH != null }">
										<div class="control-group">
											<label class="control-label" for="board_img_path">이미지 경로</label>
		
											<div class="controls">
												<input readonly="readonly" class="span5" type="text" id="img_path" name="img_path" value="${data.IMG_PATH }" />
												<input  type="button" id="thumbnail-mod-btn" class="btn btn-primary" value="썸네일 변경" />
											</div>
										</div>
									</c:if>
								</c:if>

								<div class="control-group">
									<label class="control-label" for="form-field-2">내용</label>
									<div class="controls">
										<textarea rows="20" class="autosize-transition span12" id="board_desc" name="contents">${ data.CONTENTS }</textarea>
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
			
			<form id="delete-form" method="post" action="${ contextPath }/board/contents/delete.do">
				<input type="hidden" name="boardId" value="${ data.BOARD_ID }">
				<input type="hidden" name="contentsId" value="${ data.CONTENTS_ID }">
			</form>
			

<!--  thumbnail modal -->
<div id="thumbnail-modal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<form action="thumbnail-upload.do" id="thumbnail-upload-form"  method="POST" enctype="multipart/form-data">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			<h3 class="text-center">썸네일 업로드</h3>
		</div>
		<div class="modal-body">
				<input type="file" id="thumbnail-upload-input" name="file" />
		</div>
		<div id="thumbnail-modal-footer" class="modal-footer">
			<button type="submit" id="thumbnail-upload-submit" class="btn btn-sm btn-success">
				업로드
				<i class="icon-arrow-right icon-on-right bigger-110"></i>
			</button>
		</div>
	</form>
</div>

<script type="text/javascript">
	
	$("#side-board").attr("class", "open active");
	$("#side-board-board").attr("class", "active");
	
	$(function(){

		$('#thumbnail-upload-input').ace_file_input({
			style:'well',
			btn_choose:'Drop files here or click to choose',
			btn_change:null,
			no_icon:'icon-cloud-upload',
			droppable:true,
			thumbnail:'large'//large | fit
			//,icon_remove:null//set null, to hide remove/reset button
			/**,before_change:function(files, dropped) {
				//Check an example below
				//or examples/file-upload.html
				return true;
			}*/
			/**,before_remove : function() {
				return true;
			}*/
			,
			preview_error : function(filename, error_code) {
				//name of the file that failed
				//error_code values
				//1 = 'FILE_LOAD_FAILED',
				//2 = 'IMAGE_LOAD_FAILED',
				//3 = 'THUMBNAIL_FAILED'
				//alert(error_code);
			}
	
		}).on('change', function(){
			$("#thumbnail-modal-footer").show();
		});
		
		$('#thumbnail-upload-form').ajaxForm(
				 {
					    success: function(response){
					      $("#img_path").val(response);
					      $("#thumbnail-modal").modal('toggle');
						}
				 }
		 );
		
		
		$("#cancel-btn").click(function(){
			window.location.href="manage.do?pageNum=${pageNum}";
		});
		
		$("#delete-btn").click(function(){
			if(confirm("삭제 하시겠습니까?")){
				$("#delete-form").submit();
			}else{
				return false;
			}
		});
		
		$("#submit-btn").click(function(){
			if(confirm("저장 하시겠습니까?")){
				$("#modify-form").submit();
			}else{
				return false;
			}
		});
		
		$("#thumbnail-mod-btn").click(function(){
			$("#thumbnail-modal-footer").hide();
			$("#thumbnail-modal").modal('toggle');
		}); // <!-- thumbnaul-mod-btn event end
	}); // <!-- function() end 
</script>