--1、建表确定属性：XSB、KCB、CJB
--2、设计每个表的实体完整性：键、索引
--3、设计每个表的域完整性：CHECK语句
--4、建立表之间的参照完整性：XSB与CJB，KCB与CJB


-- 学生表
CREATE TABLE xsb (
    学号 CHAR(10) PRIMARY KEY CHECK (学号 LIKE '410122[0-9][0-9][0-9][0-9]') NOT NULL,
    姓名 CHAR(8) NOT NULL,
    性别 BIT DEFAULT 1 NOT NULL,
    出生日期 DATE CHECK (出生日期 > '1980-01-01'),
    专业 CHAR(20) CHECK (专业 IN ('计算机','计算机科学与技术', '人工智能', '网络工程')),
    总学分 INT DEFAULT 0 CHECK (总学分 <= 160 AND 总学分 >= 0),
    备注 VARCHAR(500)
);

-- 课程表
CREATE TABLE kcb (
    课程号 CHAR(3) PRIMARY KEY CHECK (课程号 >= '100' AND 课程号 <= '299') NOT NULL,
    课程名 CHAR(20) CHECK (课程名 IN ('数据库原理与应用', '微机原理与接口技术', '离散数学')) NOT NULL,
    开课学期 TINYINT DEFAULT 1 CHECK (开课学期 >= 1 AND 开课学期 <= 8),
    学时 TINYINT CHECK (学时 >= 1 AND 学时 <= 80),
    学分 TINYINT CHECK (学分 >= 1 AND 学分 <= 10) NOT NULL
);

-- 成绩表
CREATE TABLE cjb (
    学号 CHAR(10) NOT NULL,
    课程号 CHAR(3) NOT NULL,
    成绩 INT DEFAULT 0,
    PRIMARY KEY (学号, 课程号),
    FOREIGN KEY (学号) REFERENCES xsb(学号),
    FOREIGN KEY (课程号) REFERENCES kcb(课程号)
);

DROP TABLE cjb;
DROP TABLE kcb;
DROP TABLE xsb;

ALTER TABLE cjb
ADD CONSTRAINT fk_xsb FOREIGN KEY (学号) REFERENCES xsb(学号);

ALTER TABLE cjb
ADD CONSTRAINT fk_kcb FOREIGN KEY (课程号) REFERENCES kcb(课程号);
USE master;
