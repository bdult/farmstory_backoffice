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
				<a href="${ contextPath }/display/main/create.do" class="btn btn-success">등록</a>
			</div><!-- /. table-header -->
			<table class="table table-striped table-bordered table-hover">

				<tbody>
					<tr>
						<td>
							메인 1
						</td>
						<td>
							ABC 픽쳐북
						</td>
						<td>
							<div class="radio-inline">
								<label>
									<input name="form-field-radio" type="radio" class="ace">
									<span class="lbl"> HTML </span>
									<input name="form-field-radio" type="radio" class="ace">
									<span class="lbl"> CSS </span>
								</label>
							</div>
						</td>
						<td>
							<button class="btn btn-minier btn-yellow">수정</button>
							<button class="btn btn-minier btn-yellow">삭제</button>
						</td>
					</tr>
					<tr>
						<td>
							메인 2
						</td>
						<td>
							피트 앤 바바
						</td>
						<td>
							<div class="radio-inline">
								<label>
									<input name="form-field-radio" type="radio" class="ace">
									<span class="lbl"> HTML </span>
									<input name="form-field-radio" type="radio" class="ace">
									<span class="lbl"> CSS </span>
								</label>
							</div>
						</td>
						<td>
							<button class="btn btn-minier btn-yellow">수정</button>
							<button class="btn btn-minier btn-yellow">삭제</button>
						</td>
					</tr>
					<tr>
						<td>
							메인 3
						</td>
						<td>
							디노 테일즈
						</td>
						<td>
							<div class="radio-inline">
								<label>
									<input name="form-field-radio" type="radio" class="ace">
									<span class="lbl"> HTML </span>
									<input name="form-field-radio" type="radio" class="ace">
									<span class="lbl"> CSS </span>
								</label>
							</div>
						</td>
						<td>
							<button class="btn btn-minier btn-yellow">수정</button>
							<button class="btn btn-minier btn-yellow">삭제</button>
						</td>
					</tr>
				</tbody>
			</table>
		</div><!--/.row-fluid-->
		
		<div class="row-fluid">
			<h3 class="header smaller lighter blue">배너 비주얼</h3>
			<div class="table-header" align="right">
				<button id="create-contents-btn" class="btn btn-success">등록</button>
			</div><!-- /. table-header -->
			<table class="table table-striped table-bordered table-hover">

				<tbody>
					<tr>
						<td rowspan="2">
							배너
						</td>
						<td>
							배너1
						</td>
						<td>
							<button class="btn btn-minier btn-yellow">수정</button>
							<button class="btn btn-minier btn-yellow">삭제</button>
						</td>
					</tr>
					<tr>
						<td>
							배너2
						</td>
						<td>
							<button class="btn btn-minier btn-yellow">수정</button>
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
});
</script>

		