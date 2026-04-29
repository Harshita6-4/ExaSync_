<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ExaSync | Student Login</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <script>
        function validateLogin() {
            var username = document.getElementById("inputUsername").value.trim();
            var pass = document.getElementById("inputPassword").value;
            var valid = true;
            document.getElementById("usernameError").innerText = "";
            document.getElementById("passError").innerText = "";
            if (username === "") { document.getElementById("usernameError").innerText = "Username is required."; valid = false; }
            if (pass === "") { document.getElementById("passError").innerText = "Password is required."; valid = false; }
            return valid;
        }
    </script>
    <style>
        * { font-family: 'Inter', sans-serif; }
        body { background: #0a0e1a; min-height: 100vh; display: flex; align-items: center; justify-content: center; }
        .auth-card { background: #0d1b35; border: 1px solid #1e2a45; border-radius: 16px; padding: 45px 40px; width: 100%; max-width: 420px; }
        .brand { text-align: center; margin-bottom: 30px; }
        .brand h2 { color: #4a9eff; font-weight: 700; font-size: 28px; }
        .brand h2 span { color: white; }
        .brand p { color: #7a90b0; font-size: 14px; margin-top: 5px; }
        .form-label { color: #a0b0cc; font-size: 13px; font-weight: 500; margin-bottom: 6px; }
        .form-control { background: #0a0e1a; border: 1px solid #1e2a45; color: #e0e6f0; padding: 12px 15px; border-radius: 8px; font-size: 14px; }
        .form-control:focus { background: #0a0e1a; border-color: #4a9eff; color: #e0e6f0; box-shadow: 0 0 0 3px rgba(74,158,255,0.15); }
        .form-control::placeholder { color: #3a4a65; }
        .btn-login { background: #4a9eff; color: white; width: 100%; padding: 13px; border-radius: 8px; font-weight: 600; font-size: 15px; border: none; margin-top: 10px; transition: all 0.2s; }
        .btn-login:hover { background: #2d7dd2; }
        .auth-link { color: #7a90b0; font-size: 13px; text-align: center; margin-top: 20px; }
        .auth-link a { color: #4a9eff; text-decoration: none; font-weight: 500; }
        .auth-link a:hover { text-decoration: underline; }
        .error-msg { color: #ff6b6b; font-size: 12px; margin-top: 4px; }
        .server-err { color: #ff6b6b; text-align: center; font-size: 13px; margin-top: 10px; }
        .divider { border-top: 1px solid #1e2a45; margin: 25px 0; }
    </style>
</head>
<body>
    <div class="auth-card">
        <div class="brand">
            <h2>Exa<span>Sync</span></h2>
            <p>Student Login — Online Examination System</p>
        </div>
        <form action="login" method="POST" onsubmit="return validateLogin()">
            <div class="form-group">
                <label class="form-label">EMAIL</label>
                <input type="text" id="inputUsername" class="form-control" placeholder="Enter your email" name="email"/>
                <div id="usernameError" class="error-msg"></div>
            </div>
            <div class="form-group">
                <label class="form-label">PASSWORD</label>
                <input type="password" id="inputPassword" class="form-control" placeholder="Enter your password" name="pass"/>
                <div id="passError" class="error-msg"></div>
            </div>
            <button type="submit" class="btn-login">Login to ExaSync</button>
            <div class="server-err">${err}</div>
        </form>
        <div class="divider"></div>
        <div class="auth-link">Don't have an account? <a href="register.jsp">Register here</a></div>
        <div class="auth-link mt-2">Are you an admin? <a href="adminlogin.jsp">Admin Login</a></div>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
