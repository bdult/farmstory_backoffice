<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
	<title>BIGSTAR GLOBAL</title>
	<link rel="shortcut icon" href="/img/favicon.ico" />	
	
	<meta charset="utf-8" />
	<meta name="description" content="overview &amp; stats" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />

	<!--basic styles-->

	<link href="assets/css/bootstrap.min.css" rel="stylesheet" />
	<link href="assets/css/bootstrap-responsive.min.css" rel="stylesheet" />
	<link rel="stylesheet" href="assets/css/font-awesome.min.css" />

	<!--[if IE 7]>
	  <link rel="stylesheet" href="assets/css/font-awesome-ie7.min.css" />
	<![endif]-->

	<!--page specific plugin styles-->

	<!--fonts-->

	<link rel="stylesheet" href="assets/css/ace-fonts.css" />

	<!--ace styles-->

	<link rel="stylesheet" href="assets/css/ace.min.css" />
	<link rel="stylesheet" href="assets/css/ace-responsive.min.css" />
	<link rel="stylesheet" href="assets/css/ace-skins.min.css" />

	<!--[if lte IE 8]>
	  <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
	<![endif]-->

	<!--inline styles related to this page-->
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
	
	
    

    