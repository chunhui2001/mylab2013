<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

  <% String pageTitle = (String)request.getAttribute("pageTitle"); %> 
  <% String pageContent = (String)request.getAttribute("pageContent"); %> 
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<link rel="shortcut icon" href="/images/favicon2.ico" type="image/x-icon" />
	<title><%= pageTitle %></title>
	<script type="text/javascript" src="/RenderingAssets/lib/jquery/jquery-1.10.1.min.js"></script>
	<script type="text/javascript" src="/RenderingAssets/lib/jquery/jquery-migrate-1.2.1.min.js"></script>	
	
	
	<script src="http://unslider.com/unslider.js"></script>
	
	<link rel="Stylesheet" type="text/css" href="/RenderingAssets/css/reset.css" /> 
	<link rel="Stylesheet" type="text/css" href="/RenderingAssets/css/global.css" /> 
</head>
<body>
	<div class="topNav">
		
	</div>

	<div class="mainContent">
  		<%= pageContent %>
	</div>
	
	<div class="footer">
		
	</div>
</body>
</html>