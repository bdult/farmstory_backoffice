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
										<input type="text" id="contents_nm" name="contents_nm" value="${data.CONTENTS_NM == null? "컨텐츠 명" : data.CONTENTS_NM}" />
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="contents_series_id">시리즈 명</label>

									<div class="controls">
										<input  type="hidden" id="contents_series_id" name="contents_series_id" value="${data.CONTENTS_SERIES_ID }" />
										<input readonly="readonly" type="text" id="contents_series_nm" name="contents_series_nm" value="${data.SERIES_NM== null? "" : data.SERIES_NM}" />
										<input  type="button" id="series-mod-btn" class="btn btn-primary" value="시리즈 변경" />
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="brand_id">브랜드 명</label>

									<div class="controls">
										<input type="hidden" id="brand_id" name="brand_id" value="${data.BRAND_ID}" />
										<input readonly="readonly" type="text" id="brand_nm" name="brand_nm" value="${data.BRAND_NM== null? "" : data.BRAND_NM}" />
										<input  type="button" id="brand-mod-btn" class="btn btn-primary" value="브랜드 변경" />
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="src_path">동영상 경로</label>

									<div class="controls">
										<input readonly="readonly" class="span8" type="text" id="src_path" name="src_path" placeholder="/" />
										<div class="help-block" id="input-span-slider"></div>
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="form-field-2">썸네일 이미지 경로</label>

									<div class="controls">
										<input readonly="readonly" class="span8" type="text" id="img_path" name="img_path" value="${img_path }" />
										<div class="help-block" id="input-span-slider"></div>
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="form-field-2">컨텐츠 설명</label>

									<div class="controls">
										<textarea rows="20" class="autosize-transition span12" id="contents_desc" name="contents_desc">${data.CONTENTS_DESC }
										</textarea>
									</div>
								</div>
								
								<div class="form-actions">
									<button id="submit-btn" class="btn btn-primary" type="button">
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

$("#side-contents-contents").attr("class", "active");
$("#side-contents").attr("class", "open active");

	$(function(){
		$("#cancel-btn").click(function(){
			window.location.href="manage.do?pageNum=1";
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
						console.log("error="+error);
					}
				}); // ajax end
		});
		
		$("#brand-mod-btn").click(function(){
			$.ajax({
				url: "${contextPath}/brand/list.ajax",
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