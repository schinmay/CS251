<html>
<head>
</head>
<body>  
	<?php
		class MyDB extends SQLite3 
		{
		function __construct() 
		{
		   $this->open('admin.db');
		}
		}
		$db = new MyDB();
		if(!$db) {
		//echo $db->lastErrorMsg();
		} 
		else 
		{
		//echo "Opened database successfully <br>";
		}

		class MyDBZ extends SQLite3 
		{
			function __construct() 
			{
			   $this->open('test.db');
			}
		}
		$dbz = new MyDBZ();
		if(!$dbz)
		{
			//echo $dbz->lastErrorMsg();
		} 
		else 
		{
			//echo "Opened databasez successfully <br>";
		}

		$count = 0;

		$sql = <<<SQL
		CREATE TABLE ADMINID
		(ADMIN          CHAR(50),
		PASSWORD        CHAR(50));
SQL;
		$ret = $db->exec($sql);
		if(!$ret){
		//echo $db->lastErrorMsg()."<br>";
		} else {
		//echo "Table created successfully<br>";
		}

		$sql = <<<SQL
        INSERT INTO ADMINID (ADMIN, PASSWORD)
        VALUES ('schinmay', 'qwerty123');
SQL;
		$ret = $db->exec($sql);
		if(!$ret) {
		  //echo $db->lastErrorMsg()."<br>";
		} else {
		  //echo "Inserted Successfully<br>";
		}

        $id = $_POST["id"];
        $password = $_POST["password"];

        $sql = <<<SQL
        SELECT * from ADMINID;
SQL;

		$ret = $db->query($sql);
		while($row = $ret->fetchArray(SQLITE3_ASSOC) ) {
			if($row['ADMIN'] == $id && $row['PASSWORD'] == $password)
			{
				$sql = <<<SQL
				SELECT * from REGISTRATION;
SQL;

				$ret = $dbz->query($sql);
				while($row = $ret->fetchArray(SQLITE3_ASSOC) ) {
					$name = $row['NAME'];
					$address = $row['ADDRESS'];
					$email = $row['EMAIL'];
					$mobile = $row['MOBNO'];
					$acno = $row['ACNO'];
      				echo "Name = ". $name ."<br>";
					echo "Address = ". $address ."<br>";
					echo "Email ID = ". $email ."<br>";
					echo "Mobile Number = ". $mobile ."<br>";
					echo "Account Number = ". $acno ."<br><br>";
				}
				$count = 1;
				break;
			}
		}
		if($count == 0)
		{
			echo "Invalid Admin ID or password <br>";
		}
		$db->close();
    ?>
    <form name="myForm" action="regstore.php" method="POST">
		<table>
		    <tr>
				<td align="right"><input type="submit" value="See all registrations" /></td>
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
