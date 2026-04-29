<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ExaSync | Exam Portal</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        * { font-family: 'Inter', sans-serif; }
        body { background: #0a0e1a; color: #e0e6f0; min-height: 100vh; }
        .topbar { background: #0d1b35; border-bottom: 1px solid #1e2a45; padding: 16px 40px; display: flex; justify-content: space-between; align-items: center; }
        .topbar .brand { color: #4a9eff; font-weight: 700; font-size: 20px; }
        .topbar .brand span { color: white; }
        .topbar .user { color: #a0b0cc; font-size: 14px; }
        .topbar .btn-logout { background: transparent; border: 1px solid #1e2a45; color: #7a90b0; padding: 6px 16px; border-radius: 6px; font-size: 13px; text-decoration: none; transition: all 0.2s; }
        .topbar .btn-logout:hover { border-color: #ff6b6b; color: #ff6b6b; }
        .portal { max-width: 650px; margin: 60px auto; padding: 0 20px; }
        .exam-card { background: #0d1b35; border: 1px solid #1e2a45; border-radius: 16px; padding: 40px; }
        .exam-card .subject-badge { background: rgba(74,158,255,0.1); border: 1px solid rgba(74,158,255,0.3); color: #4a9eff; padding: 5px 14px; border-radius: 20px; font-size: 13px; font-weight: 500; display: inline-block; margin-bottom: 20px; }
        .exam-card h2 { font-size: 26px; font-weight: 700; margin-bottom: 8px; }
        .exam-card .sub { color: #7a90b0; font-size: 14px; margin-bottom: 30px; }
        .info-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 15px; margin-bottom: 30px; }
        .info-item { background: #0a0e1a; border: 1px solid #1e2a45; border-radius: 10px; padding: 18px; }
        .info-item .label { color: #7a90b0; font-size: 12px; font-weight: 500; margin-bottom: 6px; text-transform: uppercase; letter-spacing: 0.5px; }
        .info-item .value { color: #e0e6f0; font-size: 16px; font-weight: 600; }
        .warning-box { background: rgba(255,193,7,0.08); border: 1px solid rgba(255,193,7,0.25); border-radius: 10px; padding: 15px 20px; margin-bottom: 25px; }
        .warning-box p { color: #ffc107; font-size: 13px; margin: 0; }
        .btn-start { background: #4a9eff; color: white; width: 100%; padding: 14px; border-radius: 10px; font-weight: 600; font-size: 16px; border: none; transition: all 0.2s; cursor: pointer; }
        .btn-start:hover { background: #2d7dd2; }
        .already-card { background: #0d1b35; border: 1px solid #1e2a45; border-radius: 16px; padding: 50px 40px; text-align: center; max-width: 500px; margin: 80px auto; }
        .already-card h2 { font-size: 24px; font-weight: 700; margin-bottom: 15px; }
        .already-card p { color: #7a90b0; font-size: 14px; line-height: 1.7; }
        .btn-logout-big { background: transparent; border: 1px solid #ff6b6b; color: #ff6b6b; padding: 12px 30px; border-radius: 8px; font-size: 14px; font-weight: 600; text-decoration: none; display: inline-block; margin-top: 20px; transition: all 0.2s; }
        .btn-logout-big:hover { background: #ff6b6b; color: white; text-decoration: none; }
    </style>
</head>
<body>
<%
    response.setHeader("Cache-Control", "private, no-store, no-cache, must-revalidate");
    if(session.getAttribute("name") == null){ response.sendRedirect("login.jsp"); return; }
%>
<sql:setDataSource var="ds" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/online_exam" user="root" password=""/>
<sql:query dataSource="${ds}" var="checkExam">SELECT marks FROM login WHERE email='${email}'</sql:query>

<div class="topbar">
    <div class="brand">Exa<span>Sync</span></div>
    <div class="d-flex align-items-center">
        <span class="user mr-3">👤 ${name}</span>
        <a href="logout" class="btn-logout">Logout</a>
    </div>
</div>

<c:set var="alreadyTaken" value="false"/>
<c:forEach var="row" items="${checkExam.rows}">
    <c:if test="${row.marks != null}"><c:set var="alreadyTaken" value="true"/></c:if>
</c:forEach>

<c:choose>
    <c:when test="${alreadyTaken == 'true'}">
        <div class="already-card">
            <div style="font-size:48px; margin-bottom:15px;">🔒</div>
            <h2>Exam Already Submitted</h2>
            <p>Hello <b>${name}</b>, you have already appeared for the Java Examination. Each student is allowed to take the exam only once.</p>
            <p style="margin-top:10px;">Please contact your administrator to view your result.</p>
            <a href="logout" class="btn-logout-big">Logout</a>
        </div>
    </c:when>
    <c:otherwise>
        <div class="portal">
            <div class="exam-card">
                <div class="subject-badge">☕ Java Programming</div>
                <h2>Java Examination</h2>
                <p class="sub">Please read all instructions carefully before starting the exam.</p>
                <div class="info-grid">
                    <div class="info-item"><div class="label">Total Questions</div><div class="value">50</div></div>
                    <div class="info-item"><div class="label">Time Limit</div><div class="value">50 Minutes</div></div>
                    <div class="info-item"><div class="label">Marks per Question</div><div class="value">1 Mark</div></div>
                    <div class="info-item"><div class="label">Negative Marking</div><div class="value">None</div></div>
                    <div class="info-item"><div class="label">Attempts Allowed</div><div class="value">1 Only</div></div>
                    <div class="info-item"><div class="label">Auto Submit</div><div class="value">Yes</div></div>
                </div>
                <div class="warning-box">
                    <p>⚠️ Press <b>F11</b> to enter fullscreen before starting. Do not refresh or navigate away during the exam.</p>
                </div>
                <form action="exam.jsp" method="POST" id="examForm">
                    <input type="hidden" name="selectedexam" value="java">
                    <button type="button" class="btn-start" onclick="startExam()">🚀 Start Examination</button>
                </form>
            </div>
        </div>
        <script>
            function startExam() {
                var el = document.documentElement;
                var promise = null;
                if (el.requestFullscreen) promise = el.requestFullscreen();
                else if (el.webkitRequestFullscreen) promise = el.webkitRequestFullscreen();
                else if (el.mozRequestFullScreen) promise = el.mozRequestFullScreen();
                else if (el.msRequestFullscreen) promise = el.msRequestFullscreen();
                if (promise) {
                    promise.then(function(){ document.getElementById("examForm").submit(); })
                           .catch(function(){ document.getElementById("examForm").submit(); });
                } else {
                    document.getElementById("examForm").submit();
                }
            }
        </script>
    </c:otherwise>
</c:choose>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
