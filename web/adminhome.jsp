<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ExaSync | Admin Dashboard</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        * { font-family: 'Inter', sans-serif; }
        body { background: #0a0e1a; color: #e0e6f0; padding-top: 60px; }
        .dashboard { padding: 40px; }
        .welcome { margin-bottom: 40px; }
        .welcome h2 { font-size: 28px; font-weight: 700; }
        .welcome p { color: #7a90b0; font-size: 15px; margin-top: 5px; }
        .dash-card { background: #0d1b35; border: 1px solid #1e2a45; border-radius: 12px; padding: 30px; text-align: center; transition: all 0.3s; text-decoration: none; display: block; }
        .dash-card:hover { border-color: #4a9eff; transform: translateY(-4px); text-decoration: none; }
        .dash-icon { font-size: 36px; margin-bottom: 15px; }
        .dash-card h5 { color: #e0e6f0; font-weight: 600; font-size: 16px; margin-bottom: 8px; }
        .dash-card p { color: #7a90b0; font-size: 13px; margin: 0; }
        .stat-row { margin-bottom: 40px; }
        .stat-card { background: #0d1b35; border: 1px solid #1e2a45; border-radius: 12px; padding: 25px; }
        .stat-card .num { font-size: 36px; font-weight: 700; color: #4a9eff; }
        .stat-card .lbl { color: #7a90b0; font-size: 14px; margin-top: 5px; }
    </style>
</head>
<body>
    <% if(session.getAttribute("name") == null){ response.sendRedirect("adminlogin.jsp"); return; }
       session.setAttribute("examsubject", "java"); %>
    <jsp:include page="adminnavbar.jsp"/>
    <sql:setDataSource var="ds" driver="com.mysql.cj.jdbc.Driver" url="jdbc:mysql://localhost:3306/online_exam" user="root" password=""/>
    <sql:query dataSource="${ds}" var="studentCount">SELECT COUNT(*) as total FROM login;</sql:query>
    <sql:query dataSource="${ds}" var="attemptedCount">SELECT COUNT(*) as total FROM login WHERE marks IS NOT NULL;</sql:query>
    <sql:query dataSource="${ds}" var="passCount">SELECT COUNT(*) as total FROM login WHERE marks >= 25;</sql:query>

    <div class="dashboard">
        <div class="welcome">
            <h2>👋 Welcome back, Admin!</h2>
            <p>ExaSync Admin Dashboard — Manage your Java Examination</p>
        </div>
        <div class="row stat-row">
            <div class="col-md-4 mb-3">
                <div class="stat-card">
                    <div class="num"><c:forEach var="r" items="${studentCount.rows}">${r.total}</c:forEach></div>
                    <div class="lbl">Total Students Registered</div>
                </div>
            </div>
            <div class="col-md-4 mb-3">
                <div class="stat-card">
                    <div class="num"><c:forEach var="r" items="${attemptedCount.rows}">${r.total}</c:forEach></div>
                    <div class="lbl">Students Attempted Exam</div>
                </div>
            </div>
            <div class="col-md-4 mb-3">
                <div class="stat-card">
                    <div class="num"><c:forEach var="r" items="${passCount.rows}">${r.total}</c:forEach></div>
                    <div class="lbl">Students Passed (≥25/50)</div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4 mb-4">
                <a href="addquestions.jsp" class="dash-card">
                    <div class="dash-icon">➕</div>
                    <h5>Add Questions</h5>
                    <p>Add new questions to the Java exam</p>
                </a>
            </div>
            <div class="col-md-4 mb-4">
                <a href="viewexam.jsp" class="dash-card">
                    <div class="dash-icon">?</div>
                    <h5>View Exam</h5>
                    <p>View all Java exam questions and answers</p>
                </a>
            </div>
            <div class="col-md-4 mb-4">
                <a href="checkscores.jsp" class="dash-card">
                    <div class="dash-icon">📊</div>
                    <h5>Check Scores</h5>
                    <p>View all student results with Pass/Fail status</p>
                </a>
            </div>
        </div>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
