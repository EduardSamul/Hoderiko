DROP TABLE User;
DROP TABLE Module;
DROP TABLE Course;
DROP TABLE Class;
DROP TABLE Test;
DROP TABLE Grade;
DROP TABLE userAttendedClass;

CREATE TABLE User(
    id VARCHAR(50) PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(50),
    password VARCHAR(500),
    role VARCHAR(10)
);

CREATE TABLE Module(
    mID VARCHAR(50) PRIMARY KEY,
    mName VARCHAR(50),
    mDesc VARCHAR(50),
    mYear NUMBER(1), 
    tID VARCHAR(50),
    FOREIGN KEY (tID) REFERENCES User(id)
);

CREATE TABLE Course(
    mID VARCHAR(50),
    sID VARCHAR(50),
    cName VARCHAR(50),
    cDesc VARCHAR(50),
    cYear VARCHAR(50),
    FOREIGN KEY(mID) REFERENCES Module(mID),
    FOREIGN KEY (sID) REFERENCES User(id)
);

CREATE TABLE Class(
    classID VARCHAR(50) PRIMARY KEY,
    mID VARCHAR(50),
    totalStudents NUMBER(3),
    classDate DATE,
    classStartTime TIME,
    classEndTime TIME,
    FOREIGN KEY(mID) REFERENCES Module(mID)
);

CREATE TABLE userAttendedClass(
    sID VARCHAR(50),
    classID VARCHAR(50),
    classJoinTime TIME,
    serverJoinTime TIME,
    attended BOOLEAN,
    reason BOOLEAN DEFAULT false,
    FOREIGN KEY(classID) REFERENCES Class(classID),
    FOREIGN KEY(sID) REFERENCES User(id)
);

CREATE TABLE Test(
    mID VARCHAR(50),
    sID VARCHAR(50),
    testName VARCHAR(50),
    testDate DATE,
    testResult float(4),
    FOREIGN KEY(mID) REFERENCES Module(mID),
    FOREIGN KEY (sID) REFERENCES User(id)
);

CREATE TABLE Grade(
    mID VARCHAR(50),
    sID VARCHAR(50),
    finalGrade FLOAT(4),
    FOREIGN KEY(mID) REFERENCES Module(mID),
    FOREIGN KEY (sID) REFERENCES User(id)
);

-- Test Users
INSERT INTO User (id, name, email, password, role) VALUES("A123456", "Donald Duck", "donaldduck@tudublin.ie", "letmeinplz", "ROLE.ADMIN");
INSERT INTO User (id, name, email, password, role) VALUES("T123456", "Goofy", "goofy@tudublin.ie", "letmeinplz", "ROLE.TEACHER");
INSERT INTO User (id, name, email, password, role) VALUES("S123456", "Micky", "micky@tudublin.ie", "letmeinplz", "ROLE.STUDENT");

--Test Modules
INSERT INTO Module (mID, mName, mDesc, mYear, tID) VALUES("M123", "Global Classroom", "Lorem Ipsum", "3", "T123456");
INSERT INTO Module (mID, mName, mDesc, mYear, tID) VALUES("M124", "Web Development", "Lorem Ipsum", "3", "T123456");
INSERT INTO Module (mID, mName, mDesc, mYear, tID) VALUES("M125", "System Security", "Lorem Ipsum", "3", "T123456");
INSERT INTO Module (mID, mName, mDesc, mYear, tID) VALUES("M126", "Computer Architecture", "Lorem Ipsum", "3", "T123456");
INSERT INTO Module (mID, mName, mDesc, mYear, tID) VALUES("M127", "Testing in Python", "Lorem Ipsum", "3", "T123456");
INSERT INTO Module (mID, mName, mDesc, mYear, tID) VALUES("M128", "Mobile Software Development", "Lorem Ipsum", "3", "T123456");

--Test Courses
INSERT INTO Course (mID, sID, cName, cDesc, cYear) VALUES("M123", "S123456", "Computer Science", "Lorem Ipsum", "3");
INSERT INTO Course (mID, sID, cName, cDesc, cYear) VALUES("M124", "S123456", "Computer Science", "Lorem Ipsum", "3");
INSERT INTO Course (mID, sID, cName, cDesc, cYear) VALUES("M125", "S123456", "Computer Science", "Lorem Ipsum", "3");
INSERT INTO Course (mID, sID, cName, cDesc, cYear) VALUES("M126", "S123456", "Computer Science", "Lorem Ipsum", "3");
INSERT INTO Course (mID, sID, cName, cDesc, cYear) VALUES("M127", "S123456", "Computer Science", "Lorem Ipsum", "3");
INSERT INTO Course (mID, sID, cName, cDesc, cYear) VALUES("M128", "S123456", "Computer Science", "Lorem Ipsum", "3");

