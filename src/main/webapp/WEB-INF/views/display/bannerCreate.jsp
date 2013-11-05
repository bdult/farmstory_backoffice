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
			<li class="active">메인화면 관리</li>
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
			<h3 class="header smaller lighter blue">상단 비주얼 등록</h3>
			<table class="table table-striped table-bordered table-hover">
				<tbody>
					<tr>
						<td>제목</td>
						<td>
							<input type="text" name="title">
						</td>
						<td></td>
					</tr>
					<tr>
						<td>대표이미지</td>
						<td>
							<input type="text" name="ima_path">
						</td>
						<td>
							<button id="mainImgUploadBtn" class="btn btn-minier btn-yellow">찾아보기</button>
						</td>
					</tr>
					<tr>
						<td>링크 URL</td>
						<td>
							http:// <input type="text" name="link_url" /> 
						</td>
						<td>
							<input type="checkbox" /> 링크없음
						</td>
					</tr>
				</tbody>
			</table>
			<div class="text-right">
				<button class="btn btn-sm btn-yellow">수정</button>
				<button class="btn btn-sm btn-yellow">삭제</button>
			</div>
		</div><!--/.row-fluid-->
		
	</div><!--/.page-content-->
</div>

<!--  대표이미지 modal -->
<div id="thumbnail-modal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<form action="thumbnail-upload.do" id="thumbnail-upload-form"  method="POST" enctype="multipart/form-data">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			<h3 class="text-center">대표이미지 업로드</h3>
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
	//사이드바 활성화
	$("#side-display-main").addClass("active");
	$("#side-display").addClass("open active");
	
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
});
</script>

		