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
							컨텐츠 관리
							<span class="divider">
								<i class="icon-angle-right arrow-icon"></i>
							</span>
						</li>
						<li>
							브랜드
							<span class="divider">
								<i class="icon-angle-right arrow-icon"></i>
							</span>
						</li>
						<li class="active">상세</li>
					</ul><!--.breadcrumb-->
			
				</div><!-- #breadcrumbs -->

				<div class="page-content">
					<div class="page-header position-relative">
						<h1>
							브랜드 상세
							<small>
								<i class="icon-double-angle-right"></i>
								브랜드에 대한 상세한 정보
							</small>
						</h1>
					</div><!--/.page-header-->

					<div class="row-fluid">
						<div class="span12">
							<!--PAGE CONTENT BEGINS-->

							<form name="frm" method="post" action="${contextPath }/brand/modify.do" class="form-horizontal" >
								<input type="hidden" name="mode" value="${mode}" />
								
								<div class="control-group">
									<label class="control-label" for="contents_id">브랜드 ID</label>

									<div class="controls">
										<input readonly="readonly" type="text" id="brand_id" name="brand_id" value="${data.BRAND_ID}" />
									</div>
								</div>

								<div class="control-group">
									<label class="control-label" for="contents_nm">브랜드 명</label>

									<div class="controls">
										<input type="text" id="brand_nm" name="brand_nm" placeholder="브랜드 명" value="${data.BRAND_NM}" />
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label">이미지</label>
									<div class="controls">
										<input id="img_path" name="img_path" type="text" readonly value="${data.IMG_PATH}">
										<button id="modify-img-btn" class="btn btn-info" type="button">변경</button>
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="form-field-2">브랜드 설명</label>
									<div class="controls">
										<c:choose>
											<c:when test="${data.BRAND_DESC != null}">
												<textarea rows="20" class="autosize-transition span12" id="brand_desc" name="brand_desc">${data.BRAND_DESC }</textarea>
											</c:when>
											<c:otherwise>
												<textarea rows="20" class="autosize-transition span12" id="brand_desc" name="brand_desc" ></textarea>
											</c:otherwise>
										</c:choose>
									</div>
								</div>

								<div class="form-actions">
									<button class="btn btn-primary" type="submit">
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
				<input type="hidden" name="brand_id" value="${data.BRAND_ID }">
			</form>
			

<!--  thumbnail modal -->
<div id="img-modal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<form action="imgUpload.do" id="img-upload-form" method="POST" enctype="multipart/form-data">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			<h3 class="text-center">이미지 업로드</h3>
		</div>
		<div class="modal-body">
			<input type="file" id="img-upload-input" name="file" />
		</div>
		<div id="img-modal-footer" class="modal-footer">
			<button type="submit" id="img-upload-submit" class="btn btn-sm btn-success">
				업로드
				<i class="icon-arrow-right icon-on-right bigger-110"></i>
			</button>
		</div>
	</form>
	<div id="upload-bar" class="progress">
        <div class="bar"></div >
        <div class="percent">0%</div >
    </div>
</div>

<script type="text/javascript">
	$("#side-contents-brand").attr("class", "active");
	$("#side-contents").attr("class", "open active");

	$(function(){
		
		$("#modify-img-btn").click(function(){
			$("#img-modal-footer").hide();
			$("#upload-bar").hide();
			$("#img-modal").modal('toggle');
		});
		
		$('#img-upload-input').ace_file_input({
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
			$("#img-modal-footer").show();
		});
		
		var bar = $('.bar');
		var percent = $('.percent');
		var status = $('#status');
		$('#img-upload-form').ajaxForm(
				 {	beforeSend: function() {
						
				        status.empty();
				        var percentVal = '0%';
				        bar.width(percentVal);
				        percent.html(percentVal);
				    },
				    uploadProgress: function(event, position, total, percentComplete) {
				    	$("#upload-bar").show();
				        var percentVal = percentComplete + '%';
				        bar.width(percentVal);
				        percent.html(percentVal);
				    },
				    success: function(response){
					    $("#img_path").val(response);
					    $("#img-modal").modal('toggle');
					}
				 }
		 );
		
		$("#cancel-btn").click(function(){
			history.back(1);
		});
		
		$("#delete-btn").click(function(){
			$("#delete-form").submit();
		});
		
	}); // <!-- function() end 
	
	
</script>