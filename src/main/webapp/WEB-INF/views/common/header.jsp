<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="navbar">
	<div class="navbar-inner">
		<div class="container-fluid">
			<a href="#" class="brand">
				<small>
					<i class="icon-leaf"></i>
					스토리팜 백오피스
				</small>
			</a><!--/.brand-->

			<ul class="nav ace-nav pull-right">
				<li class="light-blue">
					<a data-toggle="dropdown" href="#" class="dropdown-toggle">
						<span class="user-info">
							ID : ${ login_session.MEMBER_ID }
							<br> 권한 : ${ login_session.MEMBER_ROLE }
						</span>

						<i class="icon-caret-down"></i>
					</a>

					<ul class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-closer">
						<li>
							<a href="#">
								<i class="icon-cog"></i>
								Settings
							</a>
						</li>

						<li>
							<a href="#">
								<i class="icon-user"></i>
								Profile
							</a>
						</li>

						<li class="divider"></li>

						<li>
							<a href="${ contextPath }/user/logout.do">
								<i class="icon-off"></i>
								Logout
							</a>
						</li>
					</ul>
				</li>
			</ul><!--/.ace-nav-->
		</div><!--/.container-fluid-->
	</div><!--/.navbar-inner-->
</div>