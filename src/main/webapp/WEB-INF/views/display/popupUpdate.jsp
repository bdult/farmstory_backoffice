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
				Display
				<span class="divider">
					<i class="icon-angle-right arrow-icon"></i>
				</span>
			</li>
			<li class="active">Popup</li>
		</ul><!--.breadcrumb-->
	</div>

	<div class="page-content">
		<div class="row-fluid">
			<h3 class="header smaller lighter blue">Popup Modify</h3>
			<form id="updateForm" action="${ contextPath }/display/popup/update.do" method="POST">
				<table class="table table-striped table-bordered table-hover">
					<tbody>
						<tr>
							<td>Title</td>
							<td>
								<input class="no-magin-bottom" type="text" name="title" value="${ obj.TITLE }">
								<input type="hidden" name="display_id" value="${ obj.DISPLAY_ID }">
							</td>
							<td></td>
						</tr>
						<tr>
							<td>Image</td>
							<td>
								<input class="no-magin-bottom" type="text" name="img_path" id="img_path" value="${ obj.IMG_PATH }" readonly>
								<div id="thumbnail-box" style="display: none;">
									<br />
									<img id="thumbnail" width="300" height="300" />
									<a class="btn btn-app btn-danger btn-small" id="thumbnailDeleteBtn">
										<i class="icon-trash bigger-200"></i>
										Delete
									</a>
								</div>
							</td>
							<td>
								<a id="mainImgUploadBtn" class="btn btn-sm btn-yellow">Search</a>
							</td>
						</tr>
						<tr>
							<td>Link URL</td>
							<td>
								http:// <input class="no-magin-bottom" type="text" id="link_url" name="link_url" /> 
							</td>
							<td>
								<div class="checkbox">
									<label>
										<input class="ace" type="checkbox" id="noLink">
										<span class="lbl"> No Link</span>
									</label>
								</div>
							</td>
						</tr>
						<tr>
							<td>Display</td>
							<td>
								<div class="display-yn radio-inline" data-display-yn="${ obj.DISPLAY_YN }">
									<label class="inline">
										<input name="display_yn" type="radio" class="ace" value="Y">
										<span class="lbl"> Show </span>
									</label>
									<label class="inline">
										<input name="display_yn" type="radio" class="ace" value="N">
										<span class="lbl"> Hide </span>
									</label>
								</div>
							</td>
							<td></td>
						</tr>
					</tbody>
				</table>
			</form>
			<div class="text-right">
				<button id="updateBtn" class="btn btn-sm btn-yellow">Save</button>
				<a href="javascript:history.back(-1);" class="btn btn-sm btn-yellow">Cencel</a>
			</div>
		</div><!--/.row-fluid-->
		
	</div><!--/.page-content-->
</div>

<!--  대표이미지 modal -->
<div id="thumbnail-modal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<form action="${ contextPath }/file/imageUpload.do" id="thumbnail-upload-form"  method="POST" enctype="multipart/form-data">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			<h3 class="text-center">Image Upload</h3>
		</div>
		<div class="modal-body">
				<input type="file" id="thumbnail-upload-input" name="file" />
		</div>
		<div id="thumbnail-modal-footer" class="modal-footer">
			<button type="submit" id="thumbnail-upload-submit" class="btn btn-sm btn-success">
				Upload
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
		
		//노출 Y/N 체크 
		$("div.display-yn").each(function(){
			var $this = $(this);
			var displayYn = $this.data("displayYn");
			
			$this.find(":radio[value='" + displayYn + "']").prop("checked", true);
	
		});
		
		if( $("#img_path").val().length > 0 ) {
			$("#thumbnail-box").show();
			$("#thumbnail").attr("src",  "${ httpPath }" + $("#img_path").val() );
		}
		
	}//init
	
	{//event
		
		$("#noLink").click(function(){
			var $this = $(this);
			
			var $link_url = $("#link_url");
			if( $this.prop("checked") ) {
				$link_url.prop("disabled", true).val("");
			} else {
				$link_url.prop("disabled", false);
			}
		});
	
		$("#updateBtn").click(function(){
			
			//validation
			var $title = $("input[name='title']");
			if( isEmpty( $title.val() ) ) {
				alert("Please insert title.");
				$title.focus();
				return false;
			}

			var $img_path = $("input[name='img_path']");
			if( isEmpty( $img_path.val() ) ) {
				alert("Please upload image");
				return false;
			}
			
			var $noLink = $("#noLink");
			if( $noLink.prop("checked") == false ) {
				var $link_url = $("input[name='link_url']");
				if( isEmpty( $link_url.val() ) ) {
					alert("Please insert link");
					$link_url.focus();
					return false;
				}
			}
			
			if( confirm("Save ?") ) {
				$("#updateForm").submit();
			}
		});
		
		$("#deleteBtn").click(function(){
			if( confirm("Delete ?") ) {
				window.location.href = "${ contextPath }/display/popup/delete.do?display_id=${ obj.DISPLAY_ID }";
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
					      
					      //for thumbnail
					      $("#thumbnail-box").show();
					      $("#thumbnail").attr("src",  "${ httpPath }" + response );
					      
					      $("#thumbnail-modal").modal('toggle');
						}
				 }
		 );
		
		$("#thumbnailDeleteBtn").click(function(){
			$("#img_path").val("");
			$("#thumbnail").attr("src",  "");
			$("#thumbnail-box").hide();
		});
	}//event
});
</script>

		