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
									<label class="control-label" for="contents_nm">브랜드명 명</label>

									<div class="controls">
										<input type="text" id="brand_nm" name="brand_nm" value="${data.BRAND_NM == null? "컨텐츠 명" : data.BRAND_NM}" />
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="form-field-2">썸네일 이미지 경로</label>

									<div class="controls">
										<input readonly="readonly" class="span8" type="text" id="img_path" name="img_path" value="${data.IMG_PATH }" />
										<div class="help-block" id="input-span-slider"></div>
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="form-field-2">브랜드 설명</label>

									<div class="controls">
										<textarea rows="20" class="autosize-transition span12" id="brand_desc" name="brand_desc">${data.BRAND_DESC }
										</textarea>
									</div>
								</div>

								<div class="form-actions">
									<button class="btn btn-primary" type="submit">
										<i class="icon-ok bigger-110"></i>
										수정
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
			
<!-- series modify modal -->			
<div id="modify-series-modal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			<h3 class="text-center">시리즈 변경</h3>
		</div>
		<div class="modal-body">
			<div id="modify-series-list" class="control-group">
				<label class="control-label">시리즈 리스트</label>
				<div class="controls">
					<select id="modify-series-select">
					</select>
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn" data-dismiss="modal" aria-hidden="true">취소</button>
			<button id="modify-series-modal-btn" type="button" class="btn btn-primary">변경</button>
		</div>
</div>		

<!--  brand modify modal -->			
<div id="modify-brand-modal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			<h3 class="text-center">브랜드 변경</h3>
		</div>
		<div class="modal-body">
			<div id="modify-brand-list" class="control-group">
				<label class="control-label">브랜드 리스트</label>
				<div class="controls">
					<select id="modify-brand-select">
					</select>
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn" data-dismiss="modal" aria-hidden="true">취소</button>
			<button id="modify-brand-modal-btn" type="button" class="btn btn-primary">변경</button>
		</div>
</div>		
			

<script type="text/javascript">
	$("#side-contents-brand").attr("class", "active");
	$("#side-contents").attr("class", "open active");

	$(function(){
		$("#cancel-btn").click(function(){
			window.location.href="manage.do";
		});
		
		$("#delete-btn").click(function(){
			console.log("delete_btn");
			$("#delete-form").submit();
		});
		
		$("#modify-series-modal-btn").click(function(){
			$("#modify-parent-category-select")
				$("#contents_series_nm").val($("#modify-series-select option:selected").text());
				$("#contents_series_id").val($("#modify-series-select option:selected").val());
				$("#modify-series-modal").modal('toggle');
		});
		$("#modify-brand-modal-btn").click(function(){
			$("#modify-parent-category-select")
				$("#brand_nm").val($("#modify-brand-select option:selected").text());
				$("#brand_id").val($("#modify-brand-select option:selected").val());
				$("#modify-brand-modal").modal('toggle');
		});
		
		$("#series-mod-btn").click(function(){
			$.ajax({
				url: "seriesList.ajax",
				type: 'GET',
				dataType: 'json',
				success : function(response) {
						$.each(response.data, function(index, data){
							$("#modify-series-select").append("<option value=\""+data.CONTENTS_SERIES_ID+"\">"+data.CONTENTS_SERIES_NM+"</option>")
						}); 
					$("#modify-series-modal").modal('toggle');
				},
				error: function(xhr, status, error) {
					console.log("error="+error);
				}
			}); // seriesList ajax end
		}); // <!-- series-mod-btn event end
		
		$("#brand-mod-btn").click(function(){
			$.ajax({
				url: "../brand/list.ajax",
				type: 'GET',
				dataType: 'json',
				success : function(response) {
						$.each(response.data, function(index, data){
							$("#modify-brand-select").append("<option value=\""+data.BRAND_ID+"\">"+data.BRAND_NM+"</option>")
						}); 
						$("#modify-brand-modal").modal('toggle');
				},
				error: function(xhr, status, error) {
					console.log("error="+error);
				}
			}); // ajax end
		}); // <!-- brand-mod-btn event end
		
	}); // <!-- function() end 
	
	
</script>