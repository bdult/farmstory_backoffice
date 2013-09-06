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
									<label class="control-label" for="contents_nm">브랜드 명</label>

									<div class="controls">
										<input type="text" id="brand_nm" name="brand_nm" placeholder="브랜드 명" value="${data.BRAND_NM}" />
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
										<c:choose>
											<c:when test="${data.BRAND_DESC != null}">
												<textarea rows="20" class="autosize-transition span12" id="brand_desc" name="brand_desc">${data.BRAND_DESC }</textarea>
											</c:when>
											<c:otherwise>
												<textarea rows="20" class="autosize-transition span12" id="brand_desc" name="brand_desc" ></textarea>
											</c:otherwise>
										</c:choose>
									</div>
								</div>

								<div class="form-actions">
									<button class="btn btn-primary" type="submit">
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
			

<script type="text/javascript">
	$("#side-contents-brand").attr("class", "active");
	$("#side-contents").attr("class", "open active");

	$(function(){
		$("#cancel-btn").click(function(){
			window.location.href="manage.do";
		});
		
		$("#delete-btn").click(function(){
			$("#delete-form").submit();
		});
		
	}); // <!-- function() end 
	
	
</script>