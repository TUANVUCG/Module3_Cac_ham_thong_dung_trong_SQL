USE STUDENTMNG;

CREATE TABLE STUDENT
(
StudentID INT PRIMARY KEY,
StudentName VARCHAR(50) NOT NULL,
Address VARCHAR(50) NOT NULL,
Phone VARCHAR(50) ,
Status BIT ,
ClassID INT ,
CONSTRAINT FK_ClassID FOREIGN KEY (ClassID) REFERENCES class(ClassID)
);

INSERT INTO Student (StudentID, StudentName, Address, Phone, Status, ClassId)
VALUES (1,'Hung', 'Ha Noi', '0912113113', 1, 1);
INSERT INTO Student (StudentID, StudentName, Address, Status, ClassId)
VALUES (2,'Hoa', 'Hai phong', 1, 1);
INSERT INTO Student (StudentID, StudentName, Address, Phone, Status, ClassId)
VALUES (3,'Manh', 'HCM', '0123123123', 0, 2);

-- Hiển thị số lượng sinh viên ở từng nơi
SELECT address, count(*) 'Que quan'
FROM student
GROUP BY address;
-- Tính điểm trung bình các môn học của mỗi học viên
DROP VIEW findMark;
CREATE VIEW findMark AS
SELECT student.StudentID, student.StudentName , mark.Mark AS 'mark'
FROM student 
JOIN mark
ON student.studentID = mark.studentID
ORDER BY mark.Mark DESC;
-- Hiển thị những bạn học viên co điểm trung bình các môn học lớn hơn 15
SELECT S.StudentID, S.StudentName, M.Mark
FROM student S
JOIN mark M
ON S.StudentID = M.StudentID
GROUP BY S.StudentID, S.StudentName
HAVING AVG(Mark) >10;
-- Hiển thị thông tin các học viên có điểm trung bình lớn nhất.
SELECT S.StudentID, S.StudentName, M.mark
FROM student S 
JOIN mark M
ON S.studentID = M.studentID
GROUP BY S.StudentID, S.StudentName
HAVING M.mark >= ALL(
SELECT mark FROM mark);