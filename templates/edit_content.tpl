<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8" />
<link href="/static/main.css" rel="stylesheet" media="screen">
<script type="text/javascript" src="/static/ckeditor/ckeditor.js"></script>
<title>Editing Post {{title}}</title>
</head>

<body>

<a href="/admin">
    <input type="button" name="action" value="Back" /> 
</a>

<div id="content">
    
<form action="" method="POST">

<p>Title</p><input type="text" name="title" maxlength="50" value="{{title}}" />

<p>Content</p>
<!--
<input type="text" name="content" maxlength="40" />
-->
<textarea name="editor1" cols="50" rows="10" wrap="off" />{{content}}</textarea>

<p><input type="submit" name="update_post" value="Update" /></p>
</form>
</div>
<script type="text/javascript">
    CKEDITOR.replace('editor1');
</script>
</body>
</html>