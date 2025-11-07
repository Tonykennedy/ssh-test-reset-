<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Terminal</title>
  <style>
    body { background: #0d1117; color: #21ff60; font-family: Consolas, monospace; margin: 0; }
    .container { width: 320px; margin: 10vh auto; background: #161b22; padding: 22px; border-radius: 10px; }
    label, input, button { display: block; width: 100%; margin-bottom:10px; }
    input, button { padding:9px; border-radius:5px; border: none; }
    button { background:#e30000; color:#fff; font-weight:bold; cursor:pointer; }
    .terminal { width: 95vw; max-width: 650px; margin: 12vh auto; background: #21262d; border-radius: 10px; padding:20px; font-size:1.1em; min-height:180px; }
    .cursor { display:inline-block; width:10px; height:1.3em; background:#21ff60; animation:blink .7s steps(1) infinite; vertical-align:bottom; }
    @keyframes blink { 0%,49%{opacity:1;} 50%,100%{opacity:0;} }
    .hacked { color: #ff3838; font-weight: bold; text-shadow: 0 0 6px #ff1414; margin: 18px 0; font-size:1.3em; }
  </style>
</head>
<body>
  <div class="container" id="login-container">
    <h2>Login</h2>
    <form id="loginForm">
      <label>Username:</label><input type="text" required>
      <label>Password:</label><input type="password" required>
      <button type="submit">Login</button>
    </form>
  </div>
  <div class="terminal" id="terminal" style="display:none;"></div>
  <script>
    const lines = [
      "C:\\> run exploit.exe",
      "Exploit started...",
      "Admin access granted...",
      "Remote shell opened.",
      ">>> SYSTEM BREACH <<<",
      "Injecting ransomware...",
      "Log: SYSTEM IS HACKED"
    ];
    document.getElementById('loginForm').onsubmit = function(e) {
      e.preventDefault();
      document.getElementById('login-container').style.display = "none";
      const term = document.getElementById('terminal');
      term.style.display = "block";
      term.innerHTML = "";
      let i = 0;
      function typeLine() {
        if(i < lines.length) {
          term.innerHTML += lines[i++] + "<br>";
          setTimeout(typeLine, 500);
        } else {
          term.innerHTML += `<div class="hacked">SYSTEM IS HACKED</div><span class='cursor'></span>`;
        }
      }
      typeLine();
    }
  </script>
</body>
</html>
