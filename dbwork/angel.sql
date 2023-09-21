-- anger ���� ����
--��ü ������ ��ȸ
SELECT  *  FROM seq;

-- sequence ����
create SEQUENCE seq1 start with 1 INCREMENT by 1; -- 1���� 1�� �����Ǵ� ������ ����
create SEQUENCE seq2 start with 5 INCREMENT by 3 nocache; -- 5���� 3�� ����, cache���� 0
create SEQUENCE seq3 maxvalue 100 nocache; -- start with �� increment ������ 1�� �ʱⰪ ����

--�� �߻���Ű�� 
create SEQUENCE seq_test NOCACHE;

-- table ����
create table test (
    num number(3) primary key, 
    name varchar2(20) not null,
    blood char(2) default 'A',
    weight number(5, 2),
    birthday date);
    
    --����Ÿ �߰�
    -- �Ϻ� �����͸� �ִ� ��� �÷����� �ݵ�� ǥ���Ѵ�.
    insert into test (num,name) values (seq_test.nextval, 'ĵ��');

-- ������� ��� �÷����� �ִ� ��� �÷��� ��������
insert into test values (seq_test.nextval,'ĳ����', 'AB', 67.89, sysdate);

-- ���� ���ǿ� �ȸ´� ��� ���� Ȯ��
insert into test (num,blood) values (seq_test.nextval, 'O');
insert into test (num,name,blood) values (2 ,'lee' , 'O');

--����� �� ������ 3�������� �߰��ϱ�
insert into test values (seq_test.nextval,'��ȣ��', 'B', 78.9, '2000-10-10');
insert into test values (seq_test.nextval,'���缮', 'A', 76.45, '1992-05-28');
insert into test values (seq_test.nextval,'�̿���', 'O', 77.77, '1988-10-15');

-- rollback; --������ commit �� ���� sql��(DML:insert, delete, update) ��� ���
commit; -- ���̻� rollback �ȵ�

insert into test values (seq_test.nextval,'�踻��', 'B', 56.78 ,'1989-09-09');

--�̻��¿��� rollback �ϸ� ���� ��ҵɱ�?

rollback;

-- ���� , ��ȣ���� �������� AB������ ����
update test set blood = 'AB' where name = '��ȣ��';

-- �ΰ��� �÷� ����
update test set weight = 80.8, birthday = sysdate where num = 8 ;

--����
delete from test; -- ��� �����Ͱ� �����ǹǷ� �����ؾ��Ѵ�
rollback;

--num 8,9,10 �� �����Ϸ���
delete from test where num in (7,9,10);

--table ����
drop table test;

