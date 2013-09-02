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

							<form name="frm" method="post" action="${contextPath }/contents/modify.do" class="form-horizontal" >
								<input type="hidden" name="mode" value="${mode}" />
								
								<div class="control-group">
									<label class="control-label" for="contents_id">컨텐츠 ID</label>

									<div class="controls">
										<input readonly="readonly" type="text" id="contents_id" name="contents_id" value="${data.CONTENTS_ID == null? "자동입력" : data.CONTENTS_ID}" />
									</div>
								</div>

								<div class="control-group">
									<label class="control-label" for="contents_nm">컨텐츠 명</label>

									<div class="controls">
										<input type="text" id="contents_nm" name="contents_nm" value="${data.CONTENTS_NM == null? "컨텐츠 명" : data.CONTENTS_NM}" />
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="form-field-2">STATUS</label>

									<div class="controls">
										<select id="contents_status" name="status">
											<option value="0">사용</option>
											<option value="1">사용않함</option>
										</select>
										<span class="help-button" data-rel="popover" data-trigger="hover" data-placement="left" data-content="More details." title="Popover on hover">?</span>
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="contents_series_id">시리즈 명</label>

									<div class="controls">
										<input  type="hidden" id="series-id" name="series_id" class="btn btn-primary" value="${data.SERIES_ID }" />
										<input readonly="readonly" type="text" id="contents_series_nm" name="contents_series_nm" value="${data.SERIES_NM== null? "" : data.SERIES_NM}" />
										<input  type="button" id="series-mod-btn" class="btn btn-primary" value="시리즈 변경" />
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="brand_id">브랜드 명</label>

									<div class="controls">
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
										<input readonly="readonly" class="span8" type="text" id="img_path" name="img_path" placeholder="/" />
										<div class="help-block" id="input-span-slider"></div>
									</div>
								</div>
<!-- 
								<div class="control-group">
									<label class="control-label" for="form-input-readonly">등록정보</label>

									<div class="controls">
										<span class="input-icon">
											<input readonly="" type="text" id="form-input-readonly" value="자동생성" />
											<i class="icon-leaf"></i>
										</span>

										<span class="input-icon input-icon-right">
											<input readonly="" type="text" id="form-input-readonly" value="자동생성" />
											<i class="icon-leaf"></i>
										</span>
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="form-input-readonly">수정정보</label>

									<div class="controls">
										<span class="input-icon">
											<input readonly="" type="text" id="form-input-readonly" value="자동생성" />
											<i class="icon-leaf"></i>
										</span>

										<span class="input-icon input-icon-right">
											<input readonly="" type="text" id="form-input-readonly" value="자동생성" />
											<i class="icon-leaf"></i>
										</span>
									</div>
								</div>
 -->

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

								<div class="hr"></div>

								
							</form>

							<div class="hr hr-18 dotted hr-double"></div>
						</div><!--/.span-->
					</div><!--/.row-fluid-->
				</div><!--/.page-content-->
			</div><!--/.main-content-->
			
			<form id="delete-form" method="post" action="delete.do">
				<input name="contents_id" value="${data.contents_id }">
			</form>
			
<!-- category modify modal -->			
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
			<div id="modify-parent-category-list" class="control-group">
				<label class="control-label">브랜드 리스트</label>
				<div class="controls">
					<select id="modify-parent-category-select">
					</select>
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn" data-dismiss="modal" aria-hidden="true">취소</button>
			<button id="modify-parent-category-modify-btn" type="button" class="btn btn-primary">변경</button>
		</div>
</div>		
			

<script type="text/javascript">
	$(function(){
		$("#cancel-btn").click(function(){
			window.location.href="manage.do";
		});
		
		$("#delete-btn").click(function(){
			console.log("delete_btn");
			$("#delete-form").submit();
		});
		
		$("#brand-mod-btn").click(function(){
			$("#modify-brand-modal").modal('toggle');
		});
		
		
		$("#modify-series-modal-btn").click(function(){
			$("#modify-parent-category-select")
				console.log($("#modify-series-select option:selected").text());
				console.log($("#modify-series-select option:selected").val());
				$("#contents_series_nm").val($("#modify-series-select option:selected").text());
				$("#series-id").val($("#modify-series-select option:selected").val());
				$("#modify-series-modal").modal('toggle');
		});
		
		$("#series-mod-btn").click(function(){
			$.ajax({
				url: "seriesList.ajax",
				type: 'GET',
				dataType: 'json',
				success : function(response) {
						$.each(response.data, function(index, data){
						console.log(data);
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
						console.log(data);
//							$("#modify-series-select").append("<option value=\""+data.CONTENTS_SERIES_ID+"\">"+data.CONTENTS_SERIES_NM+"</option>")
						}); 
//					$("#modify-series-modal").modal('toggle');
				},
				error: function(xhr, status, error) {
					console.log("error="+error);
				}
			}); // ajax end
		}); // <!-- series-mod-btn event end
		
	}); // <!-- function() end 
	
	
</script>