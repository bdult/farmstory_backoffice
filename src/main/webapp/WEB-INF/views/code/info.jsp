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
							코드 관리
							<span class="divider">
								<i class="icon-angle-right arrow-icon"></i>
							</span>
						</li>
						<li class="active">${viewName}</li>
					</ul><!--.breadcrumb-->
				</div>

				<div class="page-content">
					<div class="page-header position-relative">
						<h1>
							${viewName}
							<small>
								<i class="icon-double-angle-right"></i>
								${viewDesc}
							</small>
						</h1>
					</div><!--/.page-header-->

					<div class="row-fluid">
						<div class="span12">
							<!--PAGE CONTENT BEGINS-->

							<form id="modify-form" method="post" action="${contextPath }/code/modify.do" class="form-horizontal" >
								<input type="hidden" name="pageNum" value="${pageNum}" />
								<div class="control-group">
									<label class="control-label" for="code_idx">코드 IDX</label>

									<div class="controls">
										<input readonly="readonly" type="text" id="idx" name="idx" value="${data.IDX}" />
									</div>
								</div>

								<div class="control-group">
									<label class="control-label" for="code">코드</label>

									<div class="controls">
										<input type="text" id="code" name="code" value="${data.CODE == null? "" : data.CODE}" />
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="code_detail">코드 설명</label>

									<div class="controls">
										<input type="text" id="code_detail" name="code_detail" value="${data.CODE_DETAIL== null? "" : data.CODE_DETAIL}" />
									</div>
								</div>
								
								<div class="control-group">
									<label class="control-label" for="PARENT_CODE">상위 코드</label>

									<div class="controls">
										<input type="text" id="code_detail" name="code_detail" value="${data.PARENT_CODE== null? "" : data.PARENT_CODE}" />
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
								<c:if test="${data.IDX != null}">
									&nbsp; &nbsp; &nbsp;
									<button id="delete-btn" class="btn btn-danger" type="button">
										<i class="icon-remove-sign bigger-110"></i>
										삭제
									</button>
								</c:if>
								</div>								
							</form>
						</div><!--/.span-->
					</div><!--/.row-fluid-->
				</div><!--/.page-content-->
			</div><!--/.main-content-->
			
			<form id="delete-form" method="post" action="delete.do">
				<input type="hidden" name="idx" value="${data.IDX }">
			</form>
			

<script type="text/javascript">

	$("#side-code-code").attr("class", "active");

	$(function(){
		$("#cancel-btn").click(function(){
			window.location.href="manage.do?pageNum=${pageNum}";
		});
		
		$("#delete-btn").click(function(){
			if(confirm("하위 코드도 삭제 됩니다. 삭제 하시겠습니까?")){
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
		
		
	}); // <!-- function() end 
	
	
</script>