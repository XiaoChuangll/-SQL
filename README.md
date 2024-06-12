# 学生成绩管理系统

## 功能介绍

学生成绩管理系统是一个用于管理学生、课程和成绩信息的系统。该系统可以进行学生信息的录入、修改和查询，课程信息的录入和查询，以及成绩信息的录入、查询和统计等操作。用户可以根据学号、姓名、课程号等信息进行查询，并对查询结果进行导出或打印。

## 操作规则

1. **数据库结构初始化：**  
   在使用系统之前，需要先初始化数据库结构。可以使用提供的 SQL 脚本来创建数据库和表结构。

2. **录入学生信息：**  
   使用 INSERT 语句可以向学生表中添加学生信息。

3. **录入课程信息：**  
   使用 INSERT 语句可以向课程表中添加课程信息。

4. **录入成绩信息：**  
   使用 INSERT 语句可以向成绩表中添加成绩信息。

5. **查询学生信息：**  
   使用 SELECT 语句可以查询学生信息。

6. **查询课程信息：**  
   使用 SELECT 语句可以查询课程信息。

7. **查询成绩信息：**  
   使用 SELECT 语句可以查询成绩信息。

8. **导出查询结果：**  
   查询结果可以导出为 Excel 或其他格式，方便后续处理或打印。

9. **修改信息：**  
   使用 UPDATE 语句可以修改学生、课程或成绩信息。

10. **删除信息：**  
    使用 DELETE 语句可以删除学生、课程或成绩信息。

11. **数据统计：**  
    可以使用 SQL 查询语句进行各种数据统计，如平均成绩、及格率等。

## 注意事项

- 在进行任何修改操作之前，请先备份数据库，以免造成数据丢失。
- 确保输入的信息符合规范，如学号格式、课程号范围等。
- 对于敏感操作，如删除信息，请谨慎操作，避免误操作导致不可逆的后果。

## 示例代码

以下是一些示例代码，用于操作学生成绩管理系统的数据库：

```sql
-- 创建学生表
CREATE TABLE xsb (
    学号 CHAR(10) PRIMARY KEY CHECK (学号 LIKE '410122[0-9][0-9][0-9][0-9]') NOT NULL,
    姓名 CHAR(8) NOT NULL,
    性别 BIT DEFAULT 1 NOT NULL,
    出生日期 DATE CHECK (出生日期 > '1980-01-01'),
    专业 CHAR(20) CHECK (专业 IN ('计算机','计算机科学与技术', '人工智能', '网络工程')),
    总学分 INT DEFAULT 0 CHECK (总学分 <= 160 AND 总学分 >= 0),
    备注 VARCHAR(500)
);

-- 创建课程表
CREATE TABLE kcb (
    课程号 CHAR(3) PRIMARY KEY CHECK (课程号 >= '100' AND 课程号 <= '299') NOT NULL,
    课程名 CHAR(20) CHECK (课程名 IN ('数据库原理与应用', '微机原理与接口技术', '离散数学')) NOT NULL,
    开课学期 TINYINT DEFAULT 1 CHECK (开课学期 >= 1 AND 开课学期 <= 8),
    学时 TINYINT CHECK (学时 >= 1 AND 学时 <= 80),
    学分 TINYINT CHECK (学分 >= 1 AND 学分 <= 10) NOT NULL
);

-- 创建成绩表
CREATE TABLE cjb (
    学号 CHAR(10) NOT NULL,
    课程号 CHAR(3) NOT NULL,
    成绩 INT DEFAULT 0,
    PRIMARY KEY (学号, 课程号),
    FOREIGN KEY (学号) REFERENCES xsb(学号),
    FOREIGN KEY (课程号) REFERENCES kcb(课程号)
);
```
# 学生成绩管理系统

该系统用于管理学生的成绩信息，包括学生基本信息、课程信息和成绩信息。

## 操作说明

### 查询学生信息

```sql
-- 查询所有学生信息
SELECT * FROM xsb;
```
```sql
-- 查询特定学生信息（以学号为例）
SELECT * FROM xsb WHERE 学号 = '4101220429';
```
```sql
-- 查询所有课程信息
SELECT * FROM kcb;
```
```sql
-- 查询特定课程信息（以课程号为例）
SELECT * FROM kcb WHERE 课程号 = '101';
```
```sql
-- 查询所有学生成绩信息
SELECT * FROM cjb;
```
```sql
-- 查询特定学生成绩信息（以学号为例）
SELECT * FROM cjb WHERE 学号 = '4101220429';
```
```sql
-- 添加学生信息
INSERT INTO xsb (学号, 姓名, 性别, 出生日期, 专业, 总学分, 备注)
VALUES ('学号', '姓名', '性别', '出生日期', '专业', 总学分, '备注');
```
```sql
-- 修改学生信息（以姓名为例）
UPDATE xsb SET 姓名 = '新姓名' WHERE 学号 = '要修改的学号';
```
```sql
-- 删除学生信息（以学号为例）
DELETE FROM xsb WHERE 学号 = '要删除的学号';
```

