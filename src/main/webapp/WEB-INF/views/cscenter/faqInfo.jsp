<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
				<a href="#">FAQ 관리</a>
				<span class="divider">
					<i class="icon-angle-right arrow-icon"></i>
				</span>
			</li>
			<li class="active">
				<c:if test="true">
					FAQ 상세
				</c:if>
				<c:if test="true">
					FAQ 등록
				</c:if>
			</li>
		</ul>
		<div class="nav-search" id="nav-search">
			<form class="form-search" action="manage.do" method="post">
				<span class="input-icon">
					<input type="text" name="search" placeholder="Search ..." class="input-small nav-search-input" autocomplete="off"  value="${search }" />
					<i class="icon-search nav-search-icon"></i>
				</span>
			</form>
		</div><!--#nav-search-->
	</div><!--.breadcrumb-->
	
	<div class="page-content">
		<div class="row-fluid">
			<c:if test="true">
				<h3 class="header smaller lighter blue">FAQ 상세</h3>
			</c:if>
			<c:if test="true">
				<h3 class="header smaller lighter blue">FAQ 등록</h3>
			</c:if>
			<!-- /. table-header -->
			
		<div class="row-fluid">
			<div class="span12 form-horizontal">
			
						<form id="create-form" method="get" class="form-horizontal" >
							<div class="control-group">
								<label class="control-label">제목</label>
								<div class="controls">
									<input type="text" name="" value="" style="width:80%">
								</div>
							</div>
							<div class="control-group">
								<label class="control-label">카테고리</label>
								<div class="controls">
									<select>
									  <option>1</option>
									  <option>2</option>
									  <option>3</option>
									  <option>4</option>
									  <option>5</option>
									</select>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label">내용</label>
								<div class="controls">
									<textarea rows="5" cols="50" style="width:80%;"></textarea>
								</div>
							</div>
							
							<div class="form-actions">
								<c:if test="true">
									<button class="btn btn-danger" type="submit" id="delete-btn">
										<i class="icon-trash bigger-110"></i>
										삭제
									</button>
								</c:if>
								<button class="btn btn-primary" type="submit" id="modify-btn">
									<i class="icon-wrench bigger-110"></i>
									확인
								</button>
								<a class="btn btn-inverse" id="cancel-btn">
									<i class="icon-undo bigger-110"></i>
									취소
								</a>
							</div>
						</form>
			</div>
		</div>
						
		</div>
	</div>
	
</div>

<script type="text/javascript">

//side active
$("#side-cscenter").addClass("open active");
	$("#side-cscenter-faq").addClass("active");

</script>