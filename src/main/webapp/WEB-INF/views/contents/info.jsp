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
							컨텐츠
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
							컨텐츠 상세
							<small>
								<i class="icon-double-angle-right"></i>
								컨텐츠에 대한 상세한 정보를 입력한다
							</small>
						</h1>
					</div><!--/.page-header-->

					<div class="row-fluid">
						<div class="span12">
							<!--PAGE CONTENT BEGINS-->

							<form id="modify-form" method="post" action="${contextPath }/contents/modify.do" class="form-horizontal" >
								<input type="hidden" name="mode" value="${mode}" />
								
								<div class="control-group">
									<label class="control-label" for="contents_id">컨텐츠 ID</label>

									<div class="controls">
										<input readonly="readonly" type="text" id="contents_id" name="contents_id" value="${data.CONTENTS_ID}" />
									</div>
								</div>

								<div class="control-group">
									<label class="control-label" for="contents_nm">컨텐츠 명</label>

									<div class="controls">
										<input type="text" id="contents_nm" name="contents_nm" placeholder="컨텐츠 명" value="${data.CONTENTS_NM}" />
									</div>
								</div>
								
								<!-- 
								<div class="control-group">
									<label class="control-label" for="contents_nm">시리얼 번호</label>
									<div class="controls">
										<input type="text" id="serial_num" name="serial_num" placeholder="시리얼 번호" value="${data.SERIAL_NUM}" />
									</div>
								</div>
								 -->
								
								<div class="control-group">
									<label class="control-label" for="contents_series_id">시리즈 명</label>

									<div class="controls">
										<input  type="hidden" id="contents_series_id" name="contents_series_id" value="${data.CONTENTS_SERIES_ID == null? 0 : data.CONTENTS_SERIES_ID}" />
										<input readonly="readonly" type="text" id="contents_series_nm" name="contents_series_nm" value="${data.SERIES_NM}" />
										<input  type="button" id="series-mod-btn" class="btn btn-primary" value="시리즈 변경" />
									</div>
								</div>
								
								<!-- 
								<div class="control-group">
									<label class="control-label" for="contents_series_id">카테고리</label>

									<div class="controls">
										<c:forEach items="${categoryList }" var="cate">
										<input  type="hidden" id="cate_id" name="cate_id" value="${cate.CATE_ID}" />
										<input readonly="readonly" type="text" id="contents_series_nm" name="contents_series_nm" value="${data.SERIES_NM}" />
										<input  type="button" id="series-mod-btn" class="btn btn-primary" value="시리즈 변경" />
										</c:forEach>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label" for="brand_id">출판사 명</label>

									<div class="controls">
										<input type="hidden" id="brand_id" name="brand_id" value="${data.BRAND_ID == null? 0 : data.BRAND_ID}" />
										<input readonly="readonly" type="text" id="brand_nm" name="brand_nm" value="${data.BRAND_NM}" />
										<input  type="button" id="brand-mod-btn" class="btn btn-primary" value="출판사 변경" />
									</div>
								</div>
								 -->
								
								<div class="control-group">
									<label class="control-label" for="src_path">동영상</label>
									<div class="controls">
										<input readonly="readonly" class="span5" type="text" id="src_path" name="src_path" value="${data.SRC_PATH }" />
										<input  type="button" id="movie-mod-btn" class="btn btn-primary" value="동영상 변경" />
										<div class="help-block" id="input-span-slider"></div>
									</div>
								</div>
								<!-- 
								<div class="control-group">
									<label class="control-label" for="src_path">동영상 Player</label>
									<div class="controls">
										<input readonly="readonly" class="span8" type="text" id="player_type" name="player_type" placeholder="/" value="${data.PLAYER_TYPE }" />
										<div class="help-block" id="input-span-slider"></div>
									</div>
								</div>
								 -->
								
								<div class="control-group">
									<label class="control-label" for="form-field-2">썸네일 이미지</label>
									<div class="controls">
										<input readonly="readonly" class="span5" type="text" id="img_path" name="img_path" value="${data.IMG_PATH }" />
										<input  type="button" id="thumbnail-mod-btn" class="btn btn-primary" value="썸네일 변경" />
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="form-field-2">카테고리 </label>
									<div class="controls">
										<div id="contents-cate-list">
										<c:forEach items="${contentsCateList }" var="contentsCate">
										<input readonly="readonly" class="span1" type="text" value="${contentsCate.CATE_NM }" />
										</c:forEach>
										</div>
										<input  type="button" id="category-mod-btn" class="btn btn-primary" value="카테고리 변경" />
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="form-field-2">컨텐츠 설명</label>

									<div class="controls">
										<c:choose>
											<c:when test="${data.CONTENTS_DESC != null}">
												<textarea rows="20" class="autosize-transition span12" id="contents_desc" name="contents_desc">${data.CONTENTS_DESC }</textarea>
											</c:when>
											<c:otherwise>
												<textarea rows="20" class="autosize-transition span12" id="contents_desc" name="contents_desc" ></textarea>
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
	<input type="hidden" name="contents_id" value="${data.CONTENTS_ID }">
