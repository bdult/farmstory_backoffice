<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
#editor {
	overflow: scroll; 
	max-height: 300px
}
</style>

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
			<li class="active">Sub</li>
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
				Category
				<small>
					<i class="icon-double-angle-right"></i>
					overview &amp; stats
				</small>
			</h1>
		</div><!--/.page-header-->

		<div class="row-fluid">
			<div class="span6">
				
				<div class="alert alert-info">
					<button type="button" class="close" data-dismiss="alert">
						<i class="icon-remove"></i>
					</button>
					<strong>레벨 1</strong>
					수학, 영어, 동화 같은 과목을 관리(?)
					<br>
				</div>
				
				<table id="sample-table-1" class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th></th>
							<th>이름</th>
							<th></th>
						</tr>
					</thead>				
					<tbody>
						<tr>
							<td></td>
							<td>수학</td>
							<td>x e</td>
						</tr>
						<tr>
							<td></td>
							<td>수학</td>
							<td>x e</td>
						</tr>
						<tr>
							<td></td>
							<td>수학</td>
							<td>x e</td>
						</tr>
					</tbody>	
				</table>
			</div><!--/.span-->
			<div class="span6">
			
				<div class="alert alert-info">
					<button type="button" class="close" data-dismiss="alert">
						<i class="icon-remove"></i>
					</button>
					<strong>레벨 2</strong>
					브랜드 관리(?)
					<br>
				</div>
				
				<table id="sample-table-1" class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th></th>
							<th>이름</th>
							<th>x e</th>
						</tr>
					</thead>				
					<tbody>
						<tr>
							<td></td>
							<td>삐아제</td>
							<td>x e</td>
						</tr>
						<tr>
							<td></td>
							<td>시사영어사</td>
							<td>x e</td>
						</tr>
						<tr>
							<td></td>
							<td>재능교육</td>
							<td>x e</td>
						</tr>
					</tbody>	
				</table>
			</div><!--/.span-->
		</div><!--/.row-fluid-->
	</div><!--/.page-content-->
</div>

<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-small btn-inverse">
	<i class="icon-double-angle-up icon-only bigger-110"></i>
</a>

<script>
$(function(){
	

});
</script>

		