<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ExaSync | Student Register</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <script>
        function validateForm() {
            clearErrors();
            var valid = true;
            var name = document.getElementById("inputName").value.trim();
            var email = document.getElementById("inputEmail").value.trim();
            var pass = document.getElementById("inputPassword").value;
            var confirmPass = document.getElementById("inputConfirmPassword").value;
            if (name === "") { showError("nameError", "Name is required."); valid = false; }
            else if (name.length < 3) { showError("nameError", "Name must be at least 3 characters."); valid = false; }
            else if (!/^[a-zA-Z\s]+$/.test(name)) { showError("nameError", "Name can only contain letters."); valid = false; }
            var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (email === "") { showError("emailError", "Email is required."); valid = false; }
            else if (!emailRegex.test(email)) { showError("emailError", "Enter a valid email address."); valid = false; }
            if (pass === "") { showError("passError", "Password is required."); valid = false; }
            else if (pass.length < 8) { showError("passError", "Minimum 8 characters required."); valid = false; }
            else if (!/[A-Z]/.test(pass)) { showError("passError", "Must contain at least one uppercase letter."); valid = false; }
            else if (!/[a-z]/.test(pass)) { showError("passError", "Must contain at least one lowercase letter."); valid = false; }
            else if (!/\d/.test(pass)) { showError("passError", "Must contain at least one number."); valid = false; }
            else if (!/[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]/.test(pass)) { showError("passError", "Must contain at least one special character."); valid = false; }
            if (confirmPass === "") { showError("confirmPassError", "Please confirm your password."); valid = false; }
            else if (pass !== confirmPass) { showError("confirmPassError", "Passwords do not match."); valid = false; }
            return valid;
        }
        function showError(id, msg) { document.getElementById(id).innerText = msg; }
        function clearErrors() {
            ["nameError","emailError","passError","confirmPassError"].forEach(function(id){ document.getElementById(id).innerText = ""; });
        }
        function checkStrength() {
            var pass = document.getElementById("inputPassword").value;
            var bar = document.getElementById("strengthBar");
            var label = document.getElementById("strengthLabel");
            if (pass.length === 0) { bar.style.width="0%"; label.innerText=""; }
            else if (pass.length < 8 || !/[A-Z]/.test(pass) || !/[a-z]/.test(pass)) { bar.style.width="33%"; bar.className="progress-bar bg-danger"; label.innerText="Weak"; label.style.color="#ff6b6b"; }
            else if (!/\d/.test(pass) || !/[!@#$%^&*]/.test(pass)) { bar.style.width="66%"; bar.className="progress-bar bg-warning"; label.innerText="Medium"; label.style.color="#ffc107"; }
            else { bar.style.width="100%"; bar.className="progress-bar bg-success"; label.innerText="Strong"; label.style.color="#28a745"; }
        }
    </script>
    <style>
        * { font-family: 'Inter', sans-serif; }
        body { background: #0a0e1a; min-height: 100vh; display: flex; align-items: center; justify-content: center; padding: 40px 0; }
        .auth-card { background: #0d1b35; border: 1px solid #1e2a45; border-radius: 16px; padding: 45px 40px; width: 100%; max-width: 440px; }
        .brand { text-align: center; margin-bottom: 30px; }
        .brand h2 { color: #4a9eff; font-weight: 700; font-size: 28px; }
        .brand h2 span { color: white; }
        .brand p { color: #7a90b0; font-size: 14px; margin-top: 5px; }
        .form-label { color: #a0b0cc; font-size: 13px; font-weight: 500; margin-bottom: 6px; }
        .form-control { background: #0a0e1a; border: 1px solid #1e2a45; color: #e0e6f0; padding: 12px 15px; border-radius: 8px; font-size: 14px; }
        .form-control:focus { background: #0a0e1a; border-color: #4a9eff; color: #e0e6f0; box-shadow: 0 0 0 3px rgba(74,158,255,0.15); }
        .form-control::placeholder { color: #3a4a65; }
        .btn-register { background: #4a9eff; color: white; width: 100%; padding: 13px; border-radius: 8px; font-weight: 600; font-size: 15px; border: none; margin-top: 10px; transition: all 0.2s; }
        .btn-register:hover { background: #2d7dd2; }
        .auth-link { color: #7a90b0; font-size: 13px; text-align: center; margin-top: 20px; }
        .auth-link a { color: #4a9eff; text-decoration: none; font-weight: 500; }
        .error-msg { color: #ff6b6b; font-size: 12px; margin-top: 4px; }
        .server-err { color: #ff6b6b; text-align: center; font-size: 13px; margin-top: 10px; }
        .divider { border-top: 1px solid #1e2a45; margin: 25px 0; }
        .pass-hint { color: #7a90b0; font-size: 11px; margin-top: 5px; }
        .progress { height: 4px; background: #1e2a45; border-radius: 2px; margin-top: 6px; }
    </style>
</head>
<body>
    <div class="auth-card">
        <div class="brand">
            <h2>Exa<span>Sync</span></h2>
            <p>Create Student Account</p>
        </div>
        <form action="register" method="POST" onsubmit="return validateForm()">
            <div class="form-group">
                <label class="form-label">FULL NAME</label>
                <input type="text" id="inputName" class="form-control" placeholder="Enter your full name" name="name"/>
                <div id="nameError" class="error-msg"></div>
            </div>
            <div class="form-group">
                <label class="form-label">EMAIL ADDRESS</label>
                <input type="email" id="inputEmail" class="form-control" placeholder="Enter your email" name="email"/>
                <div id="emailError" class="error-msg"></div>
            </div>
            <div class="form-group">
                <label class="form-label">PASSWORD</label>
                <input type="password" id="inputPassword" class="form-control" placeholder="Create a strong password" name="pass" oninput="checkStrength()"/>
                <div class="progress"><div id="strengthBar" class="progress-bar" style="width:0%;transition:width 0.3s;"></div></div>
                <small id="strengthLabel" class="pass-hint"></small>
                <div class="pass-hint">Must have: 8+ chars, uppercase, lowercase, number, special char (!@#$%)</div>
                <div id="passError" class="error-msg"></div>
            </div>
            <div class="form-group">
                <label class="form-label">CONFIRM PASSWORD</label>
                <input type="password" id="inputConfirmPassword" class="form-control" placeholder="Confirm your password"/>
                <div id="confirmPassError" class="error-msg"></div>
            </div>
            <button type="submit" class="btn-register">Create Account</button>
            <div class="server-err">${ermsg}</div>
        </form>
        <div class="divider"></div>
        <div class="auth-link">Already have an account? <a href="login.jsp">Login here</a></div>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
