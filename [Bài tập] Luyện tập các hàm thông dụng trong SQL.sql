USE STUDENTMNG;

-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
SELECT 
    SubID, SubName, Credit
FROM
    subject
WHERE
    Credit = (SELECT 
            MAX(Credit)
        FROM
            subject);
-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
SELECT Sub.SubID, Sub.SubName, M.mark
FROM subject Sub
JOIN mark M
ON Sub.SubID = M.SubID
WHERE M.mark = (
SELECT MAX(Mark)
FROM mark);
-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
SELECT S.StudentID, S.StudentName, M.mark
FROM student S
JOIN mark M
ON S.StudentID = M.StudentID
ORDER BY M.mark DESC;