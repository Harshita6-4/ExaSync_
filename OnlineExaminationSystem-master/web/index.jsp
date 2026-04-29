<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ExaSync | Online Examination System</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; font-family: 'Inter', sans-serif; }
        body { background: #0a0e1a; color: #e0e6f0; }

     
        .navbar { background: rgba(10,14,26,0.95); border-bottom: 1px solid #1e2a45; padding: 16px 40px; position: fixed; width: 100%; top: 0; z-index: 1000; }
        .navbar-brand { font-size: 24px; font-weight: 700; color: #4a9eff !important; letter-spacing: 1px; }
        .navbar-brand span { color: #ffffff; }
        .nav-link { color: #a0b0cc !important; font-weight: 500; margin-left: 10px; transition: color 0.2s; }
        .nav-link:hover { color: #4a9eff !important; }
        .btn-nav { background: #4a9eff; color: white !important; padding: 8px 22px; border-radius: 6px; font-weight: 600; }
        .btn-nav:hover { background: #2d7dd2; }

        
        .hero { min-height: 100vh; display: flex; align-items: center; background: linear-gradient(135deg, #0a0e1a 0%, #0d1b35 50%, #0a0e1a 100%); padding-top: 80px; }
        .hero-badge { background: rgba(74,158,255,0.1); border: 1px solid rgba(74,158,255,0.3); color: #4a9eff; padding: 6px 16px; border-radius: 20px; font-size: 13px; font-weight: 500; display: inline-block; margin-bottom: 20px; }
        .hero h1 { font-size: 56px; font-weight: 700; line-height: 1.2; margin-bottom: 20px; }
        .hero h1 span { color: #4a9eff; }
        .hero p { font-size: 18px; color: #7a90b0; line-height: 1.7; margin-bottom: 35px; max-width: 520px; }
        .btn-primary-custom { background: #4a9eff; color: white; padding: 14px 35px; border-radius: 8px; font-weight: 600; font-size: 16px; text-decoration: none; border: none; display: inline-block; transition: all 0.2s; }
        .btn-primary-custom:hover { background: #2d7dd2; color: white; text-decoration: none; transform: translateY(-2px); }
        .btn-outline-custom { background: transparent; color: #4a9eff; padding: 14px 35px; border-radius: 8px; font-weight: 600; font-size: 16px; text-decoration: none; border: 2px solid #4a9eff; display: inline-block; margin-left: 15px; transition: all 0.2s; }
        .btn-outline-custom:hover { background: #4a9eff; color: white; text-decoration: none; }

        
        .hero-card { background: #0d1b35; border: 1px solid #1e2a45; border-radius: 16px; padding: 30px; }
        .hero-card .stat { border-bottom: 1px solid #1e2a45; padding: 15px 0; display: flex; justify-content: space-between; align-items: center; }
        .hero-card .stat:last-child { border-bottom: none; }
        .stat-label { color: #7a90b0; font-size: 14px; }
        .stat-value { color: #4a9eff; font-weight: 700; font-size: 18px; }
        .stat-badge { background: rgba(74,158,255,0.1); color: #4a9eff; padding: 3px 10px; border-radius: 20px; font-size: 12px; }

       
        .features { padding: 100px 0; background: #080c18; }
        .section-title { font-size: 36px; font-weight: 700; text-align: center; margin-bottom: 10px; }
        .section-sub { color: #7a90b0; text-align: center; margin-bottom: 60px; font-size: 16px; }
        .feature-card { background: #0d1b35; border: 1px solid #1e2a45; border-radius: 12px; padding: 30px; height: 100%; transition: all 0.3s; }
        .feature-card:hover { border-color: #4a9eff; transform: translateY(-5px); }
        .feature-icon { width: 50px; height: 50px; background: rgba(74,158,255,0.1); border-radius: 10px; display: flex; align-items: center; justify-content: center; font-size: 22px; margin-bottom: 20px; }
        .feature-card h5 { font-weight: 600; margin-bottom: 10px; }
        .feature-card p { color: #7a90b0; font-size: 14px; line-height: 1.6; }

       
        .stats { padding: 80px 0; background: #0a0e1a; border-top: 1px solid #1e2a45; border-bottom: 1px solid #1e2a45; }
        .stat-box { text-align: center; }
        .stat-box h2 { font-size: 48px; font-weight: 700; color: #4a9eff; }
        .stat-box p { color: #7a90b0; font-size: 15px; }

        
        footer { background: #080c18; border-top: 1px solid #1e2a45; padding: 40px 0; text-align: center; color: #7a90b0; font-size: 14px; }
        footer span { color: #4a9eff; font-weight: 600; }
    </style>
</head>
<body>
    
    <nav class="navbar navbar-expand-lg">
        <a class="navbar-brand" href="index.jsp">Exa<span>Sync</span></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#nav">
            <span style="color:white;">☰</span>
        </button>
        <div class="collapse navbar-collapse" id="nav">
            <ul class="navbar-nav ml-auto align-items-center">
                <li class="nav-item"><a class="nav-link" href="#features">Features</a></li>
                <li class="nav-item"><a class="nav-link" href="adminlogin.jsp">Admin</a></li>
                <li class="nav-item"><a class="nav-link btn-nav ml-2" href="login.jsp">Student Login</a></li>
            </ul>
        </div>
    </nav>

    
    <section class="hero">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6">
                    <div class="hero-badge">🎓 Server-Based Examination Platform</div>
                    <h1>Smarter Exams with <span>ExaSync</span></h1>
                    <p>A modern, secure, server-based online examination system designed for colleges and universities. Conduct Java exams effortlessly with real-time scoring.</p>
                    <a href="register.jsp" class="btn-primary-custom">Get Started</a>
                    <a href="login.jsp" class="btn-outline-custom">Sign In</a>
                </div>
                <div class="col-lg-5 offset-lg-1 mt-5 mt-lg-0">
                    <div class="hero-card">
                        <div class="stat">
                            <span class="stat-label">📋 Total Questions</span>
                            <span class="stat-value">50</span>
                        </div>
                        <div class="stat">
                            <span class="stat-label">⏱️ Exam Duration</span>
                            <span class="stat-value">50 Minutes</span>
                        </div>
                        <div class="stat">
                            <span class="stat-label">☕ Subject</span>
                            <span class="stat-value">Java Programming</span>
                        </div>
                        <div class="stat">
                            <span class="stat-label">🔒 Security</span>
                            <span class="stat-badge">Anti-Cheat Enabled</span>
                        </div>
                        <div class="stat">
                            <span class="stat-label">📊 Results</span>
                            <span class="stat-badge">Instant Scoring</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

  
    <section class="stats">
        <div class="container">
            <div class="row">
                <div class="col-md-3"><div class="stat-box"><h2>50</h2><p>Java Questions</p></div></div>
                <div class="col-md-3"><div class="stat-box"><h2>50</h2><p>Minutes Per Exam</p></div></div>
                <div class="col-md-3"><div class="stat-box"><h2>100%</h2><p>Server Based</p></div></div>
                <div class="col-md-3"><div class="stat-box"><h2>24/7</h2><p>Available</p></div></div>
            </div>
        </div>
    </section>

   
    <section class="features" id="features">
        <div class="container">
            <h2 class="section-title">Why <span style="color:#4a9eff;">ExaSync</span>?</h2>
            <p class="section-sub">Built for modern educational institutions that demand reliability and security</p>
            <div class="row">
                <div class="col-md-4 mb-4">
                    <div class="feature-card">
                        <div class="feature-icon">🔐</div>
                        <h5>Secure Authentication</h5>
                        <p>Strong password policy with uppercase, lowercase, numbers and special characters enforced for all users.</p>
                    </div>
                </div>
                <div class="col-md-4 mb-4">
                    <div class="feature-card">
                        <div class="feature-icon">⏱️</div>
                        <h5>Auto-Timed Exams</h5>
                        <p>Built-in countdown timer with automatic submission when time runs out. No manual intervention needed.</p>
                    </div>
                </div>
                <div class="col-md-4 mb-4">
                    <div class="feature-card">
                        <div class="feature-icon">🛡️</div>
                        <h5>Anti-Cheat System</h5>
                        <p>Fullscreen enforcement, right-click disabled, keyboard shortcuts blocked to prevent malpractice.</p>
                    </div>
                </div>
                <div class="col-md-4 mb-4">
                    <div class="feature-card">
                        <div class="feature-icon">📊</div>
                        <h5>Instant Results</h5>
                        <p>Automated evaluation and real-time scoring. Admin can view all student results with Pass/Fail status.</p>
                    </div>
                </div>
                <div class="col-md-4 mb-4">
                    <div class="feature-card">
                        <div class="feature-icon">👤</div>
                        <h5>One Attempt Policy</h5>
                        <p>Each student can only take the exam once, ensuring fairness and integrity of the examination process.</p>
                    </div>
                </div>
                <div class="col-md-4 mb-4">
                    <div class="feature-card">
                        <div class="feature-icon">🖥️</div>
                        <h5>Server Based</h5>
                        <p>Runs on Apache Tomcat server with MySQL database. Supports multiple concurrent users simultaneously.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <footer>
        <p>&copy; 2026 <span>ExaSync</span> — Online Server-Based Examination System. All Rights Reserved.</p>
    </footer>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
