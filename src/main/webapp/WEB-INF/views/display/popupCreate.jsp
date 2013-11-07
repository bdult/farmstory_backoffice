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
				전시관리
				<span class="divider">
					<i class="icon-angle-right arrow-icon"></i>
				</span>
			</li>
			<li class="active">팝업관리</li>
		</ul><!--.breadcrumb-->

		<div class="nav-search" id="nav-search">
			<form class="form-search">
				<span class="input-icon">
					<input type="text" placeholder="Search ..." class="input-small nav-search-input" id="nav-search-input" autocomplete="off" />
					<i class="icon-search nav-search-icon"></i>
				</span>
			</form>
		</div><!--#nav-search-->
	</div>

	<div class="page-content">
		<div class="row-fluid">
			<h3 class="header smaller lighter blue">팝업 등록</h3>
			<form id="createForm" action="${ contextPath }/display/popup/create.do" method="POST">
				<table class="table table-striped table-bordered table-hover">
					<tbody>
						<tr>
							<td>제목</td>
							<td>
								<input class="no-magin-bottom" type="text" name="title">
								<input type="hidden" name="display_code" value="DIS003">
							</td>
							<td></td>
						</tr>
						<tr>
							<td>팝업 이미지</td>
							<td>
								<input class="no-magin-bottom" type="text" id="img_path" name="img_path" readonly>
							</td>
							<td>
								<a id="mainImgUploadBtn" class="btn btn-sm btn-yellow">찾아보기</a>
							</td>
						</tr>
						<tr>
							<td>링크 URL</td>
							<td>
								http:// <input class="no-magin-bottom" type="text" id="link_url" name="link_url" /> 
							</td>
							<td>
								<div class="checkbox">
									<label>
										<input class="ace" type="checkbox" id="noLink">
										<span class="lbl"> 링크없음</span>
									</label>
								</div>
							</td>
						</tr>
						<tr>
							<td>노출여부</td>
							<td>
								<div class="display-yn radio-inline" data-display-yn="${ obj.DISPLAY_YN }">
									<label>
										<input name="display_yn" type="radio" class="ace" value="Y">
										<span class="lbl"> 노출중 </span>
										<input name="display_yn" type="radio" class="ace" value="N" checked>
										<span class="lbl"> 노출안함 </span>
									</label>
								</div>
							</td>
							<td></td>
						</tr>
					</tbody>
				</table>
			</form>
			<div class="text-right">
				<button id="createBtn" class="btn btn-sm btn-yellow">등록</button>
				<a href="javascript:history.back(-1);" class="btn btn-sm btn-yellow">취소</a>
			</div>
		</div><!--/.row-fluid-->
		
	</div><!--/.page-content-->
</div>

<!--  대표이미지 modal -->
<div id="thumbnail-modal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<form action="${ contextPath }/file/imageUpload.do" id="thumbnail-upload-form"  method="POST" enctype="multipart/form-data">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			<h3 class="text-center">팝업이미지 업로드</h3>
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

<script>
$(function(){
	
	{//init
		//사이드바 활성화
		$("#side-display-popup").addClass("active");
		$("#side-display").addClass("open active");
		
	}//init
	
	{//event
		
		$("#createBtn").click(function(){
			if( confirm("등록하시겠습니까?") ) {
				$("#createForm").submit();
			}
		});
	
		$("#noLink").click(function(){
			var $this = $(this);
			
			var $link_url = $("#link_url");
			if( $this.prop("checked") ) {
				$link_url.prop("disabled", true).val("");
			} else {
				$link_url.prop("disabled", false);
			}
		});
		
		$("#mainImgUploadBtn").click(function(){
			$("#thumbnail-modal-footer").hide();
			$("#thumbnail-modal").modal('toggle');
		}); // <!-- mainImgUploadBtn event end
		
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
	}//event
	
});
</script>

		