--进行查询操作
--查询计算机专业的学生信息
USE PXSCJ
select * from xsb where 专业='计算机科学与技术';

--查询CJB表中的学号，课程号，成绩，其中成绩空显示“尚未考试”，
--<60不及格， =<60---<70及格，=<70---<80中，=<80---<90良，=<90---<100优秀。
--列标题别名为“成绩等级”


SELECT xsb.学号, xsb.姓名, cjb.课程号,
       CASE
           WHEN cjb.成绩 IS NULL THEN '尚未考试'
           WHEN cjb.成绩 < 60 THEN '不及格'
           WHEN cjb.成绩 >= 60 AND cjb.成绩 < 70 THEN '及格'
           WHEN cjb.成绩 >= 70 AND cjb.成绩 < 80 THEN '中'
           WHEN cjb.成绩 >= 80 AND cjb.成绩 < 90 THEN '良'
           WHEN cjb.成绩 >= 90 AND cjb.成绩 < 100 THEN '优'
           ELSE '成绩无效'
       END AS 成绩等级
FROM cjb
JOIN xsb ON cjb.学号 = xsb.学号;


--对XSB表选择姓名，专业和总学分，返回结果集的前6行

select top 6 姓名, 专业, 总学分 from xsb;

--输出成绩的max，min，sum，avg，count五个函数，写出合适的列名
select count(学号) 成绩总数, max(成绩) 最大成绩, min(成绩) 最小成绩, sum(成绩) 总成绩, avg(成绩) 平均成绩 
    from cjb;


--查询XSB表中姓“邓”且双名的学生情况
select * from xsb where 姓名 like '陈__';

--查询未选修离散数学的学生情况
select * from xsb where 学号 not in (
    select 学号 from cjb where 课程号=(
        select 课程号 from kcb where 课程名='离散数学'
        )
    );


	--查询206号课程成绩不低于101号课程最低成绩的学生学号
	SELECT 学号 FROM CJB WHERE 课程号='206' 
AND 成绩 !<(SELECT MIN(成绩) FROM CJB WHERE 课程号='101')


--查找选修了206号课程且成绩在80分以上的学生姓名及成绩
select xsb.学号, xsb.姓名, cjb.成绩 from xsb, cjb
    where xsb.学号=cjb.学号 and cjb.课程号='206' and cjb.成绩>80;

	--查询每个同学选了几门课，并输出选修大于2的记录
	select 学号,count(课程号) as '课程数' from cjb group by 学号;
select 学号,count(课程号) as '课程数' from cjb group by 学号 having count(课程号)>2;

--查询同上
SELECT xsb.学号, xsb.姓名, COUNT(cjb.课程号) AS '课程数'
FROM cjb
JOIN xsb ON cjb.学号 = xsb.学号
GROUP BY xsb.学号, xsb.姓名
HAVING COUNT(cjb.课程号) > 1;--这里代表课程数


--将计算机专业的学生的“数据库原理与应用”课程成绩按照降序排列，成绩相同的的再按姓名升序排列
select xsb.学号, xsb.姓名, xsb.专业, cjb.成绩 from xsb, kcb, cjb
    where xsb.学号=cjb.学号 and kcb.课程号=cjb.课程号
        and xsb.专业='计算机科学与技术' and kcb.课程名='数据库原理与应用'
            order by cjb.成绩 desc, xsb.姓名 asc;
