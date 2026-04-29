<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ExaSync | View Exam</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        * { font-family: 'Inter', sans-serif; }
        body { background: #0a0e1a; color: #e0e6f0; padding-top: 60px; }
        .content { padding: 40px; }
        .page-title { font-size: 24px; font-weight: 700; margin-bottom: 5px; }
        .page-sub { color: #7a90b0; font-size: 14px; margin-bottom: 30px; }
        .exam-table { background: #0d1b35; border-radius: 12px; overflow: hidden; border: 1px solid #1e2a45; }
        .exam-table table { width: 100%; margin: 0; }
        .exam-table thead th { background: #0a0e1a; color: #7a90b0; font-size: 12px; font-weight: 600; letter-spacing: 1px; padding: 15px 20px; border-bottom: 1px solid #1e2a45; text-transform: uppercase; }
        .exam-table tbody td { padding: 13px 20px; border-bottom: 1px solid #1e2a45; font-size: 13px; color: #e0e6f0; }
        .exam-table tbody tr:last-child td { border-bottom: none; }
        .exam-table tbody tr:hover { background: rgba(74,158,255,0.05); }
        .ans-badge { background: rgba(40,167,69,0.15); color: #28a745; padding: 3px 10px; border-radius: 20px; font-size: 12px; }
    </style>
</head>
<body>
    <% if(session.getAttribute("name") == null){ response.sendRedirect("adminlogin.jsp"); return; } %>
    <jsp:include page="adminnavbar.jsp"/>
    <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/online_exam" user="root" password=""/>
    <sql:query dataSource="${db}" var="res">SELECT * FROM java;</sql:query>
    <div class="content">
        <div class="page-title">📋 Java Exam Questions</div>
        <div class="page-sub">All 50 questions in the Java Examination</div>
        <div class="exam-table">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Q No</th>
                        <th>Question</th>
                        <th>Choice 1</th>
                        <th>Choice 2</th>
                        <th>Choice 3</th>
                        <th>Choice 4</th>
                        <th>Answer</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="tbl" items="${res.rows}">
                        <tr>
                            <td><c:out value="${tbl.id}"/></td>
                            <td><c:out value="${tbl.qno}"/></td>
                            <td><c:out value="${tbl.question}"/></td>
                            <td><c:out value="${tbl.a1}"/></td>
                            <td><c:out value="${tbl.a2}"/></td>
                            <td><c:out value="${tbl.a3}"/></td>
                            <td><c:out value="${tbl.a4}"/></td>
                            <td><span class="ans-badge"><c:out value="${tbl.ans}"/></span></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
