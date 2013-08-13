<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>

</style>
<div class="main-content">
	<div class="breadcrumbs" id="breadcrumbs">
		<ul class="breadcrumb">
			<li><i class="icon-home home-icon"></i> <a href="#">Home</a> <span
				class="divider"> <i class="icon-angle-right arrow-icon"></i>
			</span></li>
			<li class="active">
			<c:if test="${ type == 'create' }">create</c:if>
			<c:if test="${ type == 'edit' }">edit</c:if>
			</li>
		</ul>
		<!--.breadcrumb-->

		<div class="nav-search" id="nav-search">
			<form class="form-search">
				<span class="input-icon"> <input type="text"
					placeholder="Search ..." class="input-small nav-search-input"
					id="nav-search-input" autocomplete="off" /> <i
					class="icon-search nav-search-icon"></i>
				</span>
			</form>
		</div>
		<!--#nav-search-->
	</div>

	<div class="page-content">
		<div class="page-header position-relative">
			<h1>
				<c:if test="${ type == 'create' }">UserCreate</c:if>
				<c:if test="${ type == 'edit' }">UserEdit</c:if>
				<small> <i class="icon-double-angle-right"></i>
					overview &amp; stats
				</small>
			</h1>
		</div>
		<!--/.page-header-->

		<div class="span12">
			<table id="user-table"
				class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th>ID</th>
						<th>NAME</th>
						<th>PASSWORD</th>
						<th>ROLE</th>
						<th>STATUS</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${ type == 'create' }">
						<tr>
							<form method="post" action="/storyfarm-admin/usercreate.do">
								<td><input type="text" name="id" value=""></td>
								<td><input type="text" name="name" value=""></td>
								<td><input type="text" name="pwd" value=""></td>
								<td><input type="text" name="role" value=""></td>
								<td>
									<div id="btnAdd" class="hidden-phone visible-desktop btn-group">

										<button class="btn btn-mini btn-success">
											<i class="icon-ok bigger-120"></i>
										</button>
									</div>
							</form>
							</td>
						</tr>
					</c:if>

					<c:if test="${ type == 'edit' }">
						<tr>
							<form method="get" action="/storyfarm-admin/userupdate.do">
								<td><input type="text" name="id" value="${userListOne.MEMBER_ID}"></td>
								<td><input type="text" name="name" value="${userListOne.MEMBER_NM}"></td>
								<td><input type="text" name="pwd" value="${userListOne.MEMBER_PW}"></td>
								<td><input type="text" name="role" value="${userListOne.MEMBER_ROLE}"></td>
								<td>
									<div id="btnAdd" class="hidden-phone visible-desktop btn-group">

										<button class="btn btn-mini btn-success">
											<i class="icon-ok bigger-120"></i>
										</button>
									</div>
							</form>
							</td>
						</tr>
					</c:if>
				</tbody>
			</table>
		</div>


	</div>
	<!--/.page-content-->

	<div class="ace-settings-container" id="ace-settings-container">
		<div class="btn btn-app btn-mini btn-warning ace-settings-btn"
			id="ace-settings-btn">
			<i class="icon-cog bigger-150"></i>
		</div>

		<div class="ace-settings-box" id="ace-settings-box">
			<div>
				<div class="pull-left">
					<select id="skin-colorpicker" class="hide">
						<option data-class="default" value="#438EB9">#438EB9</option>
						<option data-class="skin-1" value="#222A2D">#222A2D</option>
						<option data-class="skin-2" value="#C6487E">#C6487E</option>
						<option data-class="skin-3" value="#D0D0D0">#D0D0D0</option>
					</select>
				</div>
				<span>&nbsp; Choose Skin</span>
			</div>

			<div>
				<input type="checkbox" class="ace-checkbox-2"
					id="ace-settings-header" /> <label class="lbl"
					for="ace-settings-header"> Fixed Header</label>
			</div>

			<div>
				<input type="checkbox" class="ace-checkbox-2"
					id="ace-settings-sidebar" /> <label class="lbl"
					for="ace-settings-sidebar"> Fixed Sidebar</label>
			</div>

			<div>
				<input type="checkbox" class="ace-checkbox-2"
					id="ace-settings-breadcrumbs" /> <label class="lbl"
					for="ace-settings-breadcrumbs"> Fixed Breadcrumbs</label>
			</div>

			<div>
				<input type="checkbox" class="ace-checkbox-2" id="ace-settings-rtl" />
				<label class="lbl" for="ace-settings-rtl"> Right To Left
					(rtl)</label>
			</div>
		</div>
	</div>
	<!--/#ace-settings-container-->
</div>
<!--/.main-content-->

<a href="#" id="btn-scroll-up"
	class="btn-scroll-up btn btn-small btn-inverse"> <i
	class="icon-double-angle-up icon-only bigger-110"></i>
</a>