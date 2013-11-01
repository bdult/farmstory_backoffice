<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

<div class="navbar">
	<div class="navbar-inner">
		<div class="container-fluid">
			<a href="${ contextPath }/dashboard.do" class="brand">
				<small>
						<i class="icon-leaf"></i>
						Oz World Backoffice
				</small>
			</a><!--/.brand-->

			<ul class="nav ace-nav pull-right">
				<li class="light-blue">
					<a data-toggle="dropdown" href="#" class="dropdown-toggle">
						<span class="user-info">
							ID : ${ login_session.MEMBER_ID }
							<br>
							<c:choose>
								<c:when test="${ login_session.MEMBER_TYPE == 2 }">
									권한 : 슈퍼어드민
								</c:when>
								<c:otherwise>
									권한 : 어드민
								</c:otherwise>
							</c:choose>
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