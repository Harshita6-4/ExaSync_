
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";



CREATE TABLE `adminlog` (
  `id` int(3) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


CREATE TABLE `java` (
  `id` int(3) UNSIGNED ZEROFILL NOT NULL,
  `qno` varchar(255) DEFAULT NULL,
  `question` varchar(255) DEFAULT NULL,
  `a1` varchar(255) DEFAULT NULL,
  `a2` varchar(255) DEFAULT NULL,
  `a3` varchar(255) DEFAULT NULL,
  `a4` varchar(255) DEFAULT NULL,
  `ans` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;


INSERT INTO `java` (`id`, `qno`, `question`, `a1`, `a2`, `a3`, `a4`, `ans`) VALUES
(001, '1', 'Which company originally developed Java?', 'Microsoft', 'Sun Microsystems', 'Apple', 'IBM', 'Sun Microsystems'),
(002, '2', 'Java is platform independent because of?', 'JDK', 'JRE', 'JVM', 'IDE', 'JVM'),
(003, '3', 'Which is NOT a feature of Java?', 'Object Oriented', 'Platform Independent', 'Pointers', 'Secure', 'Pointers'),
(004, '4', 'What is the size of int in Java?', '8 bit', '16 bit', '32 bit', '64 bit', '32 bit'),
(005, '5', 'Which keyword is used for inheritance in Java?', 'this', 'super', 'extends', 'implements', 'extends'),
(006, '6', 'What is the default value of boolean in Java?', 'true', 'false', '0', 'null', 'false'),
(007, '7', 'Which method is the entry point of a Java program?', 'start()', 'main()', 'run()', 'init()', 'main()'),
(008, '8', 'Which of these is not a primitive data type in Java?', 'int', 'float', 'String', 'char', 'String'),
(009, '9', 'What does JVM stand for?', 'Java Virtual Memory', 'Java Virtual Machine', 'Java Variable Method', 'Java Verified Module', 'Java Virtual Machine'),
(010, '10', 'Which keyword is used to create an object in Java?', 'create', 'new', 'object', 'make', 'new'),
(011, '11', 'What is the parent class of all classes in Java?', 'Base', 'Super', 'Object', 'Main', 'Object'),
(012, '12', 'Which concept allows one class to have multiple forms?', 'Encapsulation', 'Inheritance', 'Polymorphism', 'Abstraction', 'Polymorphism'),
(013, '13', 'Which keyword is used to prevent a class from being inherited?', 'static', 'final', 'abstract', 'private', 'final'),
(014, '14', 'What is the default value of an int variable in Java?', '1', '-1', '0', 'null', '0'),
(015, '15', 'Which of these is used to handle exceptions in Java?', 'try-catch', 'if-else', 'for loop', 'switch', 'try-catch'),
(016, '16', 'What does OOP stand for?', 'Object Oriented Programming', 'Object Oriented Process', 'Ordered Object Programming', 'Open Object Protocol', 'Object Oriented Programming'),
(017, '17', 'Which access modifier makes a member accessible only within the class?', 'public', 'protected', 'private', 'default', 'private'),
(018, '18', 'Which data structure uses LIFO?', 'Queue', 'Stack', 'Array', 'LinkedList', 'Stack'),
(019, '19', 'What is the size of a char in Java?', '8 bit', '16 bit', '32 bit', '64 bit', '16 bit'),
(020, '20', 'Which keyword is used to define an interface in Java?', 'class', 'abstract', 'interface', 'struct', 'interface'),
(021, '21', 'How do you create a single line comment in Java?', '/* comment */', '# comment', '// comment', '-- comment', '// comment'),
(022, '22', 'Which exception is thrown when dividing by zero in Java?', 'NullPointerException', 'ArithmeticException', 'ArrayIndexOutOfBoundsException', 'ClassCastException', 'ArithmeticException'),
(023, '23', 'What is the correct way to declare an array in Java?', 'int arr;', 'int arr[];', 'array int arr;', 'int[] = arr;', 'int arr[];'),
(024, '24', 'Which loop is guaranteed to execute at least once?', 'for', 'while', 'do-while', 'foreach', 'do-while'),
(025, '25', 'What does the toString() method do?', 'Converts number to string', 'Returns string representation of object', 'Compares two strings', 'Deletes a string', 'Returns string representation of object'),
(026, '26', 'Which keyword is used to call parent class constructor?', 'this()', 'super()', 'parent()', 'base()', 'super()'),
(027, '27', 'What is method overloading?', 'Same method name different return type', 'Same method name different parameters', 'Two classes same method', 'Overriding a method', 'Same method name different parameters'),
(028, '28', 'Which collection does not allow duplicate elements?', 'ArrayList', 'LinkedList', 'Set', 'Vector', 'Set'),
(029, '29', 'What is the use of the this keyword?', 'Refers to parent class', 'Refers to current object', 'Creates new object', 'Calls static method', 'Refers to current object'),
(030, '30', 'Which keyword is used for abstraction in Java?', 'interface only', 'abstract only', 'Both abstract and interface', 'final', 'Both abstract and interface'),
(031, '31', 'What is bytecode in Java?', 'Machine code', 'Source code', 'Intermediate code run by JVM', 'Compiled binary', 'Intermediate code run by JVM'),
(032, '32', 'Which of these is a checked exception?', 'NullPointerException', 'ArithmeticException', 'IOException', 'ArrayIndexOutOfBoundsException', 'IOException'),
(033, '33', 'What is the use of the static keyword?', 'Creates object', 'Belongs to class not instance', 'Makes variable constant', 'Hides a method', 'Belongs to class not instance'),
(034, '34', 'Which method is used to find the length of a String?', 'size()', 'length()', 'count()', 'len()', 'length()'),
(035, '35', 'What is a constructor?', 'A method that returns value', 'A method called automatically when object is created', 'A static method', 'A method to destroy object', 'A method called automatically when object is created'),
(036, '36', 'Which package is imported by default in Java?', 'java.io', 'java.util', 'java.lang', 'java.net', 'java.lang'),
(037, '37', 'What is the output of 5 + 3 + \"Java\"?', 'Java53', '53Java', '8Java', 'Error', '8Java'),
(038, '38', 'Which keyword is used to implement an interface?', 'extends', 'implements', 'inherits', 'uses', 'implements'),
(039, '39', 'What is the default value of a String in Java?', '\"\"', '\" \"', 'null', '0', 'null'),
(040, '40', 'Which of these is not an OOP principle?', 'Encapsulation', 'Polymorphism', 'Compilation', 'Inheritance', 'Compilation'),
(041, '41', 'What is an abstract class?', 'A class with no methods', 'A class that cannot be instantiated', 'A class with only static methods', 'A final class', 'A class that cannot be instantiated'),
(042, '42', 'Which method must be implemented when using Runnable interface?', 'start()', 'execute()', 'run()', 'init()', 'run()'),
(043, '43', 'What does the final keyword do to a variable?', 'Makes it static', 'Makes it constant', 'Makes it private', 'Makes it global', 'Makes it constant'),
(044, '44', 'Which operator is used for string concatenation in Java?', '*', '+', '&', '|', '+'),
(045, '45', 'What is the use of the break statement?', 'Skips current iteration', 'Exits the loop', 'Restarts the loop', 'Pauses the loop', 'Exits the loop'),
(046, '46', 'Which class is used to read input from user in Java?', 'System.in', 'BufferedReader', 'Scanner', 'InputReader', 'Scanner'),
(047, '47', 'What is a package in Java?', 'A group of classes and interfaces', 'A type of variable', 'A loop structure', 'An exception type', 'A group of classes and interfaces'),
(048, '48', 'Which of these is a valid main method signature?', 'public void main(String args)', 'public static void main(String[] args)', 'static void main()', 'void main(String args[])', 'public static void main(String[] args)'),
(049, '49', 'What does the instanceof operator do?', 'Creates an instance', 'Checks if object is instance of a class', 'Destroys an instance', 'Counts instances', 'Checks if object is instance of a class'),
(050, '50', 'Which sorting algorithm is used by Arrays.sort() in Java?', 'Bubble Sort', 'Quick Sort', 'Dual Pivot Quick Sort', 'Merge Sort', 'Dual Pivot Quick Sort');


CREATE TABLE `login` (
  `id` int(3) UNSIGNED ZEROFILL NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `marks` int(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `login` (`id`, `username`, `email`, `password`, `marks`) VALUES
(001, 'abhayshah', 'abhay@gmail.com', '1234', 3),
(002, 'akshayshah', 'akshay@gmail.com', '4567', 2),
(003, 'ajay', 'ajay@gmail.com', '12345', 2),
(004, 'aamir', 'aamir@gmail.com', '0000', NULL),
(005, 'ansh', 'ansh@gmail.com', '12345', NULL),
(006, 'jimhalpert', 'jim@gmail.com', '1234', 2),
(007, 'rahul', 'rahul@gmail.com', 'password1234', NULL),
(008, 'ANANY', 'annay@gmail.com', 'Admin@123', NULL);

ALTER TABLE `java`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `java`
  MODIFY `id` int(3) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

ALTER TABLE `login`
  MODIFY `id` int(3) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
