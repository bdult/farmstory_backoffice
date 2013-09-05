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
							<a href="#">컨텐츠</a>

							<span class="divider">
								<i class="icon-angle-right arrow-icon"></i>
							</span>
						</li>
						<li class="active">컨텐츠 상세</li>
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

							<form id="create-form" method="post" action="${contextPath }/contents/create.do" class="form-horizontal" >
								<input type="hidden" name="mode" value="${mode}" />
								
								<div class="control-group">
									<label class="control-label" for="contents_id">컨텐츠 ID</label>

									<div class="controls">
										<input readonly="" type="text" id="contents_id" name="contents_id" value="${data.contents_id == null? "자동입력" : data.contents_id}" />
									</div>
								</div>

								<div class="control-group">
									<label class="control-label" for="contents_nm">컨텐츠 명</label>

									<div class="controls">
										<input type="text" id="form-field-1" id="contents_nm" name="contents_nm" placeholder="contents name" value="${data.contents_nm}"/>
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="contents_series_id">시리즈</label>

									<div class="controls">
										<input  type="hidden" id="contents_series_id" name="contents_series_id" />
										<input readonly="readonly" type="text" id="contents_series_nm" name="contents_series_nm" />
										<input  type="button" id="series-mod-btn" class="btn btn-primary" value="시리즈 설정" />
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="brand_id">브랜드</label>

									<div class="controls">
										<input type="hidden" id="brand_id" name="brand_id" />
										<input readonly="readonly" type="text" id="brand_nm" name="brand_nm" />
										<input  type="button" id="brand-mod-btn" class="btn btn-primary" value="브랜드 설정" />
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="src_path">동영상</label>

									<div class="controls">
										<input class="span1" type="text" id="src_path" name="src_path" placeholder="file name" />
										<input class="span11" type="text" id="src_path2" name="src_path2" placeholder="file path" />
										<div class="help-block" id="input-span-slider"></div>
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="form-field-2">썸네일 이미지</label>

									<div class="controls">
										<input class="span1" type="text" id="form-field-5" placeholder="file name" />
										<input class="span11" type="text" placeholder="file path" />
										<div class="help-block" id="input-span-slider"></div>
									</div>
								</div>

								

								<div class="form-actions">
									<button class="btn btn-info" type="button" id="btn_submit">
										<i class="icon-ok bigger-110"></i>
										등록
									</button>

									&nbsp; &nbsp; &nbsp;
									<button class="btn" type="reset">
										<i class="icon-undo bigger-110"></i>
										취소
									</button>
								</div>

								<div class="hr"></div>

								
							</form>

							<div class="hr hr-18 dotted hr-double"></div>
						</div><!--/.span-->
					</div><!--/.row-fluid-->
				</div><!--/.page-content-->
			</div><!--/.main-content-->

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

<div id="search-series-modal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
			<h3 class="text-center">시리즈 등록</h3>
		</div>
		<div class="modal-body ">
			<div  class="control-group">
				<label class="control-label">시리즈 명</label>
				<div class="controls">
					<input  id="search-series-name" name="series_nm" type="text">					
					<button id="search-series-btn" type="button" class="btn btn-primary">검색</button>
				</div>
			</div>
			<div class="control-group">
				<label class="control-label">시리즈 리스트</label>
				<div class="controls">
					<select id="series-select">
					</select>
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<button class="btn" data-dismiss="modal" aria-hidden="true">등록취소</button>
			<button type="button" id="submit-series" class="btn btn-primary">등록하기</button>
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

	$(function(){
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
			$("#series-select").empty();
			$("#search-series-modal").modal('toggle');
		});
		
		$("#search-series-btn").click(function(){
			$("#series-select").empty();
			$("#search-series-name").val("");
			param = {
					series_nm: $("#search-series-name").val()
			};
			$.ajax({
				url: "${contextPath}/series/search.ajax",
				type: 'POST',
				data:param,
				dataType: 'json',
				success : function(response) {
						$.each(response.data, function(index, data){
							displaySeriesName="";
							if(data.SERIES_LEVEL === 1){
								displaySeriesName = data.CONTENTS_SERIES_NM+"("+data.SERIES_LEVEL+"레벨"+")";
							}else{
								displaySeriesName = data.PARENT_NM+" >> "+data.CONTENTS_SERIES_NM+"("+data.SERIES_LEVEL+"-depth "+")";
							}
							$("#series-select").append("<option value=\""+data.CONTENTS_SERIES_ID+"\">"+displaySeriesName+"</option>")
						}); 
				},
				error: function(xhr, status, error) {
					console.log("error="+error);
				}
			}); // seriesList ajax end
		}); // <!-- series-mod-btn event end
		
		$("#submit-series").click(function(){
			$("#contents_series_nm").val($("#series-select option:selected").text());
			$("#contents_series_id").val($("#series-select option:selected").val());
			$("#search-series-modal").modal('toggle');
		});
		
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
		
		$("#btn_submit").click(function() {
			if(confirm('저장 하시겠습니까?')) {
				$("#create-form").submit();
			}
		});
	});
	
</script>