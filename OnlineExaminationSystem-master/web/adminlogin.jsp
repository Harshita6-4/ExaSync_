<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ExaSync | Admin Login</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <script>
        function validateAdmin() {
            var email = document.getElementById("inputEmail").value.trim();
            var pass = document.getElementById("inputPassword").value;
            var valid = true;
            document.getElementById("emailError").innerText = "";
            document.getElementById("passError").innerText = "";
            var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (email === "") { document.getElementById("emailError").innerText = "Email is required."; valid = false; }
            else if (!emailRegex.test(email)) { document.getElementById("emailError").innerText = "Enter a valid email."; valid = false; }
            if (pass === "") { document.getElementById("passError").innerText = "Password is required."; valid = false; }
            else if (pass.length < 8) { document.getElementById("passError").innerText = "Minimum 8 characters required."; valid = false; }
            else if (!/[A-Z]/.test(pass)) { document.getElementById("passError").innerText = "Must contain uppercase letter."; valid = false; }
            else if (!/[a-z]/.test(pass)) { document.getElementById("passError").innerText = "Must contain lowercase letter."; valid = false; }
            else if (!/\d/.test(pass)) { document.getElementById("passError").innerText = "Must contain a number."; valid = false; }
            else if (!/[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]/.test(pass)) { document.getElementById("passError").innerText = "Must contain a special character."; valid = false; }
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
        .admin-badge { background: rgba(255,107,107,0.1); border: 1px solid rgba(255,107,107,0.3); color: #ff6b6b; padding: 5px 14px; border-radius: 20px; font-size: 12px; font-weight: 500; display: inline-block; margin-bottom: 15px; }
        .form-label { color: #a0b0cc; font-size: 13px; font-weight: 500; margin-bottom: 6px; }
        .form-control { background: #0a0e1a; border: 1px solid #1e2a45; color: #e0e6f0; padding: 12px 15px; border-radius: 8px; font-size: 14px; }
        .form-control:focus { background: #0a0e1a; border-color: #ff6b6b; color: #e0e6f0; box-shadow: 0 0 0 3px rgba(255,107,107,0.15); }
        .form-control::placeholder { color: #3a4a65; }
        .btn-login { background: #ff6b6b; color: white; width: 100%; padding: 13px; border-radius: 8px; font-weight: 600; font-size: 15px; border: none; margin-top: 10px; transition: all 0.2s; }
        .btn-login:hover { background: #e05555; }
        .auth-link { color: #7a90b0; font-size: 13px; text-align: center; margin-top: 20px; }
        .auth-link a { color: #4a9eff; text-decoration: none; font-weight: 500; }
        .error-msg { color: #ff6b6b; font-size: 12px; margin-top: 4px; }
        .server-err { color: #ff6b6b; text-align: center; font-size: 13px; margin-top: 10px; }
        .divider { border-top: 1px solid #1e2a45; margin: 25px 0; }
    </style>
</head>
<body>
    <div class="auth-card">
        <div class="brand">
            <h2>Exa<span>Sync</span></h2>
            <div class="admin-badge">🔴 Administrator Access</div>
            <p>Admin Login — Restricted Area</p>
        </div>
        <form action="adminlogin" method="POST" onsubmit="return validateAdmin()">
            <div class="form-group">
                <label class="form-label">ADMIN EMAIL</label>
                <input type="email" id="inputEmail" class="form-control" placeholder="Enter admin email" name="email"/>
                <div id="emailError" class="error-msg"></div>
            </div>
            <div class="form-group">
                <label class="form-label">PASSWORD</label>
                <input type="password" id="inputPassword" class="form-control" placeholder="Enter admin password" name="pass"/>
                <div id="passError" class="error-msg"></div>
            </div>
            <button type="submit" class="btn-login">Admin Login</button>
            <div class="server-err">${err}</div>
        </form>
        <div class="divider"></div>
        <div class="auth-link">Student? <a href="login.jsp">Go to Student Login</a></div>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
