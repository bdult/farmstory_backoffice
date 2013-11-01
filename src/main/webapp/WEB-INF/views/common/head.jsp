<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<title>OZ World BackOffice</title>
<link rel="shortcut icon" href="/img/favicon.ico" />	

<meta charset="utf-8" />
<meta name="description" content="overview &amp; stats" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<c:set var="contextPath" value="${pageContext.request.contextPath}" scope="request"/>
<c:set var="rootPath" value="/ozworld-admin" scope="request"/>

<!-- basic styles -->

<link href="${rootPath }/assets/css/bootstrap.min.css" rel="stylesheet" />
<link rel="stylesheet" href="${rootPath }/assets/css/font-awesome.min.css" />

<!--[if IE 7]>
  <link rel="stylesheet" href="assets/css/font-awesome-ie7.min.css" />
<![endif]-->

<!-- page specific plugin styles -->

<link rel="stylesheet" href="${rootPath }/assets/css/jquery-ui-1.10.3.custom.min.css" />
<link rel="stylesheet" href="${rootPath }/assets/css/chosen.css" />
<link rel="stylesheet" href="${rootPath }/assets/css/datepicker.css" />
<link rel="stylesheet" href="${rootPath }/assets/css/bootstrap-timepicker.css" />
<link rel="stylesheet" href="${rootPath }/assets/css/daterangepicker.css" />
<link rel="stylesheet" href="${rootPath }/assets/css/colorpicker.css" />

<!-- fonts -->

<link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400,300" />

<!-- ace styles -->

<link rel="stylesheet" href="${rootPath }/assets/css/ace.min.css" />
<link rel="stylesheet" href="${rootPath }/assets/css/ace-skins.min.css" />

<!-- RNTS -->
<link rel="stylesheet" href="${contextPath}/css/main.css" />

<!--[if lte IE 8]>
  <link rel="stylesheet" href="${contextPath}/assets/css/ace-ie.min.css" />
<![endif]-->

<!--inline styles related to this page-->

<!--basic scripts-->

<!--[if !IE]>-->

<script type="text/javascript">
	window.jQuery || document.write("<script src='${rootPath}/assets/js/jquery-2.0.3.min.js'>"+"<"+"/script>");
</script>

<!--<![endif]-->

<!--[if IE]>
<script type="text/javascript">
 window.jQuery || document.write("<script src='${contextPath}/assets/js/jquery-1.10.2.min.js'>"+"<"+"/script>");
</script>
<![endif]-->

<script type="text/javascript">
	if("ontouchend" in document) document.write("<script src='${rootPath}/assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
</script>
<script src="${rootPath}/assets/js/bootstrap.min.js"></script>

<!--page specific plugin scripts-->

<script src="${rootPath}/assets/js/jquery-ui-1.10.3.custom.min.js"></script>
<script src="${rootPath}/assets/js/jquery.ui.touch-punch.min.js"></script>
<script src="${rootPath}/assets/js/markdown/markdown.min.js"></script>
<script src="${rootPath}/assets/js/markdown/bootstrap-markdown.min.js"></script>
<script src="${rootPath}/assets/js/jquery.hotkeys.min.js"></script>
<script src="${rootPath}/assets/js/bootstrap-wysiwyg.min.js"></script>
<script src="${rootPath}/assets/js/bootbox.min.js"></script>
<script src="${rootPath}/assets/js/date-time/bootstrap-datepicker.min.js"></script>

<!--ace scripts-->

<script src="${rootPath}/assets/js/ace-elements.min.js"></script>
<script src="${rootPath}/assets/js/ace.min.js"></script>

<!-- ajaxform -->
<script src="http://malsup.github.com/jquery.form.js"></script> 

<style>
.btn {
	line-height : 20px
}

.btn-success {
	line-height : 32px
}

</style>