--������ ����
drop SEQUENCE seq_test;
rollback; -- DML(insert, delete, update �� ��쿡�� �ѹ��� �ȴ� drop�� �ȵ�) 
----------------------------------------------------------------------------------
create table person (
    num number(3) CONSTRAINT person_pk_num primary key,
    blood char(2));
    
    --���� �������� ����
    alter table person drop CONSTRAINT person_pk_num;
    
    --�ٽ� primary key �� ���� �������� �߰�
    alter table person add constraint person_num_pk primary key(num);
    
    --blood �� ���ؼ� check �������� �߰�
    alter table person add constraint person_ck_blood check (blood in ('A','B','O','AB'));
    
    --����Ÿ �߰�
    insert into person values (1,'A');
    insert into person values (1,'B'); --ORA-00001: ���Ἲ ���� ����(ANGEL.PERSON_PK_NUM)�� ����˴ϴ�
    insert into person values (2,'b');  -- üũ ��������(ANGEL.PERSON_CK_BLOOD)�� ����Ǿ����ϴ�
    insert into person values (2,'O');
    
    --�÷��� �߰�(add
    alter table person add name varchar2(20);
    alter table person add score number(5, 1) default 30.5;
    
    --�÷��� ���� (drop column)
    alter table person drop column num;
    
    -- java ��� �÷��� number Ÿ������ �߰� �� 1~100 ���̰��� �������� �������ǵ� �߰�
    alter table person add java number(3) default 0;
    alter table person add CONSTRAINT person_ck_java check (java>=0 and java<=100);
    
    --�÷��� ���� rename column
    alter table person rename column java to spring;
    
    --������ �߰��� �÷� ������� �ֱ���� ���, �÷��� �ָ� �ȴ�
    insert into person (name,blood,spring,score) values ('lee','O',90,35);
    
    drop table person;
    
    --����
    --���̺� ���� (student) : num ����(5),name ���ڿ�(10),height ����(5,1),
    --  java ����(3) �⺻�� 10,spring ����(3) �⺻�� 10, ban ���ڿ�(20)
    create table student (
        num number(5),
        name varchar2(10),
        height number(5,1),
        spring number(3) default 10,
        java number(3) default 10,
        ban varchar2(20)
        );
        
        ----������ ����  seq_stu  �⺻(1���� 1������), nocache �߰�
        create SEQUENCE seq_stu start with 1 INCREMENT by 1 nocache; --1���� 1 ������ �����ص� �ȴ�.
        
        
        --�������ǵ� �߰�
        --num  �� primary key �߰�(student_pk_nu)
        alter table student add CONSTRAINT student_pk_num primary key(num); -- �̸��� ���� ���̺�� - �������� - �÷��� �̷��� �Ѵ� student pk num
        
        --java,spring �� 1~100 �� �����ϵ��� check �������� �߰�
        alter table student add CONSTRAINT student_ck_java check (java>=1 and java<=100);
        alter table student add CONSTRAINT student_ck_spring check (spring>=1 and spring<=100);
        
        --ban �� '�޴Թ�','�޴Թ�','���Թ�' �� �߰��Ҽ� �ֵ��� check �߰�
        alter table student add CONSTRAINT student_ck_ban check (ban in('�޴Թ�', '�޴Թ�', '���Թ�')); --or�� �ص� �ȴ� �޴� or �޴� or ���� or;
        
        --5�� ������ ����Ÿ�� �߰��غ���
       
        insert into student (num,name,height,java,spring,ban) values (1,'KIM',120,50,30,'�޴Թ�');
        insert into student (num,name,height,java,spring,ban) values (2,'����',120,50,30,'�޴Թ�');
        insert into student (num,name,height,java,spring,ban) values (3,'��ȿ��',120,50,30,'���Թ�');
        insert into student (num,name,height,java,spring,ban) values (4,'��ȣ��',120,50,30,'�޴Թ�');
        insert into student (num,name,height,java,spring,ban) values (5,'����',120,50,30,'�޴Թ�');
       
        -- ������ �߰� �ٸ� ��� (�Ʒ��� ���� ����� �� ���� ���, ������� �����͸� �Է��Ѵٸ� ���� �÷���� �ʿ����.
        insert into student values (seq_stu.nextval,'��ö��',179.1,90,86,'�޴Թ�');
        
        --Ŀ���ϱ�
        commit;
        
        --num>=4 �̻� ��� ����
        delete from student where num>=4;
        
        -- num �� 3�� ����� java������ 99�� ,ban�� '�޴Թ�' ���� ����
        update student set java = 99, ban = '�޴Թ�' where num = 3;
        
        --num=2 �λ���� Ű�� 188.9 �� ����
        update student set height = 188.9 where num =2;
        
        --num=2 �� ����Ÿ ����
        delete from student where num = 2;
        
        --����Ÿ 3������ �� �߰�
        insert into student (num,name,height,java,spring,ban) values (7,'�϶�',170,87,80,'�޴Թ�');
        insert into student (num,name,height,java,spring,ban) values (10,'����',173,76,29,'�޴Թ�');
        insert into student (num,name,height,java,spring,ban) values (29,'����',178,59,90,'���Թ�');
        commit;
        
        --��ȸ : �̸�  �� �ڹ�  ������  ����  ��� -������ ���� ������� ���
        select name,ban,java,spring,(java+spring) total,(java+spring)/2 avg from student order by total desc;
       
        
        
        
        


  





