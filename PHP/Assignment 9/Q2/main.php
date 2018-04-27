<!DOCTYPE html>
<html>
<head>
<title>Registration page</title>
<script type="text/javascript">
	function formValidation() {
	    var name = document.myForm.name.value;
	    var address = document.myForm.address.value;
	    var email = document.myForm.email.value;
	    var mobno = document.myForm.mobno.value;
	    var acno = document.myForm.acno.value;
	    var acpword = document.myForm.acpword.value;
	    var letters = /^[A-Za-z ]+$/;
	    var mail = /^[A-Za-z]+@.*\b.com\b$/;
	    var number = /^[0-9]+$/;
	    var alphanumber = /^[A-Za-z0-9]+$/;

	    if (name.length == 0) 
	    {
	        alert("Please input your Name");
	        return false;
	    } 
	    else if (address.length == 0) 
	    {
	        alert("Please input your Address");
	        return false;
	    } 
	    else if (email.length == 0) 
	    {
	        alert("Please input your Email ID");
	        return false;
	    } 
	    else if (mobno.length == 0) 
	    {
	        alert("Please input your Mobile Number");
	        return false;
	    } 
	    else if (acno.length == 0) 
	    {
	        alert("Please input your Bank A/C Number");
	        return false;
	    } 
	    else if (acpword.length == 0) 
	    {
	        alert("Please input your Bank password");
	        return false;
	    } 
	    else if (name.length > 20) 
	    {
	        alert("Please input a shorter Name (Maximum 20 characters)");
	        return false;
	    } 
	    else if (address.length > 100) 
	    {
	        alert("Please input a shorter Address (Maximum 100 characters)");
	        return false;
	    } 
	    else if (mobno.length != 10) 
	    {
	        alert("Please input a valid Mobile Number (with 10 digits)");
	        return false;
	    } 
	    else if (acno.length != 5) 
	    {
	        alert("Please input a valid Bank A/C Number (with 5 digits)");
	        return false;
	    } 
	    else if (acpword.length > 20) 
	    {
	        alert("Please input a shorter Bank password (Maximum 20 characters)");
	        return false;
	    } 
	    else if (!(name.match(letters))) 
	    {
	        alert("Please input a Name with only alphabets and spaces");
	        return false;
	    }
	    else if (!(email.match(mail))) 
	    {
	        alert("Please input a valid Email ID, e.g. alphabets@xyz.com");
	        return false;
	    }
	    else if (!(mobno.match(number))) 
	    {
	        alert("Please input a numeric Mobile Number");
	        return false;
	    }
	    else if (!(acno.match(number))) 
	    {
	        alert("Please input a numeric Bank A/C Number");
	        return false;
	    }
	    else if (!(acpword.match(alphanumber))) 
	    {
	        alert("Please input an alphanumeric Bank password");
	        return false;
	    }
}
</script>
</head>
<body>
	<h1>Registration Form</h1>
	<form name="myForm" action="regstat.php" onsubmit="return formValidation()" method="POST">
		<table>
		    <tr>
				<td align="right">Name : </td>
				<td align="left"><input type="text" name="name" placeholder="Enter Name" /></td>
		    </tr>
		    <tr>
				<td align="right">Address : </td>
				<td align="left"><input type="text" name="address" placeholder="Enter Address" /></td>
		    </tr>
		    <tr>
				<td align="right">Email : </td>
				<td align="left"><input type="text" name="email" placeholder="Enter email-id" /></td>
		    </tr>
		    <tr>
				<td align="right">Mobile Number : </td>
				<td align="left"><input type="text" name="mobno" placeholder="Enter Mobile number"/></td>
		    </tr>
		    <tr>
				<td align="right">Bank Account Number : </td>
				<td align="left"><input type="text" name="acno" placeholder="Enter Bank A/C number" /></td>
		    </tr>
		    <tr>
				<td align="right">Bank Password : </td>
				<td align="left"><input type="password" name="acpword" placeholder="Enter Bank password" /></td>
		    </tr>
		    <tr>
				<td align="right"><input type="submit" value="Submit" /></td>
		    </tr>
	    </table>
 	</form>
 	<form name="newform" action="regstore.php" method="POST">
		<table>
		    <tr>
				<td align="right"><input type="submit" value="See all registrations" /></td>
		    </tr>
	    </table>
	</form>
</body>
</html>



