<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
	<tiles:insertAttribute name="head"/>
</head>
<body>

	<tiles:insertAttribute name="header"/>
	
	<div class="main-container container-fluid">
		<a class="menu-toggler" id="menu-toggler" href="#">
			<span class="menu-text"></span>
		</a>
	
	    <tiles:insertAttribute name="side-bar"/>	
			
		<tiles:insertAttribute name="content"/>
	</div>
	
	<tiles:insertAttribute name="footer"/>	
	
</body>
</html>
	
	
    

    