--Test Tests
INSERT INTO Test (mID, sID, testName, testDate, testResult) VALUES("M126", "S123456", "Computer Architecture Mid-Term Exam", "2021-06-16", 43.6);
INSERT INTO Test (mID, sID, testName, testDate, testResult) VALUES("M127", "S123456", "Testing in Python Mid-Term Exam", "2021-06-13", 46);
INSERT INTO Test (mID, sID, testName, testDate, testResult) VALUES("M128", "S123456", "Mobile Software Development Mid-Term Exam", "2021-06-09", 30);

--Test Grades
INSERT INTO Grade (mID, sID, finalGrade) VALUES("M123", "S123456", 100);
INSERT INTO Grade (mID, sID, finalGrade) VALUES("M124", "S123456", 56);
INSERT INTO Grade (mID, sID, finalGrade) VALUES("M125", "S123456", 67);
INSERT INTO Grade (mID, sID, finalGrade) VALUES("M126", "S123456", 50);
INSERT INTO Grade (mID, sID, finalGrade) VALUES("M127", "S123456", 53);
INSERT INTO Grade (mID, sID, finalGrade) VALUES("M128", "S123456", 43);

--Test Classes
INSERT INTO Class (classID, mID, totalStudents, classDate, classStartTime, classEndTime) VALUES("C123", "M123", 40, "2021-04-28", "20:00", "21:00");
INSERT INTO Class (classID, mID, totalStudents, classDate, classStartTime, classEndTime) VALUES("C124", "M123", 40, "2021-06-28", "10:00", "11:00");
INSERT INTO Class (classID, mID, totalStudents, classDate, classStartTime, classEndTime) VALUES("C125", "M124", 40, "2021-06-29", "11:00", "12:00");
INSERT INTO Class (classID, mID, totalStudents, classDate, classStartTime, classEndTime) VALUES("C126", "M125", 40, "2021-06-21", "14:00", "15:00");
INSERT INTO Class (classID, mID, totalStudents, classDate, classStartTime, classEndTime) VALUES("C127", "M126", 40, "2021-06-22", "15:00", "16:00");
INSERT INTO Class (classID, mID, totalStudents, classDate, classStartTime, classEndTime) VALUES("C128", "M127", 40, "2021-06-24", "16:00", "17:00");
INSERT INTO Class (classID, mID, totalStudents, classDate, classStartTime, classEndTime) VALUES("C129", "M128", 40, "2021-06-25", "17:00", "18:00");

--Test Attended User
INSERT INTO userAttendedClass (sID, classID, classJoinTime, serverJoinTime, attended, reason) VALUES("S123456", "C123", "20:00", "20:00", true, false);
INSERT INTO userAttendedClass (sID, classID, classJoinTime, serverJoinTime, attended, reason) VALUES("S123456", "C124", "10:00", "11:00", true, false);

--Queries

-- SELECT name, mName FROM userAttendedClass 
-- JOIN User on userAttendedClass.sID = User.id 
-- JOIN Class USING(classID)
-- JOIN Module USING(mID)
-- WHERE sID = "S123456";

-- record.append("{studentName: $1, moduleName: $2}")

-- for(i in record):
--     const classesAttended = SELECT COUNT(*) FROM userAttendedClass WHERE sID = "S123456";
--     const totalClasses = SELECT COUNT(*) FROM Class WHERE mID = "M123";

--     var attendanceAsPer = (classAttended / totalCLasses) * 100;

--     record[i].append("attendance: attendanceAsPer")


-- -- for(i = 0 ; record.length ; i++ ) {
-- --     const classesAttended = SELECT COUNT(*) FROM userAttendedClass WHERE sID = "S123456";
-- --     const totalClasses = SELECT COUNT(*) FROM Class WHERE mID = "M123";

-- --     var attendanceAsPer = (classAttended / totalCLasses) * 100;
-- -- }