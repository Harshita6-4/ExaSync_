<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>OES | Exam Already Taken</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <style>
        body { background: #f4f6f9; display: flex; justify-content: center; align-items: center; height: 100vh; }
        .card { border-radius: 12px; padding: 50px; text-align: center; box-shadow: 0 4px 20px rgba(0,0,0,0.15); max-width: 500px; width: 100%; }
    </style>
</head>
<body>
    <div class="card">
        <h2>⚠️ Exam Already Taken</h2>
        <p class="text-muted mt-3">Hello <b>${name}</b>, you have already appeared for the Java Examination.</p>
        <p>Each student is allowed to take the exam <b>only once</b>.</p>
        <p>Please contact your administrator for more information.</p>
        <br>
        <a href="logout" class="btn btn-dark">🔒 Logout</a>
    </div>
</body>
</html>
