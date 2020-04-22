<?php

#DATABASE CONNECTION
$host="localhost"; //Host name.
$db_user="root"; //mysql user
$db_password=""; //mysql pass
$db='pycompany'; // Database name.
$con=mysqli_connect($host,$db_user,$db_password,$db);

#CHECK CONNECTION
if (mysqli_connect_errno())
{
  echo "Failed to connect to MySQL:" . mysqli_connect_error();
}

# PRIMARY KEYS DECLARATION BEFORE DUMPING DATA
$primary_keys = [
"ALTER TABLE `department` ADD PRIMARY KEY (`dnumber`), ADD KEY `mgr_ssn` (`mgr_ssn`)",
"ALTER TABLE `dependent` ADD PRIMARY KEY (`essn`,`dependent_name`)",
"ALTER TABLE `dept_locations` ADD PRIMARY KEY (`dnumber`,`dlocation`)",
"ALTER TABLE `employee` ADD PRIMARY KEY (`ssn`), ADD KEY `super_ssn` (`super_ssn`), ADD KEY `dno` (`dno`)",
"ALTER TABLE `project` ADD PRIMARY KEY (`pnumber`), ADD KEY `dnum` (`dnum`)",
"ALTER TABLE `works_on` ADD PRIMARY KEY (`essn`,`pno`), ADD KEY `essn` (`essn`), ADD KEY `pno` (`pno`)",
];

foreach ($primary_keys as $primary_key) {
  $stmt = $con->prepare($primary_key);
  $stmt->execute();
}

$tables = array('department', 'dependent', 'dept_locations', 'employee','project','works_on');

foreach($tables as $table)
{
		switch ($table) {
		case "department":
		$dept_file = fopen("department.csv", 'r');
		while (($emapData = fgetcsv($dept_file, 1000, ",")) !== FALSE)
		{
		$sql = "INSERT INTO department(dname,dnumber,mgr_ssn,mgr_start_date) VALUES('$emapData[0]','$emapData[1]','$emapData[2]','$emapData[3]')";
		mysqli_query($con, $sql);
		}
		fclose($dept_file);
        break;
    case "dependent":
		$depen_file = fopen("dependent.csv", 'r');
        $values_attr = "essn,dependent_name,sex,bdate,relationship";
		while (($emapData = fgetcsv($depen_file, 1000, ",")) !== FALSE)
		{
		$sql = "INSERT INTO dependent(essn,dependent_name,sex,bdate,relationship) VALUES('$emapData[0]','$emapData[1]','$emapData[2]','$emapData[3]','$emapData[3]')";
		mysqli_query($con, $sql);
		}
		fclose($depen_file);
		break;
    case "dept_locations":
		$values_attr = "dnumber,dlocation";
		$dept_file = fopen("dept_locations.csv", 'r');
		while (($emapData = fgetcsv($dept_file, 1000, ",")) !== FALSE)
		{
		$sql = "INSERT INTO dept_locations(dnumber,dlocation) VALUES('$emapData[0]','$emapData[1]')";
		mysqli_query($con, $sql);
		}
		fclose($dept_file);
		break;
		
	case "employee":
		$emp_file = fopen("employee.csv", 'r');
        $values_attr = "fname,minit,lname,bdate,address,sex,salary,super_ssn,dno";
		while (($emapData = fgetcsv($emp_file, 1000, ",")) !== FALSE)
		{
		$sql = "INSERT INTO employee(fname,minit,lname,ssn,bdate,address,sex,salary,super_ssn,dno) VALUES('$emapData[0]','$emapData[1]','$emapData[2]','$emapData[3]','$emapData[4]','$emapData[5]','$emapData[6]','$emapData[7]','$emapData[8]','$emapData[9]')";
		mysqli_query($con, $sql);
		}
		fclose($emp_file);
		break;
		
    case "project":
        $values_attr = "pname,pnumber,plocation,dnum";
		$pro_file = fopen("project.csv", 'r');
		while (($emapData = fgetcsv($pro_file, 10000, ",")) !== FALSE)
		{
		$sql = "INSERT INTO project(pname,pnumber,plocation,dnum) VALUES('$emapData[0]','$emapData[1]','$emapData[2]','$emapData[3]')";
		mysqli_query($con, $sql);
		}
		fclose($pro_file);
		break;
		
	case "works_on":
        $values_attr = "essn,pno,hours";
		$works_file = fopen("works_on.csv", 'r');
		while (($emapData = fgetcsv($works_file, 10000, ",")) !== FALSE)
		{
		$sql = "INSERT INTO works_on(essn,pno,hours) VALUES('$emapData[0]','$emapData[1]','$emapData[2]')";
		mysqli_query($con, $sql);
		}
		fclose($works_file);
		break;
}
}

# FOREIGN KEYS DECLARATIONS AFTER DUMPING DATA BECAUSE OF RESTRICTIONS
$queries= [
"ALTER TABLE employee ADD CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`super_ssn`) REFERENCES `employee` (`ssn`) ON DELETE SET NULL ON UPDATE CASCADE, ADD CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`dno`) REFERENCES `department` (`dnumber`) ON DELETE SET NULL ON UPDATE CASCADE",
"ALTER TABLE project ADD CONSTRAINT `project_ibfk_1` FOREIGN KEY (`dnum`) REFERENCES `department` (`dnumber`);",
"ALTER TABLE works_on ADD CONSTRAINT `works_on_ibfk_1` FOREIGN KEY (`essn`) REFERENCES `employee` (`ssn`), ADD CONSTRAINT `works_on_ibfk_2` FOREIGN KEY (`pno`) REFERENCES `project` (`pnumber`)",
"ALTER TABLE department ADD CONSTRAINT `department_ibfk_1` FOREIGN KEY (`mgr_ssn`) REFERENCES `employee` (`ssn`) ON DELETE SET NULL ON UPDATE CASCADE",
"ALTER TABLE dept_locations ADD CONSTRAINT `dept_locations_ibfk_1` FOREIGN KEY (`dnumber`) REFERENCES `department` (`dnumber`) ON DELETE CASCADE ON UPDATE CASCADE",
"ALTER TABLE dependent ADD CONSTRAINT `dependent_ibfk_1` FOREIGN KEY (`essn`) REFERENCES `employee` (`ssn`)"
];
foreach ($queries as $query) {
  $stmt = $con->prepare($query);
  $stmt->execute();
}

?>