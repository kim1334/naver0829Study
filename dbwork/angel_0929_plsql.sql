-- pl-sql�̶�?
-- sql �� ������ ����Ҹ� �߰��ؼ� ���α׷��� �� ���� pl-sql �̶�� �Ѵ�
-- ���� 1
DECLARE
    -- ���� �����ϴ� ����
    v_no NUMBER(4, 1); --4�ڸ��� �Ҽ������� 1�ڸ� ���� �ִ� ���� ����

BEGIN
    -- sql �����̳� pl-sql ������ �ڵ��ϴ� ���� ( " := "����, " = "<- ��, �������
    v_no := 12.7;
    dbms_output.put_line(v_no); -- ��� ����
END;
/

--���� 2
DECLARE
    vname  VARCHAR2(20);
    vprice NUMBER(5);
BEGIN
    SELECT
        vname,
        vprice
    INTO
        fname,
        fprice
    FROM
        food
    WHERE
        num = 2;

    dbms_output.put_line(fname
                         || '���� '
                         || fprice
                         || '�Դϴ�');
END;
/

--���� 3
DECLARE
    pname  VARCHAR2(20);
    fmenu  VARCHAR2(20);
    fprice NUMBER(5);
BEGIN
    SELECT
        person_name,
        fname,
        fprice
    INTO
        pname,
        fmenu,
        fprice
    FROM
        food   f,
        person p
    WHERE
            f.food_num = p.food_num
        AND p.person_num = 9;

    dbms_output.put_line('�ֹ���:' || pname);
    dbms_output.put_line('�޴���:' || fmenu);
    dbms_output.put_line('�޴�����:' || fprice);
END;
/

-- ���� 4
-- ��ǰ���� ������ ������ �� �ش� ��ǰ���� ���ݰ� ������ ���
DECLARE
    vsangpum VARCHAR2(20) := 'üũ����';
    vcolor   VARCHAR2(20);
    vprice   NUMBER(7);
    vprice2  VARCHAR2(20);
BEGIN
    SELECT
        sang_price,
        sang_color,
        ltrim(to_char(sang_price, 'L999,999'))
    INTO
        vprice,
        vcolor,
        vprice2
    FROM
        shop
    WHERE
        sang_name = vsangpum;

    dbms_output.put_line('��ǰ��: ' || vsangpum);
    dbms_output.put_line('�� ��: ' || vcolor);
    dbms_output.put_line('�� ��: ' || vprice);
    dbms_output.put_line('�� ��: ' || vprice2);
END;
/


/*
  if  ���ǽ� then
        ����1;
else
    ����2;
    
    ����if��
    if ���ǽ�1 then
    ����1
    elseif ����2 then
    ����2;
    .....
    end if;
*/

--���� 5
-- ������ �´� �챸�ϱ�
accept year prompt '�¾ �⵵�� �Է��ϼ���';

DECLARE
    v_year NUMBER(4) := &year;
    v_mod  NUMBER(2) := MOD(v_year, 12); --�⵵�� 12�� ���� �������� ���Ѵ�.
    v_ddi  VARCHAR(10); --�츦 ������ ����
BEGIN
    IF v_mod = 0 THEN
        v_ddi := '������';
    ELSIF v_mod = 1 THEN
        v_ddi := '��';
    ELSIF v_mod = 2 THEN
        v_ddi := '��';
    ELSIF v_mod = 3 THEN
        v_ddi := '����';
    ELSIF v_mod = 4 THEN
        v_ddi := '��';
    ELSIF v_mod = 5 THEN
        v_ddi := '��';
    ELSIF v_mod = 6 THEN
        v_ddi := 'ȣ����';
    ELSIF v_mod = 7 THEN
        v_ddi := '�䳢';
    ELSIF v_mod = 8 THEN
        v_ddi := '��';
    ELSIF v_mod = 9 THEN
        v_ddi := '��';
    ELSIF v_mod = 10 THEN
        v_ddi := '��';
    ELSIF v_mod = 11 THEN
        v_ddi := '��';
    END IF;

    dbms_output.put_line(v_year
                         || '�����'
                         || v_ddi
                         || '���Դϴ�');
END;
/

--���� 5
-- db �÷��� Ÿ���� �������� ��� TYPE
accept iname prompt 'name?';

DECLARE
    v_name   student.name%TYPE := '&iname';
    v_height student.height%TYPE;
    v_java   student.java%TYPE;
    v_spring student.spring%TYPE;
BEGIN
    SELECT
        height,
        java,
        spring
    INTO
        v_height,
        v_java,
        v_spring
    FROM
        student
    WHERE
        name = v_name;

    dbms_output.put_line('�л��� : ' || v_name);
    dbms_output.put_line('Ű : ' || v_height);
    dbms_output.put_line('�ڹ����� : ' || v_java);
    dbms_output.put_line('���������� : ' || v_spring);
    dbms_output.put_line('���� : ' ||(v_java + v_spring));
END;
/

/*
 �ݺ��� : loop
 �����;
 exit when ����;
 end loop;
*/
--1���� 10���� �ݺ��ؼ� ���

DECLARE
    v_no NUMBER(2) := 0;
BEGIN
    LOOP
        v_no := v_no + 1;
        dbms_output.put_line('no=' || v_no);
        EXIT WHEN v_no = 10; --10�� ��� �ݺ����� ����������.
    END LOOP;
END;
/

--���� : ���� �Է��ϸ� �ش���� ����Ͻÿ�

accept vnum prompt 'dan???';

DECLARE
    v_num NUMBER(5) := '&vnum';
    v_dan NUMBER(5) := 1;
BEGIN
    LOOP
        dbms_output.put_line(v_num
                             || 'x'
                             || v_dan
                             || '='
                             ||v_num * v_dan);
        v_dan := v_dan + 1;
        EXIT WHEN v_dan = 9;
    END LOOP;
END;
/

-----�ͼ���
-- ���� 9 - Exception ó�� ( ���� 4 ����
accept sangpum prompt 'sangpum?';
DECLARE
    vsangpum VARCHAR2(20) := '&sangpum';
    vcolor   VARCHAR2(20);
    vprice   NUMBER(7);
    vprice2  VARCHAR2(20);
BEGIN
    SELECT
        sang_price,
        sang_color,
        ltrim(to_char(sang_price, 'L999,999'))
    INTO
        vprice,
        vcolor,
        vprice2
    FROM
        shop
    WHERE
        sang_name = vsangpum;

    dbms_output.put_line('��ǰ��: ' || vsangpum);
    dbms_output.put_line('�� ��: ' || vcolor);
    dbms_output.put_line('�� ��: ' || vprice);
    dbms_output.put_line('�� ��: ' || vprice2);
    
    --����� 2�� �̻��̰ų� ������ �����߻�
    --����Ŭ���� ����ó�� �ϴ� ���
    EXCEPTION
        when no_data_found then
        dbms_output.put_line(vsangpum||'��ǰ�� DB�� �����ϴ�.');
        when too_many_rows then
        dbms_output.put_line(vsangpum||'��ǰ�� DB�� �ΰ��̻� �����մϴ�');
        when OTHERS then
        dbms_output.put_line(vsangpum||'��ǰ�� ���� ���� �߻�!!! ���� �Ƹ���~~!');
END;
/

/*
    �ݺ���
    for ���� in [reverse]���۰�...������ loop
        �����;
        end loop;

*/
--���� 10 ����8 ������ ������ for������ ����
accept  dan prompt 'dan???';

DECLARE
    v_dan NUMBER(5) := '&dan';
    v_idx NUMBER(5);
BEGIN
    dbms_output.put_line('  **  '||v_dan||' �� **');
    for v_idx in 1..9 loop
    
        dbms_output.put_line(v_dan
                             || 'x'
                             || v_dan
                             || '='
                             ||v_idx * v_dan);
    END LOOP;
END;
/

--���ڵ� ������  ����Ÿ ��������

declare
    v_num student.num%type :=5;
    v_stu angel.student%rowtype; --���ڵ� ������ �о� �� ���.
    
BEGIN
    select * into v_stu
    from student where num = v_num;
    
    DBMS_Output.put_line('�̸�:'||v_stu.name);
    DBMS_Output.put_line('Ű:'||v_stu.height);
    DBMS_Output.put_line('�ڹ�:'||v_stu.java);
    DBMS_Output.put_line('������:'||v_stu.spring);
    DBMS_Output.put_line('��:'||v_stu.ban);
end;
/

-- db�� ��������Ÿ�� ��ȸ�� ���
/*
    Cursor : sql ���� �����Ҷ����� ����� �м��ǰ� ����Ǿ� ����� �����ϱ� ����
    Ư���� �޸� ������ ����ϴµ� �� ������ �����ϴ� ���� Ŀ���̴�.
    
    select ������ ���� ����Ÿ ��ȸ�� ����ϴ� ��ü�̴�
    
    Ŀ�� �Ӽ�
    sql%rowcount : ����� ���� ��ȯ
    sql%found : ���� �ֱ��� sql���� �ϳ� �̻��� �࿡ ������ �� ��� true
    sql%notFound : ������� ���� ���
    sql%isopen : �׻� false(�׻� close�� �ϱ� ������ �׻� false)
    
    
*/

-- ���� 12
declare
    v_sno number(3) := 20;
    v_shop angel.shop%rowtype;

    
BEGIN
select * into v_shop
from shop where sang_no=v_sno;

    DBMS_Output.put_line('��ǰ��:'||v_shop.sang_name);
    DBMS_Output.put_line('��ȸ�� ���హ��:'||sql%rowcount); --1
    
    --student �� java ���� �����ϱ�
    update student set java = 99;
    DBMS_Output.put_line('������ ���హ��:'||sql%rowcount); --1
end;
/

--���� ���ڵ� ��ȸ
--���� 13
declare
    Cursor s1
    is
    select * from shop;
    
BEGIN
    DBMS_Output.put_line('��ǰ��ȣ      ��ǰ��     ����      ����');
    DBMS_Output.put_line('------------------------------------------');
    for s in s1 loop
        exit when s1%notfound;
        DBMS_Output.put_line(s.sang_no||'   '||s.sang_name||'     ' 
        ||s.sang_color||'      '||s.sang_price);
    end loop;
end;
/


-- ���� 14
-- ��ǰ��, ����, ������ �Է��ϸ� shop db�� �߰��ϱ�........
accept isang prompt 'sangpum?';
accept icolor prompt 'color?';
accept iprice prompt 'price?';
declare
    v_sang shop.sang_name%type := '&isang';
    v_color shop.sang_color%type := '&icolor';
    v_price shop.sang_price%type := '&iprice';

BEGIN
insert into shop values (seq_shop.nextval,v_sang, v_price, v_color);
commit;
         DBMS_Output.put_line('��ǰ ������ �߰��߽��ϴ�');
end;
/


-- ���� : food ���̺�

/*
    fname , fprice, no �Է��� �޾Ƽ�
    no �� 1�̸� fname, fprice �� ������ �߰��� �ϰ�.
    no �� 2�� ��ü food ��ü ����Ÿ ��� 
    */


accept p_no prompt 'no?';
accept p_name prompt 'name?';
accept p_price prompt 'price?';
declare
    v_no food.food_num%type := '&p_no';
    v_name food.fname%type := '&p_name';
    v_price food.fprice%type := '&p_price';
        
        Cursor s1
    is
    select * from food;

BEGIN
    IF v_no = 1 THEN
insert into food values (seq_food.nextval, v_name, v_price);
 DBMS_Output.put_line('�޴� ������ �߰���');
    ELSIF v_no = 2 THEN
    DBMS_Output.put_line('���Ĺ�ȣ     ���ĸ�     ����');
    DBMS_Output.put_line('-------------------------------');
    for s in s1 loop
        exit when s1%notfound;
        DBMS_Output.put_line(s.food_num||'     '||s.fname||'     ' 
        ||s.fprice);
    end loop;
    end if;
end;
/




