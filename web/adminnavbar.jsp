<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
<style>
    .exasync-nav { background: #0d1b35; border-bottom: 1px solid #1e2a45; padding: 14px 30px; font-family: 'Inter', sans-serif; }
    .exasync-nav .brand { color: #4a9eff; font-weight: 700; font-size: 20px; text-decoration: none; }
    .exasync-nav .brand span { color: white; }
    .exasync-nav .nav-links a { color: #a0b0cc; text-decoration: none; font-size: 14px; font-weight: 500; margin-left: 25px; transition: color 0.2s; }
    .exasync-nav .nav-links a:hover { color: #4a9eff; }
    .exasync-nav .nav-links a.active { color: #4a9eff; }
    .exasync-nav .admin-badge { background: rgba(255,107,107,0.1); border: 1px solid rgba(255,107,107,0.3); color: #ff6b6b; padding: 4px 12px; border-radius: 20px; font-size: 12px; font-weight: 500; }
    .exasync-nav .btn-logout { background: rgba(255,107,107,0.1); border: 1px solid rgba(255,107,107,0.3); color: #ff6b6b; padding: 6px 16px; border-radius: 6px; font-size: 13px; font-weight: 500; text-decoration: none; margin-left: 20px; transition: all 0.2s; }
    .exasync-nav .btn-logout:hover { background: #ff6b6b; color: white; }
</style>
<nav class="exasync-nav d-flex justify-content-between align-items-center" style="padding-top:70px;">
    <a href="adminhome.jsp" class="brand">Exa<span>Sync</span></a>
    <div class="nav-links d-flex align-items-center">
        <span class="admin-badge">Admin Panel</span>
        <a href="adminhome.jsp">Home</a>
        <a href="addquestions.jsp">Add Questions</a>
        <a href="viewexam.jsp">View Exam</a>
        <a href="checkscores.jsp">Scores</a>
        <a href="logout" class="btn-logout">Logout</a>
    </div>
</nav>
