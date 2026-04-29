<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ExaSync | Student Scores</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        * { font-family: 'Inter', sans-serif; }
        body { background: #0a0e1a; color: #e0e6f0; padding-top: 60px; }
        .content { padding: 40px; }
        .page-title { font-size: 24px; font-weight: 700; margin-bottom: 5px; }
        .page-sub { color: #7a90b0; font-size: 14px; margin-bottom: 30px; }
        .score-table { background: #0d1b35; border-radius: 12px; overflow: hidden; border: 1px solid #1e2a45; }
        .score-table table { width: 100%; margin: 0; }
        .score-table thead th { background: #0a0e1a; color: #7a90b0; font-size: 12px; font-weight: 600; letter-spacing: 1px; padding: 15px 20px; border-bottom: 1px solid #1e2a45; text-transform: uppercase; }
        .score-table tbody td { padding: 15px 20px; border-bottom: 1px solid #1e2a45; font-size: 14px; color: #e0e6f0; }
        .score-table tbody tr:last-child td { border-bottom: none; }
        .score-table tbody tr:hover { background: rgba(74,158,255,0.05); }
        .badge-pass { background: rgba(40,167,69,0.15); color: #28a745; padding: 4px 12px; border-radius: 20px; font-size: 12px; font-weight: 600; }
        .badge-fail { background: rgba(255,107,107,0.15); color: #ff6b6b; padding: 4px 12px; border-radius: 20px; font-size: 12px; font-weight: 600; }
        .badge-pending { background: rgba(255,193,7,0.15); color: #ffc107; padding: 4px 12px; border-radius: 20px; font-size: 12px; font-weight: 600; }
    </style>
</head>
<body>
    <% if(session.getAttribute("name") == null){ response.sendRedirect("adminlogin.jsp"); return; } %>
    <jsp:include page="adminnavbar.jsp"/>
    <sql:setDataSource var="db" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/online_exam" user="root" password=""/>
    <sql:query dataSource="${db}" var="res">SELECT * FROM login;</sql:query>
    <div class="content">
        <div class="page-title">📊 Student Results</div>
        <div class="page-sub">Java Examination — All student scores</div>
        <div class="score-table">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Username</th>
                        <th>Email</th>
                        <th>Score</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="tbl" items="${res.rows}">
                        <tr>
                            <td><c:out value="${tbl.id}"/></td>
                            <td><c:out value="${tbl.username}"/></td>
                            <td><c:out value="${tbl.email}"/></td>
                            <td><c:out value="${tbl.marks}"/> <span style="color:#7a90b0;">/ 50</span></td>
                            <td>
                                <c:choose>
                                    <c:when test="${tbl.marks == null}"><span class="badge-pending">⏳ Not Attempted</span></c:when>
                                    <c:when test="${tbl.marks >= 25}"><span class="badge-pass">✅ Pass</span></c:when>
                                    <c:otherwise><span class="badge-fail">❌ Fail</span></c:otherwise>
                                </c:choose>
                            </td>
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
