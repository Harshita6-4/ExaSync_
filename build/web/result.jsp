<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ExaSync | Exam Submitted</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        * { font-family: 'Inter', sans-serif; }
        body { background: #0a0e1a; min-height: 100vh; display: flex; align-items: center; justify-content: center; }
        .result-card { background: #0d1b35; border: 1px solid #1e2a45; border-radius: 16px; padding: 50px 40px; text-align: center; max-width: 480px; width: 100%; }
        .icon { font-size: 60px; margin-bottom: 20px; }
        h2 { font-size: 26px; font-weight: 700; margin-bottom: 10px; }
        p { color: #7a90b0; font-size: 14px; line-height: 1.7; }
        .btn-logout { background: #4a9eff; color: white; padding: 12px 35px; border-radius: 8px; font-size: 15px; font-weight: 600; text-decoration: none; display: inline-block; margin-top: 25px; transition: all 0.2s; }
        .btn-logout:hover { background: #2d7dd2; color: white; text-decoration: none; }
        .brand { color: #4a9eff; font-weight: 700; font-size: 18px; margin-bottom: 30px; display: block; }
        .brand span { color: white; }
    </style>
</head>
<body>
    <% if(session.getAttribute("name") == null){ response.sendRedirect("login.jsp"); return; } %>
    <div class="result-card">
        <span class="brand">Exa<span>Sync</span></span>
        <div class="icon">✅</div>
        <h2>Exam Submitted!</h2>
        <p>Hello <b>${name}</b>, your Java examination has been submitted successfully. Your answers have been recorded and evaluated.</p>
        <p style="margin-top:15px;">Your result will be available with the administrator. Please contact them for your score.</p>
        <a href="logout" class="btn-logout">Logout Securely</a>
    </div>
</body>
</html>
