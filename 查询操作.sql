--���в�ѯ����
--��ѯ�����רҵ��ѧ����Ϣ

select * from xsb where רҵ='�����';

--��ѯCJB���е�ѧ�ţ��γ̺ţ��ɼ������гɼ�����ʾ����δ���ԡ���
--<60������ =<60---<70����=<70---<80�У�=<80---<90����=<90---<100���㡣
--�б������Ϊ���ɼ��ȼ���


select ѧ��, �γ̺�, �ɼ��ȼ�=
                case
                    when �ɼ� is null then '��δ����'
                    when �ɼ�<60 then '������'
                    when �ɼ�>=60 and �ɼ�<70 then '����'
                    when �ɼ�>=70 and �ɼ�<80 then '��'
                    when �ɼ�>=80 and �ɼ�<90 then '��'
                    when �ɼ�>=90 and �ɼ�<100 then '��'
                    else '�ɼ���Ч'
                end
from cjb;

--��XSB��ѡ��������רҵ����ѧ�֣����ؽ������ǰ6��

select top 6 ����, רҵ, ��ѧ�� from xsb;

--����ɼ���max��min��sum��avg��count���������д�����ʵ�����
select count(ѧ��) �ɼ�����, max(�ɼ�) ���ɼ�, min(�ɼ�) ��С�ɼ�, sum(�ɼ�) �ܳɼ�, avg(�ɼ�) ƽ���ɼ� 
    from cjb;


--��ѯXSB�����ա�������˫����ѧ�����
select * from xsb where ���� like '��_';

--��ѯδѡ����ɢ��ѧ��ѧ�����
select * from xsb where ѧ�� not in (
    select ѧ�� from cjb where �γ̺�=(
        select �γ̺� from kcb where �γ���='��ɢ��ѧ'
        )
    );


	--��ѯ206�ſγ̳ɼ�������101�ſγ���ͳɼ���ѧ��ѧ��
	SELECT ѧ�� FROM CJB WHERE �γ̺�='206' 
AND �ɼ� !<(SELECT MIN(�ɼ�) FROM CJB WHERE �γ̺�='101')


--����ѡ����206�ſγ��ҳɼ���80�����ϵ�ѧ���������ɼ�
select xsb.ѧ��, xsb.����, cjb.�ɼ� from xsb, cjb
    where xsb.ѧ��=cjb.ѧ�� and cjb.�γ̺�='206' and cjb.�ɼ�>80;

	--��ѯÿ��ͬѧѡ�˼��ſΣ������ѡ�޴���2�ļ�¼
	select ѧ��, count(�γ̺�) as '�γ���' from cjb group by ѧ��;
select ѧ��, count(�γ̺�) as '�γ���' from cjb group by ѧ�� having count(�γ̺�)>2;


--�������רҵ��ѧ���ġ�������������γ̳ɼ����ս������У��ɼ���ͬ�ĵ��ٰ�������������
select xsb.ѧ��, xsb.����, xsb.רҵ, cjb.�ɼ� from xsb, kcb, cjb
    where xsb.ѧ��=cjb.ѧ�� and kcb.�γ̺�=cjb.�γ̺�
        and xsb.רҵ='�����' and kcb.�γ���='���������'
            order by cjb.�ɼ� desc, xsb.���� asc;