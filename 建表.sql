--1������ȷ�����ԣ�XSB��KCB��CJB
--2�����ÿ�����ʵ�������ԣ���������
--3�����ÿ������������ԣ�CHECK���
--4��������֮��Ĳ��������ԣ�XSB��CJB��KCB��CJB


-- ѧ����
CREATE TABLE xsb (
    ѧ�� CHAR(10) PRIMARY KEY CHECK (ѧ�� LIKE '410122[0-9][0-9][0-9][0-9]') NOT NULL,
    ���� CHAR(8) NOT NULL,
    �Ա� BIT DEFAULT 1 NOT NULL,
    �������� DATE CHECK (�������� > '1980-01-01'),
    רҵ CHAR(20) CHECK (רҵ IN ('�����','�������ѧ�뼼��', '�˹�����', '���繤��')),
    ��ѧ�� INT DEFAULT 0 CHECK (��ѧ�� <= 160 AND ��ѧ�� >= 0),
    ��ע VARCHAR(500)
);

-- �γ̱�
CREATE TABLE kcb (
    �γ̺� CHAR(3) PRIMARY KEY CHECK (�γ̺� >= '100' AND �γ̺� <= '299') NOT NULL,
    �γ��� CHAR(20) CHECK (�γ��� IN ('���ݿ�ԭ����Ӧ��', '΢��ԭ����ӿڼ���', '��ɢ��ѧ')) NOT NULL,
    ����ѧ�� TINYINT DEFAULT 1 CHECK (����ѧ�� >= 1 AND ����ѧ�� <= 8),
    ѧʱ TINYINT CHECK (ѧʱ >= 1 AND ѧʱ <= 80),
    ѧ�� TINYINT CHECK (ѧ�� >= 1 AND ѧ�� <= 10) NOT NULL
);

-- �ɼ���
CREATE TABLE cjb (
    ѧ�� CHAR(10) NOT NULL,
    �γ̺� CHAR(3) NOT NULL,
    �ɼ� INT DEFAULT 0,
    PRIMARY KEY (ѧ��, �γ̺�),
    FOREIGN KEY (ѧ��) REFERENCES xsb(ѧ��),
    FOREIGN KEY (�γ̺�) REFERENCES kcb(�γ̺�)
);

DROP TABLE cjb;
DROP TABLE kcb;
DROP TABLE xsb;

ALTER TABLE cjb
ADD CONSTRAINT fk_xsb FOREIGN KEY (ѧ��) REFERENCES xsb(ѧ��);

ALTER TABLE cjb
ADD CONSTRAINT fk_kcb FOREIGN KEY (�γ̺�) REFERENCES kcb(�γ̺�);
USE master;
