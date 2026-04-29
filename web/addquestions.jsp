<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>ExaSync | Add Questions</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        * { font-family: 'Inter', sans-serif; }
        body { background: #0a0e1a; color: #e0e6f0; padding-top: 60px; }
        .content { padding: 40px; max-width: 700px; }
        .page-title { font-size: 24px; font-weight: 700; margin-bottom: 5px; }
        .page-sub { color: #7a90b0; font-size: 14px; margin-bottom: 30px; }
        .form-card { background: #0d1b35; border: 1px solid #1e2a45; border-radius: 12px; padding: 35px; }
        .form-label { color: #a0b0cc; font-size: 13px; font-weight: 500; margin-bottom: 6px; }
        .form-control { background: #0a0e1a; border: 1px solid #1e2a45; color: #e0e6f0; padding: 11px 15px; border-radius: 8px; font-size: 14px; }
        .form-control:focus { background: #0a0e1a; border-color: #4a9eff; color: #e0e6f0; box-shadow: 0 0 0 3px rgba(74,158,255,0.15); }
        .form-control::placeholder { color: #3a4a65; }
        .btn-add { background: #4a9eff; color: white; padding: 12px 30px; border-radius: 8px; font-weight: 600; font-size: 15px; border: none; transition: all 0.2s; }
        .btn-add:hover { background: #2d7dd2; }
    </style>
</head>
<body>
    <% if(session.getAttribute("name") == null){ response.sendRedirect("adminlogin.jsp"); return; } %>
    <jsp:include page="adminnavbar.jsp"/>
    <div class="content">
        <div class="page-title">➕ Add New Question</div>
        <div class="page-sub">Adding question to Java Examination</div>
        <div class="form-card">
            <form action="addquestionDB.jsp" method="POST">
                <div class="form-group">
                    <label class="form-label">QUESTION NUMBER</label>
                    <input type="text" class="form-control" placeholder="e.g. 51" name="questno" required/>
                </div>
                <div class="form-group">
                    <label class="form-label">QUESTION</label>
                    <input type="text" class="form-control" placeholder="Enter the question" name="question" required/>
                </div>
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="form-label">CHOICE 1</label>
                            <input type="text" class="form-control" placeholder="Option A" name="ans1" required/>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="form-label">CHOICE 2</label>
                            <input type="text" class="form-control" placeholder="Option B" name="ans2" required/>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="form-label">CHOICE 3</label>
                            <input type="text" class="form-control" placeholder="Option C" name="ans3" required/>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="form-label">CHOICE 4</label>
                            <input type="text" class="form-control" placeholder="Option D" name="ans4" required/>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label class="form-label">CORRECT ANSWER</label>
                    <input type="text" class="form-control" placeholder="Type the exact correct answer" name="answer" required/>
                </div>
                <button type="submit" class="btn-add">➕ Add Question</button>
            </form>
        </div>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
