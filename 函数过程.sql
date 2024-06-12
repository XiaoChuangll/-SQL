USE PXSCJ

--获取学生的平均成绩
CREATE FUNCTION dbo.GetAverageScore(@学号 CHAR(10))
RETURNS DECIMAL(5, 2)
AS
BEGIN
    DECLARE @平均成绩 DECIMAL(5, 2);
    SELECT @平均成绩 = AVG(成绩) FROM cjb WHERE 学号 = @学号;
    RETURN @平均成绩;
END;



--获取学生的选修课程列表
CREATE FUNCTION dbo.GetCourseList(@学号 CHAR(10))
RETURNS VARCHAR(MAX)
AS
BEGIN
    DECLARE @课程列表 VARCHAR(MAX);
    SELECT @课程列表 = COALESCE(@课程列表 + ', ', '') + 课程名 
    FROM kcb WHERE 课程号 IN (SELECT 课程号 FROM cjb WHERE 学号 = @学号);
    RETURN @课程列表;
END;


--获取开课学期为指定值的课程列表
CREATE FUNCTION dbo.GetCoursesBySemester(@开课学期 TINYINT)
RETURNS VARCHAR(MAX)
AS
BEGIN
    DECLARE @课程列表 VARCHAR(MAX);
    SELECT @课程列表 = COALESCE(@课程列表 + ', ', '') + 课程名 
    FROM kcb WHERE 开课学期 = @开课学期;
    RETURN @课程列表;
END;




SELECT xsb.学号, xsb.姓名, kcb.课程号, kcb.课程名
FROM xsb
INNER JOIN cjb ON xsb.学号 = cjb.学号
INNER JOIN kcb ON cjb.课程号 = kcb.课程号
ORDER BY xsb.学号, kcb.课程号;


SELECT xsb.学号, xsb.姓名, cjb.成绩
FROM xsb
INNER JOIN cjb ON xsb.学号 = cjb.学号
WHERE cjb.课程号 = '101';    --101 数据库原理与应用  102微机原理与接口技术  206离散数学
