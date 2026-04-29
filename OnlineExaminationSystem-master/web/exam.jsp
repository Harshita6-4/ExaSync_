<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>ExaSync | Java Examination</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Sora:wght@400;500;600;700&family=JetBrains+Mono:wght@400;500&display=swap" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <style>
        :root {
            --bg: #0b0f1a;
            --surface: #131929;
            --surface2: #1a2236;
            --border: #232f47;
            --border2: #2d3e5a;
            --text: #e8edf5;
            --muted: #6b7fa3;
            --accent: #3d7fff;
            --accent2: #5b95ff;

            --saved: #22c55e;
            --saved-bg: rgba(34,197,94,0.12);
            --saved-border: rgba(34,197,94,0.35);

            --review: #f59e0b;
            --review-bg: rgba(245,158,11,0.12);
            --review-border: rgba(245,158,11,0.35);

            --skipped: #6b7fa3;
            --skipped-bg: rgba(107,127,163,0.08);
            --skipped-border: rgba(107,127,163,0.25);

            --danger: #ef4444;
        }

        * { box-sizing: border-box; margin: 0; padding: 0; }
        body { font-family: 'Sora', sans-serif; background: var(--bg); color: var(--text); min-height: 100vh; display: flex; flex-direction: column; }

        /* ── TOP BAR ── */
        .topbar {
            position: fixed; top: 0; left: 0; right: 0; z-index: 100;
            height: 58px;
            background: var(--surface);
            border-bottom: 1px solid var(--border);
            display: flex; align-items: center; justify-content: space-between;
            padding: 0 28px;
        }
        .brand { font-size: 18px; font-weight: 700; color: var(--accent2); letter-spacing: -0.5px; }
        .brand span { color: var(--text); }
        .topbar-center { display: flex; align-items: center; gap: 16px; }
        .progress-wrap { display: flex; align-items: center; gap: 10px; font-size: 13px; color: var(--muted); }
        .prog-bar { width: 180px; height: 5px; background: var(--border); border-radius: 99px; overflow: hidden; }
        .prog-fill { height: 100%; background: var(--accent); border-radius: 99px; transition: width 0.3s; }
        .timer {
            font-family: 'JetBrains Mono', monospace;
            font-size: 15px; font-weight: 500;
            color: var(--text);
            background: var(--surface2);
            border: 1px solid var(--border);
            border-radius: 8px;
            padding: 6px 14px;
            min-width: 90px; text-align: center;
            transition: all 0.3s;
        }
        .timer.warn { color: var(--review); border-color: var(--review-border); background: var(--review-bg); }
        .timer.danger { color: var(--danger); border-color: rgba(239,68,68,0.35); background: rgba(239,68,68,0.08); animation: pulse 1s infinite; }
        @keyframes pulse { 0%,100%{opacity:1} 50%{opacity:0.6} }

        /* ── MAIN LAYOUT ── */
        .main { margin-top: 58px; display: flex; flex: 1; height: calc(100vh - 58px); overflow: hidden; }

        /* ── SIDEBAR ── */
        .sidebar {
            width: 280px; min-width: 280px;
            background: var(--surface);
            border-right: 1px solid var(--border);
            display: flex; flex-direction: column;
            overflow-y: auto;
        }
        .sidebar-header { padding: 20px 20px 14px; border-bottom: 1px solid var(--border); }
        .sidebar-header h3 { font-size: 13px; font-weight: 600; color: var(--muted); text-transform: uppercase; letter-spacing: 1px; margin-bottom: 14px; }
        .legend { display: flex; flex-direction: column; gap: 7px; }
        .legend-item { display: flex; align-items: center; gap: 8px; font-size: 12px; color: var(--muted); }
        .dot { width: 10px; height: 10px; border-radius: 3px; flex-shrink: 0; }
        .dot-saved { background: var(--saved); }
        .dot-review { background: var(--review); }
        .dot-skipped { background: var(--border2); }
        .dot-current { background: var(--accent); }

        .palette-label { padding: 14px 20px 8px; font-size: 11px; font-weight: 600; color: var(--muted); text-transform: uppercase; letter-spacing: 1px; }
        .palette-grid { display: grid; grid-template-columns: repeat(5, 1fr); gap: 6px; padding: 0 20px 20px; }
        .q-btn {
            aspect-ratio: 1;
            border-radius: 7px;
            border: 1.5px solid var(--border);
            background: var(--surface2);
            color: var(--muted);
            font-size: 12px; font-weight: 500;
            cursor: pointer;
            transition: all 0.15s;
            display: flex; align-items: center; justify-content: center;
            position: relative;
        }
        .q-btn:hover { border-color: var(--accent); color: var(--accent2); }
        .q-btn.current { border-color: var(--accent); background: rgba(61,127,255,0.2); color: var(--accent2); font-weight: 700; }
        .q-btn.saved { border-color: var(--saved-border); background: var(--saved-bg); color: var(--saved); }
        .q-btn.review { border-color: var(--review-border); background: var(--review-bg); color: var(--review); }
        .q-btn.review::after { content: ''; position: absolute; top: 3px; right: 3px; width: 5px; height: 5px; border-radius: 50%; background: var(--review); }
        .q-btn.saved.review { border-color: var(--review-border); background: var(--review-bg); color: var(--review); }
        .sidebar-summary { padding: 14px 20px; border-top: 1px solid var(--border); margin-top: auto; display: grid; grid-template-columns: 1fr 1fr; gap: 8px; }
        .summary-chip { background: var(--surface2); border: 1px solid var(--border); border-radius: 8px; padding: 10px; text-align: center; }
        .summary-chip .count { font-size: 20px; font-weight: 700; color: var(--text); }
        .summary-chip .label { font-size: 10px; color: var(--muted); text-transform: uppercase; letter-spacing: 0.5px; margin-top: 2px; }
        .summary-chip.c-green .count { color: var(--saved); }
        .summary-chip.c-amber .count { color: var(--review); }

        /* ── QUESTION AREA ── */
        .q-area {
            flex: 1; display: flex; flex-direction: column; overflow: hidden;
        }
        .q-scroll { flex: 1; overflow-y: auto; padding: 36px 48px 24px; }

        .q-header { display: flex; align-items: center; gap: 12px; margin-bottom: 10px; }
        .q-number { font-size: 12px; font-weight: 600; color: var(--accent2); background: rgba(61,127,255,0.12); border: 1px solid rgba(61,127,255,0.25); border-radius: 6px; padding: 4px 12px; }
        .status-flag { font-size: 11px; font-weight: 500; padding: 4px 10px; border-radius: 6px; }
        .status-flag.saved { color: var(--saved); background: var(--saved-bg); border: 1px solid var(--saved-border); }
        .status-flag.review { color: var(--review); background: var(--review-bg); border: 1px solid var(--review-border); }
        .status-flag.unanswered { color: var(--muted); background: var(--skipped-bg); border: 1px solid var(--skipped-border); }

        .q-text { font-size: 18px; font-weight: 500; color: var(--text); line-height: 1.6; margin-bottom: 28px; max-width: 720px; }

        .options { display: flex; flex-direction: column; gap: 10px; max-width: 720px; }
        .option {
            display: flex; align-items: center; gap: 14px;
            padding: 14px 18px;
            border-radius: 10px;
            border: 1.5px solid var(--border);
            background: var(--surface2);
            cursor: pointer;
            transition: all 0.15s;
            user-select: none;
        }
        .option:hover { border-color: var(--border2); background: var(--surface); }
        .option.selected { border-color: var(--accent); background: rgba(61,127,255,0.12); }
        .option.selected .opt-key { background: var(--accent); color: #fff; border-color: var(--accent); }
        .opt-key {
            width: 30px; height: 30px; flex-shrink: 0;
            border-radius: 7px;
            border: 1.5px solid var(--border2);
            background: var(--surface);
            color: var(--muted);
            font-size: 12px; font-weight: 600;
            display: flex; align-items: center; justify-content: center;
            transition: all 0.15s;
        }
        .opt-text { font-size: 14px; color: var(--text); line-height: 1.5; }
        input[type="radio"] { display: none; }

        /* ── BOTTOM CONTROLS ── */
        .q-controls {
            padding: 18px 48px;
            border-top: 1px solid var(--border);
            background: var(--surface);
            display: flex; align-items: center; justify-content: space-between; gap: 12px;
        }
        .ctrl-left { display: flex; align-items: center; gap: 8px; }
        .ctrl-right { display: flex; align-items: center; gap: 8px; }

        .btn {
            padding: 10px 20px; border-radius: 8px; font-size: 13px; font-weight: 600;
            cursor: pointer; border: none; font-family: 'Sora', sans-serif;
            transition: all 0.15s; display: inline-flex; align-items: center; gap: 6px;
        }
        .btn-ghost { background: transparent; border: 1.5px solid var(--border2); color: var(--muted); }
        .btn-ghost:hover { border-color: var(--text); color: var(--text); }
        .btn-review {
            background: var(--review-bg); border: 1.5px solid var(--review-border); color: var(--review);
        }
        .btn-review:hover { background: rgba(245,158,11,0.2); }
        .btn-review.active { background: var(--review-bg); border-color: var(--review); }
        .btn-save { background: var(--saved-bg); border: 1.5px solid var(--saved-border); color: var(--saved); }
        .btn-save:hover { background: rgba(34,197,94,0.2); }
        .btn-primary { background: var(--accent); color: #fff; border: none; }
        .btn-primary:hover { background: var(--accent2); }
        .btn-danger { background: rgba(239,68,68,0.1); border: 1.5px solid rgba(239,68,68,0.35); color: var(--danger); }
        .btn-danger:hover { background: rgba(239,68,68,0.2); }
        .btn-clear { background: transparent; border: 1.5px solid var(--border); color: var(--muted); font-size: 11px; padding: 7px 14px; }
        .btn-clear:hover { border-color: var(--danger); color: var(--danger); }

        .nav-arrow { padding: 10px 14px; font-size: 15px; }

        /* ── SUBMIT MODAL ── */
        .modal-overlay {
            display: none; position: fixed; inset: 0; z-index: 500;
            background: rgba(0,0,0,0.7);
            align-items: center; justify-content: center;
        }
        .modal-overlay.open { display: flex; }
        .modal-box {
            background: var(--surface);
            border: 1px solid var(--border2);
            border-radius: 16px;
            padding: 36px 40px;
            width: 420px; max-width: 90vw;
        }
        .modal-box h2 { font-size: 20px; font-weight: 700; margin-bottom: 8px; }
        .modal-box p { font-size: 14px; color: var(--muted); margin-bottom: 24px; line-height: 1.6; }
        .modal-stats { display: grid; grid-template-columns: 1fr 1fr 1fr; gap: 10px; margin-bottom: 28px; }
        .mstat { background: var(--surface2); border: 1px solid var(--border); border-radius: 10px; padding: 14px; text-align: center; }
        .mstat .mn { font-size: 22px; font-weight: 700; }
        .mstat .ml { font-size: 11px; color: var(--muted); text-transform: uppercase; letter-spacing: 0.5px; margin-top: 3px; }
        .mstat.ms .mn { color: var(--saved); }
        .mstat.mr .mn { color: var(--review); }
        .mstat.mu .mn { color: var(--muted); }
        .modal-actions { display: flex; gap: 10px; }
        .modal-actions .btn { flex: 1; justify-content: center; }

        /* ── SCROLLBAR ── */
        ::-webkit-scrollbar { width: 5px; }
        ::-webkit-scrollbar-track { background: transparent; }
        ::-webkit-scrollbar-thumb { background: var(--border2); border-radius: 99px; }

        /* ── ANIM ── */
        .q-slide { animation: slideIn 0.2s ease; }
        @keyframes slideIn { from { opacity: 0; transform: translateY(8px); } to { opacity: 1; transform: translateY(0); } }
    </style>
</head>

<c:set var="selectedexam" value="java" scope="session" />
<body>
    <%
        response.setHeader("Cache-Control", "private, no-store, no-cache, must-revalidate");
        if(session.getAttribute("name") == null){
            response.sendRedirect("login.jsp");
        }
    %>

    <sql:setDataSource driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/online_exam" user="root" password=""></sql:setDataSource>
    <sql:query var="mcq">
        select * from java;
    </sql:query>

    <%-- Build JS array of questions from JSTL --%>
    <script>
    var QUESTIONS = [];
    </script>
    <c:set var="questioncnt" value="0" />
    <c:forEach var="mcqexam" items="${mcq.rows}">
        <c:set var="questioncnt" value="${questioncnt+1}" scope="page" />
        <script>
        QUESTIONS.push({
            qno: "${mcqexam.qno}",
            num: ${questioncnt},
            text: `<c:out value="${mcqexam.question}" escapeXml="false"/>`,
            options: [
                { key: "A", val: `<c:out value="${mcqexam.a1}" escapeXml="false"/>` },
                { key: "B", val: `<c:out value="${mcqexam.a2}" escapeXml="false"/>` },
                { key: "C", val: `<c:out value="${mcqexam.a3}" escapeXml="false"/>` },
                { key: "D", val: `<c:out value="${mcqexam.a4}" escapeXml="false"/>` }
            ]
        });
        </script>
    </c:forEach>

    <!-- TOP BAR -->
    <div class="topbar">
        <div class="brand">Exa<span>Sync</span></div>
        <div class="topbar-center">
            <div class="progress-wrap">
                <span id="progText">1 / <span id="totalQ">?</span></span>
                <div class="prog-bar"><div class="prog-fill" id="progFill" style="width:0%"></div></div>
            </div>
        </div>
        <div id="timerDisplay" class="timer">50:00</div>
    </div>

    <!-- MAIN -->
    <div class="main">
        <!-- SIDEBAR -->
        <div class="sidebar">
            <div class="sidebar-header">
                <h3>Question Map</h3>
                <div class="legend">
                    <div class="legend-item"><div class="dot dot-current"></div>Current</div>
                    <div class="legend-item"><div class="dot dot-saved"></div>Answered</div>
                    <div class="legend-item"><div class="dot dot-review"></div>Marked for Review</div>
                    <div class="legend-item"><div class="dot dot-skipped"></div>Not Visited</div>
                </div>
            </div>
            <div class="palette-label">All Questions</div>
            <div class="palette-grid" id="palette"></div>
            <div class="sidebar-summary">
                <div class="summary-chip c-green"><div class="count" id="cnt-saved">0</div><div class="label">Answered</div></div>
                <div class="summary-chip c-amber"><div class="count" id="cnt-review">0</div><div class="label">For Review</div></div>
                <div class="summary-chip"><div class="count" id="cnt-skip">0</div><div class="label">Skipped</div></div>
                <div class="summary-chip"><div class="count" id="cnt-left">0</div><div class="label">Remaining</div></div>
            </div>
        </div>

        <!-- QUESTION AREA -->
        <div class="q-area">
            <div class="q-scroll" id="qScroll">
                <div id="qContent" class="q-slide"></div>
            </div>

            <!-- CONTROLS -->
            <div class="q-controls">
                <div class="ctrl-left">
                    <button class="btn btn-ghost nav-arrow" id="btnPrev" onclick="navigate(-1)">&#8592;</button>
                    <button class="btn btn-review" id="btnReview" onclick="toggleReview()">
                        <span id="reviewIcon">&#9873;</span> Mark for Review
                    </button>
                    <button class="btn btn-clear" onclick="clearAnswer()">Clear</button>
                </div>
                <div class="ctrl-right">
                    <button class="btn btn-save" id="btnSave" onclick="saveAndNext()">Save &amp; Next &#8594;</button>
                    <button class="btn btn-primary" onclick="confirmSubmit()" id="btnSubmitTop">Submit Exam</button>
                </div>
            </div>
        </div>
    </div>

    <!-- SUBMIT MODAL -->
    <div class="modal-overlay" id="submitModal">
        <div class="modal-box">
            <h2>Submit Examination?</h2>
            <p>Review your progress below before finalising. Once submitted, you cannot make changes.</p>
            <div class="modal-stats">
                <div class="mstat ms"><div class="mn" id="m-saved">0</div><div class="ml">Answered</div></div>
                <div class="mstat mr"><div class="mn" id="m-review">0</div><div class="ml">For Review</div></div>
                <div class="mstat mu"><div class="mn" id="m-skip">0</div><div class="ml">Unanswered</div></div>
            </div>
            <div class="modal-actions">
                <button class="btn btn-ghost" onclick="closeModal()">Go Back</button>
                <button class="btn btn-danger" onclick="doSubmit()">Confirm Submit</button>
            </div>
        </div>
    </div>

    <!-- HIDDEN FORM -->
    <form action="evaluate" method="POST" id="examForm" style="display:none">
        <div id="hiddenInputs"></div>
    </form>

    <script>
    var totalQ = QUESTIONS.length;
    var currentIdx = 0;
    var answers = {};       // qno -> optionValue
    var reviewed = {};      // qno -> bool
    var totalSeconds = 50 * 60;

    document.getElementById("totalQ").textContent = totalQ;

    // ── TIMER ──
    function updateTimer() {
        var m = Math.floor(totalSeconds / 60), s = totalSeconds % 60;
        var el = document.getElementById("timerDisplay");
        el.textContent = (m < 10 ? "0" : "") + m + ":" + (s < 10 ? "0" : "") + s;
        el.className = "timer";
        if (totalSeconds <= 60) el.classList.add("danger");
        else if (totalSeconds <= 300) el.classList.add("warn");
        if (totalSeconds <= 0) { alert("Time is up!"); doSubmit(); return; }
        totalSeconds--;
        setTimeout(updateTimer, 1000);
    }
    updateTimer();

    // ── RENDER QUESTION ──
    function renderQuestion(idx) {
        var q = QUESTIONS[idx];
        var qno = q.qno;
        var ans = answers[qno];
        var isReview = reviewed[qno];

        // status badge
        var statusHTML = "";
        if (ans && isReview) statusHTML = '<span class="status-flag review">&#9873; Marked for Review</span>';
        else if (ans) statusHTML = '<span class="status-flag saved">&#10003; Answered</span>';
        else if (isReview) statusHTML = '<span class="status-flag review">&#9873; Marked for Review</span>';
        else statusHTML = '<span class="status-flag unanswered">Not Answered</span>';

        var optHTML = q.options.map(function(o) {
            var sel = (ans === o.val) ? " selected" : "";
            return '<div class="option' + sel + '" onclick="selectOption(this, \'' + o.val.replace(/'/g, "\\'") + '\')">' +
                '<div class="opt-key">' + o.key + '</div>' +
                '<div class="opt-text">' + o.val + '</div>' +
                '</div>';
        }).join("");

        var html = '<div class="q-header">' +
            '<span class="q-number">Q ' + q.num + ' of ' + totalQ + '</span>' +
            statusHTML +
            '</div>' +
            '<div class="q-text">' + q.text + '</div>' +
            '<div class="options">' + optHTML + '</div>';

        var content = document.getElementById("qContent");
        content.innerHTML = html;
        content.className = "q-slide";
        void content.offsetWidth;

        // update review btn style
        var rb = document.getElementById("btnReview");
        if (isReview) { rb.classList.add("active"); }
        else { rb.classList.remove("active"); }

        // scroll top
        document.getElementById("qScroll").scrollTop = 0;

        updatePalette();
        updateProgress();
        updateSummary();
    }

    function selectOption(el, val) {
        document.querySelectorAll(".option").forEach(function(o){ o.classList.remove("selected"); });
        el.classList.add("selected");
        answers[QUESTIONS[currentIdx].qno] = val;
        updatePalette();
        updateSummary();

        // refresh status badge without full re-render
        var qno = QUESTIONS[currentIdx].qno;
        var isReview = reviewed[qno];
        var flag = document.querySelector(".status-flag");
        if (flag) {
            if (isReview) { flag.className = "status-flag review"; flag.innerHTML = "&#9873; Marked for Review"; }
            else { flag.className = "status-flag saved"; flag.innerHTML = "&#10003; Answered"; }
        }
    }

    function clearAnswer() {
        delete answers[QUESTIONS[currentIdx].qno];
        renderQuestion(currentIdx);
    }

    function toggleReview() {
        var qno = QUESTIONS[currentIdx].qno;
        reviewed[qno] = !reviewed[qno];
        renderQuestion(currentIdx);
    }

    function saveAndNext() {
        if (currentIdx < totalQ - 1) { currentIdx++; renderQuestion(currentIdx); }
        else { confirmSubmit(); }
    }

    function navigate(dir) {
        var next = currentIdx + dir;
        if (next >= 0 && next < totalQ) { currentIdx = next; renderQuestion(currentIdx); }
    }

    // ── PALETTE ──
    function buildPalette() {
        var grid = document.getElementById("palette");
        grid.innerHTML = "";
        QUESTIONS.forEach(function(q, i) {
            var btn = document.createElement("button");
            btn.className = "q-btn";
            btn.textContent = i + 1;
            btn.onclick = (function(idx){ return function(){ currentIdx = idx; renderQuestion(currentIdx); }; })(i);
            grid.appendChild(btn);
        });
    }

    function updatePalette() {
        var btns = document.querySelectorAll(".q-btn");
        QUESTIONS.forEach(function(q, i) {
            var b = btns[i];
            b.className = "q-btn";
            var qno = q.qno;
            if (i === currentIdx) b.classList.add("current");
            if (answers[qno] && reviewed[qno]) b.classList.add("review");
            else if (answers[qno]) b.classList.add("saved");
            else if (reviewed[qno]) b.classList.add("review");
        });
    }

    function updateProgress() {
        var pct = ((currentIdx + 1) / totalQ) * 100;
        document.getElementById("progFill").style.width = pct + "%";
        document.getElementById("progText").innerHTML = (currentIdx + 1) + ' / <span id="totalQ">' + totalQ + '</span>';
    }

    function updateSummary() {
        var saved = 0, rev = 0, skip = 0;
        QUESTIONS.forEach(function(q) {
            var qno = q.qno;
            if (answers[qno]) saved++;
            if (reviewed[qno]) rev++;
            if (!answers[qno] && !reviewed[qno]) skip++;
        });
        document.getElementById("cnt-saved").textContent = saved;
        document.getElementById("cnt-review").textContent = rev;
        document.getElementById("cnt-skip").textContent = skip;
        document.getElementById("cnt-left").textContent = totalQ - saved;
    }

    // ── MODAL ──
    function confirmSubmit() {
        var saved = 0, rev = 0, skip = 0;
        QUESTIONS.forEach(function(q) {
            if (answers[q.qno]) saved++;
            if (reviewed[q.qno]) rev++;
            if (!answers[q.qno] && !reviewed[q.qno]) skip++;
        });
        document.getElementById("m-saved").textContent = saved;
        document.getElementById("m-review").textContent = rev;
        document.getElementById("m-skip").textContent = skip;
        document.getElementById("submitModal").classList.add("open");
    }
    function closeModal() { document.getElementById("submitModal").classList.remove("open"); }

    function doSubmit() {
        var container = document.getElementById("hiddenInputs");
        container.innerHTML = "";
        QUESTIONS.forEach(function(q) {
            if (answers[q.qno]) {
                var inp = document.createElement("input");
                inp.type = "hidden";
                inp.name = q.qno;
                inp.value = answers[q.qno];
                container.appendChild(inp);
            }
        });
        window.onbeforeunload = null;
        document.getElementById("examForm").submit();
    }

    window.onbeforeunload = function() { return "Are you sure you want to leave? Your exam will be lost."; };

    // ── INIT ──
    buildPalette();
    renderQuestion(0);

    // ── ANTI-CHEAT ──
    document.addEventListener("contextmenu", function(e){ e.preventDefault(); });
    document.addEventListener("keydown", function(e){
        if (e.key === "F11" || (e.ctrlKey && ["w","t","n"].includes(e.key))) e.preventDefault();
    });
    </script>
</body>
</html>
