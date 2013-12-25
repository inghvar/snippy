<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<link href="/static/main.css" rel="stylesheet" media="screen">
<title>Meine Snippets Seite</title>
</head>
<body>
  <div id="ein">
    <form id="form1" action="/login" method="post">
      <p>Username</p> <input type="text" name="username" maxlength="40" class="eingang" />

      <p>Password</p><input type="password" name="password" maxlength="40" class="eingang" />
      <p id="sub">
        <input value="Log in" type="submit" />
      </p>
    </form>
  </div>
</body>
</html>