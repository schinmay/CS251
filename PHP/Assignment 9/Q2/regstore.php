<html>
<head>
</head>
<body>  
	<form method="POST" action="admin.php">  
		<table>
		    <tr>
				<td align="right">Login ID : </td>
				<td align="left"><input type="text" name="id" placeholder="Enter Admin ID" /></td>
		    </tr>
		    <tr>
				<td align="right">Password : </td>
				<td align="left"><input type="password" name="password" placeholder="Enter Bank password" /></td>
		    </tr>
		    <tr>
				<td align="right"><input type="submit" value="Submit" /></td>
		    </tr>
	    </table>
 	</form>
 	<form name="myForm" action="main.php" method="POST">
         <table>
             <tr>
               <td align="right"><input type="submit" value="Another Registration" /></td>
             </tr>
         </table>
    </form>
</body>
</html>
