<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@page contentType="image/jpeg"%>
<jsp:useBean id="image" scope="page" class="pic.makeCertPic" />
<%
	String str = image.getCertPic(0, 0, response.getOutputStream());
	//System.out.println("certCode is:" + str );
	// 将认证码存入SESSION
	session.setAttribute("certCode", str);
	out.clear();
	out = pageContext.pushBody();
%>

<img src=" <%=str%>" />