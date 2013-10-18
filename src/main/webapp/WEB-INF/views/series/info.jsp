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
							시리즈
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
							시리즈 상세
							<small>
								<i class="icon-double-angle-right"></i>
								시리즈에 대한 상세한 정보를 입력한다
							</small>
						</h1>
					</div><!--/.page-header-->

					<div class="row-fluid">
						<div class="span12">
							<!--PAGE CONTENT BEGINS-->

							<form id="modify-form" method="post" action="${contextPath }/series/modify.do" class="form-horizontal" >
								<input type="hidden" name="mode" value="${mode}" />
								
								<div class="control-group">
									<label class="control-label" for="contents_series_id">시리즈 ID</label>

									<div class="controls">
										<input readonly="readonly" type="text" id="series_id" name="series_id" value="${data.CONTENTS_SERIES_ID}" />
									</div>
								</div>

								<div class="control-group">
									<label class="control-label" for="series_nm">시리즈 명</label>

									<div class="controls">
										<input type="text" id="series_nm" name="series_nm" placeholder="시리즈 명" value="${data.CONTENTS_SERIES_NM}" />
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="contents_nm">출판사 명</label>

									<div class="controls">
										<input  type="hidden" id="brand_id" name="brand_id" value="${data.BRAND_ID == null? 0 : data.BRAND_ID}" />
										<input readonly="readonly" type="text" id="brand_nm" placeholder="출판사 명" name="brand_nm" value="${data.BRAND_NM}" />
										<input  type="button" id="brand-mod-btn" class="btn btn-primary" value="출판사 변경" />
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="form-field-2">썸네일 이미지</label>
									<div class="controls">
										<input readonly="readonly" class="span5" type="text" id="img_path" name="img_path" value="${data.IMG_PATH }" />
										<input  type="button" id="thumbnail-mod-btn" class="btn btn-primary" value="썸네일 변경" />
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="contents_nm">시리즈 설명</label>

									<div class="controls">
										<c:choose>
											<c:when test="${data.SERIES_DESC != null}">
												<textarea rows="20" class="autosize-transition span12" id="series_desc" name="series_desc">${data.SERIES_DESC }</textarea>
											</c:when>
											<c:otherwise>
												<textarea rows="20" class="autosize-transition span12" id="series_desc" name="series_desc" ></textarea>
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
	<input type="hidden" name="series_id" value="${data.CONTENTS_SERIES_ID }">
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

<div id="modify-brand-modal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			<h3 class="text-center">출판사 설정</h3>
		</div>
		<div class="modal-body">
			<div  class="control-group row-fluid">
				<label class="control-label ">출판사 명</label>
				<div class="controls">
					<input  id="modify-brand-name" name="brand_nm" type="text">					
					<button id="modify-brand-search-btn" type="button" class="btn btn-primary">검색</button>
				</div>
			</div>
			<div class="control-group" id="brand-modal-list">
				<label class="control-label">출판사 리스트</label>
				<div class="controls">
					<select id="modify-brand-select">
					</select>
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn" data-dismiss="modal" aria-hidden="true">취소</button>
			<button id="modify-brand-submit-btn" type="button" class="btn btn-primary">등록</button>
		</div>
</div>		

<script type="text/javascript">

	$("#side-contents-series").attr("class", "active");
	$("#side-contents").attr("class", "open active");
	
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
		
		$("#brand-mod-btn").click(function(){
			$("#brand-modal-list").hide();
			$("#modify-brand-modal").modal('toggle');
		}); // <!-- thumbnaul-mod-btn event end
		
		$("#modify-brand-search-btn").click(function(){
			$("#modify-series-select").empty();
				param = {
						search : $("#modify-brand-name").val()
				};
				
				$.ajax({
					url: "${contextPath}/brand/list.ajax",
					data: param,
					type: 'POST',
					dataType: 'json',
					success : function(response) {
						if(response.data.length == 0){
							alert("검색된 출판사가 없습니다.");
							return false;
						}else{
							$.each(response.data, function(index, brand){
								$("#modify-brand-select").append("<option value=\""+brand.BRAND_ID+"\">"+brand.BRAND_NM+"</option>")
							});
							$("#brand-modal-list").show();
						}
					},
					error: function(xhr, status, error) {
						console.log("error="+error);
					}
				}); // ajax end
		});
		
		$("#modify-brand-submit-btn").click(function(){
			$("#brand_nm").val($("#modify-brand-select option:selected").text());
			$("#brand_id").val($("#modify-brand-select option:selected").val());
			$("#modify-brand-modal").modal('toggle');
	});
		
		
	}); // <!-- function() end 
	
</script>