<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>OES | Saving Marks</title>
</head>
<body>
    <sql:setDataSource driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/online_exam" user="root" password=""></sql:setDataSource>
    <c:set var="uscore" value="${param.uscore}"/>
    <sql:update>
        UPDATE login SET marks='${uscore}' WHERE email='${email}'
    </sql:update>
    <c:redirect url="result.jsp"></c:redirect>
</body>
</html>