</form>
			

<div id="modify-series-modal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			<h3 class="text-center">시리즈 설정</h3>
		</div>
		<div class="modal-body">
			<div  class="control-group row-fluid">
				<label class="control-label ">시리즈 명</label>
				<div class="controls">
					<input  id="modify-series-name" name="parent_series_nm" type="text">					
					<button id="modify-series-search-btn" type="button" class="btn btn-primary">검색</button>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">시리즈 리스트</label>
				<div class="controls">
					<select id="modify-series-select">
					</select>
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn" data-dismiss="modal" aria-hidden="true">취소</button>
			<button id="modify-series-submit-btn" type="button" class="btn btn-primary">등록</button>
		</div>
</div>		

<!--  movie modal -->			
<div id="movie-modal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<form action="movie-upload.do" id="movie-upload-form"  method="POST" enctype="multipart/form-data">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			<h3 class="text-center">동영상 업로드</h3>
		</div>
		<div class="modal-body">
				<input type="file" id="movie-upload-input" name="file" />
		</div>
		<div id="movie-modal-footer" class="modal-footer">
			<button type="submit" id="movie-upload-submit" class="btn btn-sm btn-success">
				업로드 <i class="icon-arrow-right icon-on-right bigger-110"></i>
			</button>
		</div>
	</form>
    <div id="upload-bar" class="progress">
        <div class="bar"></div >
        <div class="percent">0%</div >
    </div>
</div>

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

<!--  category tag modal -->
<div id="category-tag-modal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			<h3 class="text-center">카테고리 변경</h3>
		</div>
		<div class="modal-body">
			<div>
				<select name="cate_id" id="contents-cate-select" class="form-control">
						<option>카테고리 선택</option>
					<c:forEach items="${cateList }" var="cate">
						<option value="${cate.CATE_ID }">${cate.name }</option>
					</c:forEach>
				</select>
				<button type="button" id="add-category-btn" class="btn btn-sm btn-success">추가</button>
			</div>
			<div>
				<ul id="add-category-list">
					<c:forEach items="${contentsCateList }" var="contentsCate">
						<li>${contentsCate.CATE_NM }&nbsp;&nbsp;<button type="button" value="${contentsCate.CATE_ID }" class="btn btn-sm btn-danger delete-category-btn">삭제</button></li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<div id="thumbnail-modal-footer" class="modal-footer">
			<button type="submit" class="btn btn-sm btn-primary" data-dismiss="modal" aria-hidden="true">
			완료
			</button>
			
		</div>
</div>
<!-- 
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			<h3 class="text-center">동영상 변경</h3>
		</div>
		<div class="modal-body">
			<form action="//dummy.html" class="dropzone dz-clickable">
				<div class="dz-default dz-message">
					<span>
						<span class="bigger-150 bolder">
							<i class="icon-caret-right red"></i> Drop files
						</span> to upload 				
						<span class="smaller-80 grey">(or click)</span> 
						<br> 				
						<i class="upload-icon icon-cloud-upload blue icon-3x"></i>
					</span>
				</div>
			</form>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn" data-dismiss="modal" aria-hidden="true">취소</button>
			<button id="modify-brand-modal-btn" type="button" class="btn btn-primary">변경</button>
		</div>
 -->

