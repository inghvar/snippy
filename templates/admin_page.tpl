<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<link href="/static/main.css" rel="stylesheet" media="screen">
<!--Connect the appropriate languages ​​to be highlighted-->
<script src="static/syntaxhighlighter/scripts/shCore.js"></script>
<script src="static/syntaxhighlighter/scripts/shBrushCss.js"></script>
<script src="static/syntaxhighlighter/scripts/shBrushJScript.js"></script>
<script src="static/syntaxhighlighter/scripts/shBrushPhp.js"></script>
<script src="static/syntaxhighlighter/scripts/shBrushXml.js"></script>
<script src="static/syntaxhighlighter/scripts/shBrushSql.js"></script>
<script src="static/syntaxhighlighter/scripts/shBrushPython.js"></script>
<script src="static/syntaxhighlighter/scripts/shBrushBash.js"></script>
<script src="static/syntaxhighlighter/scripts/shBrushCss.js"></script>
<script src="static/syntaxhighlighter/scripts/shBrushPerl.js"></script>
<script src="static/syntaxhighlighter/scripts/shBrushPerl.js"></script>
<script src="static/syntaxhighlighter/scripts/shBrushAS3.js"></script>
<!--connect styles-->
<link href="static/syntaxhighlighter/styles/shCore.css" rel="stylesheet" type="text/css" />
<link href="static/syntaxhighlighter/styles/shThemeDefault.css" rel="stylesheet" type="text/css" />
<script>
    SyntaxHighlighter.all();
</script>

<script language="JavaScript1.2">



var ns6=document.getElementById&&!document.all?1:0

var head="display:''"
var folder=''

function expandit(curobj){
folder=ns6?curobj.nextSibling.nextSibling.style:document.all[curobj.sourceIndex+1].style
if (folder.display=="none")
folder.display=""
else
folder.display="none"
}


</script>

<title></title>
</head>
<body>
<form action="ausloggen" method="get">
    <input name="Ausloggen" type="submit" value="Sign out">
</form>
<br />
<a href="/content">
    <input type="button" name="action" value="Create new post" /> 
</a>
  <div id="admin">
<p> Content page: </p>
%for post in postes:
    <p class="pos" onClick="expandit(this)">
        <span id="title">Title:</span> {{post.title}},&nbsp<i>published:{{post.pub_date.strftime("%Y-%m-%d  %H:%M")}}</i>
    </p>
    <span class="pos_span" style="display:none" style=&{head};>
        Content: {{!post.content}}
        <p>
           <a href="/delete/{{post.id}}">
           <input type="button" name="action" value="Delete" /> 
           </a>
           <a href="/edit/{{post.id}}">
           <input type="button" name="action" value="Edit" /> 
           </a>
        </p>
    </span>
    <hr>
%end
<form action="admin_page" method="get">
go to page:
<select size="1" name="siten">
%for i in sp[1:]:
<option value="{{sp[i]}}">{{sp[i]}}</option>
%end
</select>
<input name="page:" type="submit" value="OK">
, this page {{pad}}
</form>
</div>
</body>
</html>