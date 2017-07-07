<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Client Secure Login</title>
</head>
<%
			HttpSession session1=request.getSession(false);
			String ok = "ok";
			session1.setAttribute("ok", ok);
			if(ok=="ok")
			{
				%>
				<script type="text/javascript">
				var mywindow = window.open("index.jsp", "", "width=1300,height=670");
				
				 window.oncontextmenu = function () {
					   return false;
					}
				</script>		
				
				
				<%
			}
				
			
			%>

<body>
Please close this window
</body>
</html>