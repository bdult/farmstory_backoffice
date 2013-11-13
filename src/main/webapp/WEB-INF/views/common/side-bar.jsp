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
						<span class="menu-text">Members
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
					<span class="menu-text">Display
						<span class="badge badge-primary ">3</span> 
					</span>
					<b class="arrow icon-angle-down"></b>
				</a>
				<ul class="submenu">
					<li id="side-display-main">
						<a href="${ contextPath }/display/main/manageView.do">
							<i class="icon-double-angle-right"></i>
							Main
						</a>
					</li>
					<li id="side-display-contents">
						<a href="${ contextPath }/display/contents/manageView.do">
							<i class="icon-double-angle-right"></i>
							Contents
						</a>
					</li>
					<li id="side-display-popup">
						<a href="${ contextPath }/display/popup/manageView.do">
							<i class="icon-double-angle-right"></i>
							Popup
						</a>
					</li>
				</ul>
			</li>
			
			<li id="side-contents">
				<a href="#" class="dropdown-toggle">
					<i class="icon-file-alt"></i>
					<span class="menu-text">Contents
						<span class="badge badge-primary ">4</span> 
					</span>
					<b class="arrow icon-angle-down"></b>
					
				</a>
				<ul class="submenu">
					<li id="side-contents-contents">
						<a href="${contextPath }/contents/manage.do">
							<i class="icon-double-angle-right"></i>
							Contents
						</a>
					</li>
	
					<li id="side-contents-series">
						<a href="${contextPath }/series/manage.do">
							<i class="icon-double-angle-right"></i>
							Series
						</a>
					</li>
	
					<li id="side-contents-brand">
						<a href="${contextPath }/brand/manage.do">
							<i class="icon-double-angle-right"></i>
							Publisher
						</a>
					</li>
					<li id="side-contents-category">
						<a href="${ contextPath }/category/manage.do">
							<i class="icon-double-angle-right"></i>
							Category
						</a>
					</li>
				</ul>
			</li>
			<li id="side-code-code">
				<a href="${contextPath }/code/manage.do">
					<i class="icon-file-alt"></i>
					Code
				</a>
			</li>
			<li id="side-stats">
				<a href="#" class="dropdown-toggle">
					<i class="icon-file-alt"></i>
					<span class="menu-text"> Statistics
						<span class="badge badge-primary ">2</span> 
					</span>
					<b class="arrow icon-angle-down"></b>
				</a>
				<ul class="submenu">
					<li id="side-stats-view" >
						<a href="${contextPath }/stats/view.do">
							<i class="icon-double-angle-right"></i>
							Searching
						</a>
					</li>
					<li id="side-stats-setting" >
						<a href="${contextPath }/stats/setting.do">
							<i class="icon-double-angle-right"></i>
							Setting
						</a>
					</li> 
				</ul>
			</li>
			<li id="side-cscenter">
				<a href="#" class="dropdown-toggle">
					<i class="icon-file-alt"></i>
					<span class="menu-text"> CS
						<span class="badge badge-primary ">3</span> 
					</span>
					<b class="arrow icon-angle-down"></b>
				</a>
				<ul class="submenu">
					<li id="side-cscenter-question" >
						<a href="${contextPath }/cscenter/questionManage.do">
							<i class="icon-double-angle-right"></i>
							Custom Voice
						</a>
					</li> 
					<li id="side-cscenter-notice" >
						<a href="${contextPath }/cscenter/noticeManage.do">
							<i class="icon-double-angle-right"></i>
							Notice
						</a>
					</li> 
					<li id="side-cscenter-faq" >
						<a href="${contextPath }/cscenter/faqManage.do">
							<i class="icon-double-angle-right"></i>
							FAQ
						</a>
					</li>
				</ul>
			</li>
			<li id="side-event">
				<a href="${contextPath }/event/eventManage.do" class="dropdown-toggle">
					<i class="icon-file-alt"></i>
					
					<span class="menu-text"> Event
					</span>
				</a>
				<!-- 
				<ul class="submenu">
					<li id="side-event-event" >
						<a href="${contextPath }/event/eventManage.do">
							<i class="icon-double-angle-right"></i>
							Event
						</a>
					</li> 
				 -->
					<%-- <li id="side-board-board" >
						<a href="${contextPath }/event/eventManage.do">
							<i class="icon-double-angle-right"></i>
							쿠폰 관리
						</a>
					</li>  --%>
				</ul>
			</li>
		</ul><!--/.nav-list-->
	
		<div class="sidebar-collapse" id="sidebar-collapse">
			<i class="icon-double-angle-left"></i>
		</div>
	</div>