<script type="text/javascript">

	$("#side-contents-contents").attr("class", "active");
	$("#side-contents").attr("class", "open active");
	
	$(document).on('click', '.delete-category-btn', function(){
		$eventTag = $(this); 
	    param = {
	    		contents_id : "${data.CONTENTS_ID}",
				cate_id : $eventTag.attr('value')
			};
			
			$.ajax({
				url: "deleteContentsCate.ajax",
				data: param,
				type: 'POST',
				dataType: 'json',
				success : function(response) {
					contentsCateList();
					$eventTag.parent().remove();
				},
				error: function(xhr, status, error) {
					alert("error="+error);
				}
			}); // ajax end
	});

	$(function(){
		
		$('#movie-upload-input').ace_file_input({
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
			$("#movie-modal-footer").show();
		});
		
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
		
		var bar = $('.bar');
		var percent = $('.percent');
		var status = $('#status');
		$('#movie-upload-form').ajaxForm(
				 {
					 beforeSend: function() {
							
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
				      $("#src_path").val(response);
				      $("#movie-modal").modal('toggle');
					}
				 }
		 );
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
		
		$("#modify-series-submit-btn").click(function(){
				$("#contents_series_nm").val($("#modify-series-select option:selected").text());
				$("#contents_series_id").val($("#modify-series-select option:selected").val());
				$("#thumbnail-series-id").val($("#modify-series-select option:selected").val());
				$("#movie-series-id").val($("#modify-series-select option:selected").val());
				$("#modify-series-modal").modal('toggle');
		});
		
		$("#modify-brand-modal-btn").click(function(){
			$("#modify-parent-category-select")
				$("#brand_nm").val($("#modify-brand-select option:selected").text());
				$("#brand_id").val($("#modify-brand-select option:selected").val());
				$("#modify-brand-modal").modal('toggle');
		});
		
		$("#series-mod-btn").click(function(){
			$("#modify-series-modal").modal('toggle');
		}); // <!-- series-mod-btn event end
		
		$("#modify-series-search-btn").click(function(){
			$("#modify-series-select").empty();
				param = {
					search_name : $("#modify-series-name").val()
				};
				
				$.ajax({
					url: "${contextPath}/series/parentSeriesList.ajax",
					data: param,
					type: 'POST',
					dataType: 'json',
					success : function(response) {
						if(response.data.length == 0){
							alert("검색된 시리즈가 없습니다.");
							return false;
						}else{
							$("#modify-series-list").show();
							$.each(response.data, function(index, series){
								displaySeriesName="";
								if(series.SERIES_LEVEL === 1){
									displaySeriesName = series.CONTENTS_SERIES_NM+"("+series.SERIES_LEVEL+"-depth"+")";
								}else{
									displaySeriesName = series.PARENT_NM+" >> "+series.CONTENTS_SERIES_NM+"("+series.SERIES_LEVEL+"-depth "+")";
								}
								$("#modify-series-select").append("<option value=\""+series.CONTENTS_SERIES_ID+"\">"+displaySeriesName+"</option>")
							});
						}
					},
					error: function(xhr, status, error) {
						alert("error="+error);
					}
				}); // ajax end
		});
		
		$("#movie-mod-btn").click(function(){
			$("#movie-modal-footer").hide();
			$("#upload-bar").hide();
			$("#movie-modal").modal('toggle');
		}); // <!-- brand-mod-btn event end
		
		$("#thumbnail-mod-btn").click(function(){
			$("#thumbnail-modal-footer").hide();
			$("#thumbnail-modal").modal('toggle');
		}); // <!-- brand-mod-btn event end
		
		$("#category-mod-btn").click(function(){
			$("#category-tag-modal").modal('toggle');
			
		}); // <!-- brand-mod-btn event end
		
		$("#add-category-btn").click(function(){
			param = {
					contents_id : "${data.CONTENTS_ID}",
					cate_id : $("select[name=cate_id]").val()
				};
				
				$.ajax({
					url: "addContentsCate.ajax",
					data: param,
					type: 'POST',
					dataType: 'json',
					success : function(response) {
						contentsCateListForModal();						
						contentsCateList();
					},
					error: function(xhr, status, error) {
						alert("error="+error);
					}
				}); // ajax end
		}); // <!-- brand-mod-btn event end
		
		
		
	}); // <!-- function() end 
	
	function contentsCateListForModal(){
			param = {
					contents_id : "${data.CONTENTS_ID}"
				};
				
				$.ajax({
					url: "contentsCate.ajax",
					data: param,
					type: 'POST',
					dataType: 'json',
					success : function(response) {
						$("#add-category-list").empty();
						$.each(response.data, function(key, value){
							$("#add-category-list").append('<li>'+value.CATE_NM+'&nbsp;&nbsp;<button type="button" value="'+value.CATE_ID+'" class="btn btn-sm btn-danger delete-category-btn">삭제</button></li>\n');
							}
						);
					},
					error: function(xhr, status, error) {
						alert("error="+error);
					}
				}); // ajax end
		
	}
	function contentsCateList(){
			param = {
					contents_id : "${data.CONTENTS_ID}"
				};
				
				$.ajax({
					url: "contentsCate.ajax",
					data: param,
					type: 'POST',
					dataType: 'json',
					success : function(response) {
						$("#contents-cate-list").empty();
						$.each(response.data, function(key, value){
								$("#contents-cate-list").append('<input readonly="readonly" class="span1" type="text" value="'+value.CATE_NM+'" />\n');
							}
						);
					},
					error: function(xhr, status, error) {
						alert("error="+error);
					}
				}); // ajax end
		
	}
	
</script>