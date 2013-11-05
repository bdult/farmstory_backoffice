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
			<li class="active">메인화면 관리</li>
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
			<h3 class="header smaller lighter blue">상단 비주얼</h3>
			<div class="table-header" align="right">
				<a href="${ contextPath }/display/main/createView.do" class="btn btn-success">등록</a>
			</div><!-- /. table-header -->
			<table class="table table-striped table-bordered table-hover">

				<tbody>
					<c:forEach items="${ topDisplay }" var="obj" varStatus="status">
						<tr>
							<td>
								메인 ${ status.count }
							</td>
							<td>${ obj.TITLE }</td>
							<td>
								<div class="display_yn radio-inline" data-display-yn="${ obj.DISPLAY_YN }">
									<label>
										<input type="radio" class="ace" value="Y" disabled>
										<span class="lbl"> 노출함 </span>
										<input type="radio" class="ace" value="N" disabled>
										<span class="lbl"> 노출안함 </span>
									</label>
								</div>
							</td>
							<td>
								<a href="${ contextPath }/display/main/updateView.do?display_id=${ obj.DISPLAY_ID }" class="btn btn-minier btn-yellow">수정</a>
								<button data-display-id="${ obj.DISPLAY_ID }" id="mainDelBtn" class="btn btn-minier btn-yellow">삭제</button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div><!--/.row-fluid-->
		
		<div class="row-fluid">
			<h3 class="header smaller lighter blue">배너 비주얼</h3>
			<div class="table-header" align="right">
				<!-- 
				<a href="${ contextPath }/display/main/bannerCreateView.do" id="create-contents-btn" class="btn btn-success">등록</a>
				 -->
			</div><!-- /. table-header -->
			<table class="table table-striped table-bordered table-hover">

				<tbody>
					<tr>
						<td rowspan="2">
							배너
						</td>
						<td>
							${ bannerDisplay[0].TITLE }
						</td>
						<td>
							<a href="${ contextPath }/display/main/bannerUpdateView.do?display_id=${ bannerDisplay[0].DISPLAY_ID }" class="btn btn-minier btn-yellow">수정</a>
							<button class="btn btn-minier btn-yellow">삭제</button>
						</td>
					</tr>
					<tr>
						<td>
							${ bannerDisplay[1].TITLE }
						</td>
						<td>
							<a href="${ contextPath }/display/main/bannerUpdateView.do?display_id=${ bannerDisplay[1].DISPLAY_ID }" class="btn btn-minier btn-yellow">수정</a>
							<button class="btn btn-minier btn-yellow">삭제</button>
						</td>
					</tr>
				</tbody>
			</table>
		</div><!--/.row-fluid-->
	</div><!--/.page-content-->
</div>

<script>
$(function(){
	//사이드바 활성화
	$("#side-display-main").addClass("active");
	$("#side-display").addClass("open active");
	
	$("#mainDelBtn").click(function(){
		var $this = $(this);
		if( confirm("삭제하시겠습니까?") ) {
			window.location.href = "${ contextPath }/display/main/delete.do?display_id=" + $this.data("displayId");
		}
	});
	
	//노출 Y/N 체크 
	$("div.display_yn").each(function(){
		var $this = $(this);
		var displayYn = $this.data("displayYn");
		
		$this.find(":radio[value='" + displayYn + "']").prop("checked", true)

	});
	
});
</script>

		