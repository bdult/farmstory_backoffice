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
			<li id="side-home">
				<a href="${ contextPath }/dashboard.do">
					<i class="icon-dashboard"></i>
					<span class="menu-text"> Home </span>
				</a> 
			</li>
			
			<li id="side-user">
				<a href="${ contextPath }/user/manage.do" class="dropdown-toggle">
						<i class="icon-file-alt"></i>
						<span class="menu-text">  회원관리 
							<span class="badge badge-primary "></span> 
						</span>
						<!-- <b class="arrow icon-angle-down"></b> -->
						
					</a>
					<%-- <ul class="submenu">
		
						<li id="side-user-user">
							<a href="${ contextPath }/user/manage.do">
								<i class="icon-double-angle-right"></i>
								일반 회원
							</a>
						</li>
		
						<li id="side-user-admin">
							<a href="${ contextPath }/user/admin/manage.do">
								<i class="icon-double-angle-right"></i>
								Admin 회원
							</a>
						</li> 
					</ul>--%>
				</li>
			<li id="side-display">
				<a href="#null" class="dropdown-toggle">
					<i class="icon-file-alt"></i>
					<span class="menu-text">  전시 관리
						<span class="badge badge-primary ">3</span> 
					</span>
					<b class="arrow icon-angle-down"></b>
				</a>
				<ul class="submenu">
					<li id="side-display-main">
						<a href="${ contextPath }/display/main/manageView.do">
							<i class="icon-double-angle-right"></i>
							메인화면 관리
						</a>
					</li>
					<li id="side-display-contents">
						<a href="${ contextPath }/display/contents/manageView.do">
							<i class="icon-double-angle-right"></i>
							컨텐츠 노출 관리
						</a>
					</li>
					<li id="side-display-popup">
						<a href="${ contextPath }/display/popup/manageView.do">
							<i class="icon-double-angle-right"></i>
							팝업 관리
						</a>
					</li>
				</ul>
			</li>
			
			<li id="side-contents">
				<a href="#" class="dropdown-toggle">
					<i class="icon-file-alt"></i>
					<span class="menu-text"> 컨텐츠 관리
						<span class="badge badge-primary ">4</span> 
					</span>
					<b class="arrow icon-angle-down"></b>
					
				</a>
				<ul class="submenu">
					<li id="side-contents-contents">
						<a href="${contextPath }/contents/manage.do">
							<i class="icon-double-angle-right"></i>
							컨텐츠
						</a>
					</li>
	
					<li id="side-contents-series">
						<a href="${contextPath }/series/manage.do">
							<i class="icon-double-angle-right"></i>
							시리즈
						</a>
					</li>
	
					<li id="side-contents-brand">
						<a href="${contextPath }/brand/manage.do">
							<i class="icon-double-angle-right"></i>
							출판사
						</a>
					</li>
					<li id="side-contents-category">
						<a href="${ contextPath }/category/manage.do">
							<i class="icon-double-angle-right"></i>
							카테고리
						</a>
					</li>
				</ul>
			</li>
			<li id="side-code-code">
				<a href="${contextPath }/code/manage.do">
					<i class="icon-file-alt"></i>
					코드 관리
				</a>
			</li>
			<li id="side-stats">
				<a href="#" class="dropdown-toggle">
					<i class="icon-file-alt"></i>
					<span class="menu-text"> 통계
						<span class="badge badge-primary ">2</span> 
					</span>
					<b class="arrow icon-angle-down"></b>
				</a>
				<ul class="submenu">
					<li id="side-stats-view" >
						<a href="${contextPath }/stats/view.do">
							<i class="icon-double-angle-right"></i>
							조회
						</a>
					</li>
					<li id="side-stats-setting" >
						<a href="${contextPath }/stats/setting.do">
							<i class="icon-double-angle-right"></i>
							설정
						</a>
					</li> 
				</ul>
			</li>
			<li id="side-cscenter">
				<a href="#" class="dropdown-toggle">
					<i class="icon-file-alt"></i>
					<span class="menu-text"> 고객센터 관리
						<span class="badge badge-primary ">3</span> 
					</span>
					<b class="arrow icon-angle-down"></b>
				</a>
				<ul class="submenu">
					<li id="side-cscenter-question" >
						<a href="${contextPath }/cscenter/questionManage.do">
							<i class="icon-double-angle-right"></i>
							문의하기 관리
						</a>
					</li> 
					<li id="side-cscenter-notice" >
						<a href="${contextPath }/cscenter/noticeManage.do">
							<i class="icon-double-angle-right"></i>
							공지사항 관리
						</a>
					</li> 
					<li id="side-cscenter-faq" >
						<a href="${contextPath }/cscenter/faqManage.do">
							<i class="icon-double-angle-right"></i>
							FAQ 관리
						</a>
					</li>
				</ul>
			</li>
			<li id="side-event">
				<a href="${contextPath }/event/eventManage.do" class="dropdown-toggle">
					<i class="icon-file-alt"></i>
					이벤트 관리
				</a>
			</li>
		</ul><!--/.nav-list-->
	
		<div class="sidebar-collapse" id="sidebar-collapse">
			<i class="icon-double-angle-left"></i>
		</div>
	</div>
