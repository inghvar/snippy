<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
  <title>Blog - Posts</title>
</head>
   <body>
     <div id="menu" class="" leftmargin="0">
       <ul><a href="/new">Create New Post</a></ul>
     </div> 
     
     <div leftmargin="100">
       <form method="" id="" action="">
	 <table width="100%" cellspacing="5" cellpadding="5" border="">
	   %for post in posts :
	   <tr>
	     <td>
	       <h4>{{post.title}}</h4>
	       <p>{{post.content}}</p>
	       <p><i>
		 Date : {{post.pub_date.strftime("%Y-%m-%d %H:%M")}}
	       </i></p>
	     <td>
	       <ul>
		 <a href="/edit/{{post.id}}">
		   <input type="button" name="action" value="Edit" />
		 </a>
	       </ul>
	     </td>
	     
	     <td>
	       <ul>
		 <a href="/delete/{{post.id}}">
		   <input type="button" name="action" value="Delete" /> 
		 </a>
	       </ul>
	     </td>

	     </tr>

	   </tr>
	 %end
	 </table>
	 <input type="submit" name="submit" value="Post" />
	 <input type="reset" name="cancel" value="Cancel" />
       </form>
          </div>
   </body>
</html>
