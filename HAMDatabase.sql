DROP TABLE User;
DROP TABLE Module;
DROP TABLE Course;
DROP TABLE Class;
DROP TABLE Test;
DROP TABLE Grade;

CREATE TABLE User(
    id VARCHAR(50),
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
    mID VARCHAR(50),
    classDate DATE,
    classStartTime TIME,
    classEndTime TIME,
    attended BOOLEAN,
    FOREIGN KEY(mID) REFERENCES Module(mID)
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

--Test Courses
INSERT INTO Course (mID, sID, cName, cDesc, cYear) VALUES("M123", "S123456", "Computer Science", "Lorem Ipsum", "3");
INSERT INTO Course (mID, sID, cName, cDesc, cYear) VALUES("M124", "S123456", "Computer Science", "Lorem Ipsum", "3");