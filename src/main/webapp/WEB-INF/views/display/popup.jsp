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
			<li class="active">팝업관리</li>
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
			<h3 class="header smaller lighter blue">팝업관리</h3>
			<div class="table-header">
				<div class="text-right">
					<a href="${ contextPath }/display/popup/createView.do" class="btn btn-success">등록</a>
				</div>
			</div><!-- /. table-header -->
			<table class="table table-striped table-bordered table-hover">

				<tbody>
					<c:forEach items="${ popupList }" var="obj" varStatus="util">
						<tr>
							<td>
								${ util.count }
							</td>
							<td>${ obj.TITLE }</td>
							<td>
								<div class="display-yn radio-inline" data-display-yn="${ obj.DISPLAY_YN }">
									<label>
										<input type="radio" name="display_yn${ util.count }" class="ace" value="Y">
										<span class="lbl"> 노출중 </span>
										<input type="radio" name="display_yn${ util.count }" class="ace" value="N">
										<span class="lbl"> 노출안함 </span>
									</label>
								</div>
							</td>
							<td>
								<a href="${ contextPath }/display/popup/updateView.do?popup_id=${ obj.DISPLAY_ID }" class="btn btn-minier btn-yellow">수정</a>
								<button class="popupDeleteBtn btn btn-minier btn-yellow" data-display-id="${ obj.DISPLAY_ID }">삭제</button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div><!--/.row-fluid-->
	</div><!--/.page-content-->
</div>

<script>
$(function(){
	//사이드바 활성화
	$("#side-display-popup").addClass("active");
	$("#side-display").addClass("open active");
	
	//노출 Y/N 체크 
	$("div.display-yn").each(function(){
		var $this = $(this);
		var displayYn = $this.data("displayYn");
		
		$this.find(":radio[value='" + displayYn + "']").prop("checked", true)

	});
	
	$("button.popupDeleteBtn").click(function(){
		var $this = $(this);
		if( confirm("삭제하시겠습니까?") ) {
			window.location.href = "${ contextPath }/display/popup/delete.do?display_id=" + $this.data("displayId");
		}
	});
});
</script>

		