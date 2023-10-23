-- 2023 - 09 - 22 ���ν���
-- ���ν���
--: ���ν����� Ư�� �۾��� �����ϴ� ������ ���� ���α׷�����
--����Ÿ���̽��� ����Ǵ� ��ü�̴�
--�ݺ��Ǵ� �ڵ尰�� ��� ���ν����� �����صξ��ٰ� ȣ���ؼ�
--���ุ �ϸ� �ǹǷ� ���뼺�� ����
--
--����
-- create : ���� ����, ���� ���ν����� ���� ��� �����߻�
-- create or replace : ���λ���, �ٵ� ���� ���ν����� ������ �����.

--create [or replace ] procendure ���ν�����
--[ �Ķ�̵� ��� ����ŸŸ��, ....]
--
--is
--    ���� ����
--    begin
--            �ڵ�;
--end;
--/
--
--ȣ�� : exec ���ν�����
--            exec ���ν�����(��)


-- ���� 1 �� ���� ���ν��� �����غ���
create or replace PROCEDURE mytest
is

begin
    DBMS_OUTPUT.PUT_LINE('ù ���ν����� ��������!');
end;
/
-- mytest ���ν��� ȣ��
exec mytest;

-- ���� 2 ���ڸ� ���ڷ� ������ ������ ���
create or replace PROCEDURE gugu(dan number)
is

begin
        if dan < 2 or dan>9 then
    DBMS_OUTPUT.PUT_LINE('�߸��� ���� �Դϴ�. 2~9���̰� �䱸!');
        else
        DBMS_OUTPUT.PUT_LINE('  **'||dan||'��  **');
            for a in 1..9 loop
            DBMS_OUTPUT.PUT_LINE(dan||' x '||a||' = '||dan*a);
            end loop;
        end if;
end;
/

exec gugu(11);
exec gugu(5);

--shop �� ����Ÿ �߰��ϱ� - ����
insert into shop VALUES(seq_shop.nextval, '���̽����콺',23000,'white');
insert into shop VALUES(seq_shop.nextval, '���̽�����',19000,'red');
insert into shop VALUES(seq_shop.nextval, 'üũ����',39000,'rainbow');
insert into shop VALUES(seq_shop.nextval, 'ĥ��û����',56000,'blue');
commit;
-- shop �� snag_color �� Ÿ�� ���� ����
alter table shop modify sang_color varchar(30);

--����3 : ��ǰ���� ���ڷ� ������ �� �ܾ ���Ե� ��� ��ǰ�� ����ϱ�
create or replace PROCEDURE sangpum(sang varchar2)
is
    Cursor s1
    is
    select * from shop where sang_name like '%'||sang||'%';
    
    --�˻��� ��ǰ ������ ���� ����
    v_cnt number(2);
begin
    select count(*) into v_cnt from shop where sang_name like '%'||sang||'%';
    if v_cnt = 0 then
    DBMS_OUTPUT.PUT_LINE(sang||' ��ǰ�� ��Ͽ� �����ϴ�');
    else
    DBMS_OUTPUT.PUT_LINE(sang||'��ǰ ��ȸ�ϱ�');
    DBMS_OUTPUT.PUT_LINE('�� '||v_cnt||'�� ��ȸ');
    DBMS_OUTPUT.PUT_LINE(' ');
    DBMS_OUTPUT.PUT_LINE('��ǰ��ȣ   ��ǰ��   ����   ����');
    DBMS_OUTPUT.PUT_LINE('-----------------------------------');
    for s in s1 loop
            DBMS_OUTPUT.PUT_LINE(s.sang_no||'  '||s.sang_name||'  '||
            s.sang_price||'  '||s.sang_color);
        exit when s1%notfound;
    end loop;
    end if;
end;
/
-- ����
exec sangpum ('û����');
exec sangpum ('�Ѻ�');
exec sangpum ('����');

-- ���� 4
/*
    exec addupdate('���̽�����','45000','black'); : '���̽�����' ��ǰ�� ������ �߰�
                                                    : '���̽�����' ��ǰ�� ������ ���� ����.
                                                    
*/

create or replace PROCEDURE addupdate(snag varchar2,price number,color varchar2)
is

    v_cnt number(2);
begin
    select count(*) into v_cnt from shop where sang_name=sang;
    if v_cnt = 0 then
     insert into shop VALUES(seq_shop.nextval, sang,price,color);
     DBMS_OUTPUT.PUT_LINE('ã�� ��ǰ�� ���� ��ǰ�� �߰��Ͽ����ϴ�');
    update shop set sang_price = 50000, sang_color = 'blue' where sang_name = '���̽�����';
    DBMS_OUTPUT.PUT_LINE('���̽������� ���ݰ� ���� ����');
    else
    update shop set sang_price = price, sang_color = color where sang_name = sang;
    DBMS_OUTPUT.PUT_LINE('���̽������� ���ݰ� ���� ����');
    end if;
end;
/

exec addupdate('���̽�����',);



















