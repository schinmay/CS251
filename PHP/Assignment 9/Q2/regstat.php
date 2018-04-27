<html>
	<head>
	</head>
   <body>
      <?php
         class MyDB extends SQLite3 
         {
            function __construct() 
            {
               $this->open('test.db');
            }
         }
         $db = new MyDB();
         class MyDBZ extends SQLite3 
         {
            function __construct() 
            {
               $this->open('bank.db');
            }
         }
         $dbz = new MyDBZ();

         $name = $_POST["name"];
         $address = $_POST["address"];
         $email = $_POST["email"];
         $mobno = $_POST["mobno"];
         $acno = $_POST["acno"];
         $acpword = $_POST["acpword"];
         $count = 0;

         $sqlz = <<<SQL
         CREATE TABLE BANK
         (ACCOUNT       CHAR(6),
         PASSWORD       CHAR(50),
         BALANCE        int   NOT NULL);
SQL;
         $retz = $dbz->exec($sqlz);

         $sqlz = <<<SQL
           INSERT INTO BANK (ACCOUNT, PASSWORD, BALANCE)
           VALUES ("11111", "qwerty1", 500);

           INSERT INTO BANK (ACCOUNT, PASSWORD, BALANCE)
           VALUES ("22222", "qwerty2", 2000);

           INSERT INTO BANK (ACCOUNT, PASSWORD, BALANCE)
           VALUES ("33333", "qwerty3", 3000);

           INSERT INTO BANK (ACCOUNT, PASSWORD, BALANCE)
           VALUES ("44444", "qwerty4", 4000);

           INSERT INTO BANK (ACCOUNT, PASSWORD, BALANCE)
           VALUES ("55555", "qwerty5", 5000);

           INSERT INTO BANK (ACCOUNT, PASSWORD, BALANCE)
           VALUES ("66666", "qwerty6", 6000);

SQL;
         $retz = $dbz->exec($sqlz);

         $sql = <<<SQL
         CREATE TABLE REGISTRATION
         (NAME          CHAR(21),
         ADDRESS        CHAR(101),
         EMAIL          CHAR(101),
         MOBNO          CHAR(11),
         ACNO           CHAR(6),
         ACPWORD        CHAR(50));
SQL;
         $ret = $db->exec($sql);

         $sql = <<<SQL
         SELECT * from REGISTRATION;
SQL;
         $ret = $db->query($sql);
         while($row = $ret->fetchArray(SQLITE3_ASSOC) ) {
            if($row['EMAIL'] == $email)
            {
               echo "Already Registered <br>";
               $count = 1;
               break;
            }
         }
         if($count == 0)
         {
            $sqlz = <<<SQL
            SELECT * from BANK;
SQL;
            $retz = $dbz->query($sqlz);
            while($row = $retz->fetchArray(SQLITE3_ASSOC) ) {
               if($row['ACCOUNT'] == $acno && $row['PASSWORD'] != $acpword)
               {
                  echo "Invalid Account/Password <br>";
                  $count = 2;
                  break;
               }
               else if($row['ACCOUNT'] == $acno && $row['BALANCE'] < 1000)
               {
                  echo "Insufficient Balance <br>";
                  $count = 3;
                  break;
               }
               else if($row['ACCOUNT'] == $acno)
               {
                  echo "Registration Successful <br>";
                  $count = 0;
                  break;
               }
            }
            if($count == 0)
            {
               $sqlz = <<<SQL
               UPDATE BANK set BALANCE = (BALANCE - 1000) where ACCOUNT = $acno;
SQL;
               $sql = <<<SQL
               INSERT INTO REGISTRATION (NAME,ADDRESS,EMAIL,MOBNO,ACNO,ACPWORD)
               VALUES ('$name', '$address', '$email', '$mobno', '$acno', '$acpword');
SQL;
               $ret = $db->exec($sql);
            }
         }
         $db->close();
         $dbz->close();
      ?>
      <form name="myForm" action="main.php" method="POST">
         <table>
             <tr>
               <td align="right"><input type="submit" value="Another Registration" /></td>
             </tr>
         </table>
      </form>
   </body>
</html>