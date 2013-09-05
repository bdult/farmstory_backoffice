<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


	
	<div class="sidebar" id="sidebar">
		<div class="sidebar-shortcuts" id="sidebar-shortcuts">
	
			<div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
				<span class="btn btn-success"></span>
	
				<span class="btn btn-info"></span>
	
				<span class="btn btn-warning"></span>
	
				<span class="btn btn-danger"></span>
			</div>
		</div><!--#sidebar-shortcuts-->
	
		<ul class="nav nav-list">
			<li>
				<a href="${ contextPath }/dashboard.do">
					<i class="icon-dashboard"></i>
					<span class="menu-text"> Dashboard </span>
				</a> 
			</li>
			
			<li>
				<a href="${ contextPath }/main.do">
					<i class="icon-thumbs-up-alt"></i>
					<span class="menu-text"> 스토리팜 메인 </span>
				</a>
			</li>
			
			<li>
				<a href="${ contextPath }/sub.do">
					<i class="icon-thumbs-down-alt"></i>
					<span class="menu-text"> 스토리팜 서브 </span>
				</a>
			</li>
			
			<li>
				<a href="${ contextPath }/user.do">
					<i class="icon-file-alt"></i>
					<span class="menu-text"> 회원관리 </span>
				</a>
			</li>
			<li>
				<a href="#" class="dropdown-toggle">
					<i class="icon-file-alt"></i>
					<span class="menu-text"> 컨텐츠 관리
						<span class="badge badge-primary ">4</span> 
					</span>
					<b class="arrow icon-angle-down"></b>
					
				</a>
				<ul class="submenu">
					<li>
						<a href="${contextPath }/contents/manage.do">
							<i class="icon-double-angle-right"></i>
							컨텐츠 관리
						</a>
					</li>
	
					<li>
						<a href="${contextPath }/series/manage.do">
							<i class="icon-double-angle-right"></i>
							시리즈 관리
						</a>
					</li>
	
					<li>
						<a href="${contextPath }/brand/manage.do">
							<i class="icon-double-angle-right"></i>
							브랜드 관리
						</a>
					</li>
					<li>
						<a href="${ contextPath }/category/manage.do">
							<i class="icon-double-angle-right"></i>
							카테고리 관리
						</a>
					</li>
				</ul>
			</li>
			<li>
				<a href="#" class="dropdown-toggle">
					<i class="icon-file-alt"></i>
	
					<span class="menu-text">
						Other Pages
						<span class="badge badge-primary ">4</span>
					</span>
	
					<b class="arrow icon-angle-down"></b>
				</a>
	
				<ul class="submenu">
					<li>
						<a href="error-404.html">
							<i class="icon-double-angle-right"></i>
							Error 404
						</a>
					</li>
	
					<li>
						<a href="error-500.html">
							<i class="icon-double-angle-right"></i>
							Error 500
						</a>
					</li>
	
					<li>
						<a href="grid.html">
							<i class="icon-double-angle-right"></i>
							Grid
						</a>
					</li>
	
					<li>
						<a href="blank.html">
							<i class="icon-double-angle-right"></i>
							Blank Page
						</a>
					</li>
				</ul>
			</li>
		</ul><!--/.nav-list-->
	
		<div class="sidebar-collapse" id="sidebar-collapse">
			<i class="icon-double-angle-left"></i>
		</div>
	</div>

<script>
$(function(){
	
	
});
</script>
