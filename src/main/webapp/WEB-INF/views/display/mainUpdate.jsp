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
			<form id="updateForm" action="${ contextPath }/display/main/update.do" method="POST">
				<table class="table table-striped table-bordered table-hover">
					<tbody>
						<tr>
							<td>제목</td>
							<td>
								<input class="no-magin-bottom" type="text" name="title" value="${ displayInfo.TITLE }">
								<input type="hidden" name="display_id" value="${ displayInfo.DISPLAY_ID }">
								<input type="hidden" name="display_code" value="${ displayInfo.DISPLAY_CODE }">
							</td>
							<td></td>
						</tr>
						<tr>
							<td>대표이미지</td>
							<td>
								<input class="no-magin-bottom" type="text" id="img_path" name="img_path" value="${ displayInfo.IMG_PATH }" readonly>
							</td>
							<td>
								<a id="mainImgUploadBtn" class="btn btn-sm btn-yellow">찾아보기</a>
							</td>
						</tr>
						<tr>
							<td>노출여부</td>
							<td>
								<div class="display_yn radio-inline" data-display-yn="${ displayInfo.DISPLAY_YN }">
									<label>
										<input name="display_yn" type="radio" class="ace" value="Y">
										<span class="lbl"> 노출함 </span>
										<input name="display_yn" type="radio" class="ace" value="N" checked>
										<span class="lbl"> 노출안함 </span>
									</label>
								</div>
							</td>
							<td></td>
						</tr>
						<tr>
							<td>링크 URL</td>
							<td>
								http:// <input class="no-magin-bottom" type="text" id="link_url" name="link_url" value="${ displayInfo.LINK_URL }"/> 
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
					</tbody>
				</table>
			</form>
			<div class="text-right">
				<button id="updateBtn" class="btn btn-sm btn-yellow">수정</button>
				<button id="delBtn" class="btn btn-sm btn-yellow">삭제</button>
			</div>
		</div><!--/.row-fluid-->
		
	</div><!--/.page-content-->
</div>

<!--  대표이미지 modal -->
<div id="thumbnail-modal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<form action="${ contextPath }/file/imageUpload.do" id="thumbnail-upload-form"  method="POST" enctype="multipart/form-data">
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
	
	{//init
		
		//사이드바 활성화
		$("#side-display-main").addClass("active");
		$("#side-display").addClass("open active");
		
		if( $("#link_url").val().length == 0 ){
			$("#link_url").prop("disabled", true);
			$("#noLink").prop("checked", true);
		}

		//노출 Y/N 체크 
		$("div.display_yn").each(function(){
			var $this = $(this);
			var displayYn = $this.data("displayYn");
			
			$this.find(":radio[value='" + displayYn + "']").prop("checked", true);
	
		});
	}//init
	
	{//event
		
		//링크없음 체크 이벤트
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
				alert("제목을 입력해 주세요.");
				$title.focus();
				return false;
			}

			var $img_path = $("input[name='img_path']");
			if( isEmpty( $img_path.val() ) ) {
				alert("찾아보기 버튼을 눌러 이미지를 등록해 주세요.");
				return false;
			}
			
			var $noLink = $("#noLink");
			if( $noLink.prop("checked") == false ) {
				var $link_url = $("input[name='link_url']");
				if( isEmpty( $link_url.val() ) ) {
					alert("링크 URL을 입력해 주세요.");
					$link_url.focus();
					return false;
				}
			}
			
			if( confirm("수정하시겠습니까?") ) {
				$("#updateForm").submit();
			}
		});

		$("#delBtn").click(function(){
			if( confirm("삭제하시겠습니까?") ) {
				window.location.href = "${ contextPath }/display/main/delete.do?display_id=" + ${ displayInfo.DISPLAY_ID };
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

		