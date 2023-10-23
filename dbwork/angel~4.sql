
accept p_no prompt 'no?';
accept p_name prompt 'name?';
accept p_price prompt 'price?';


declare
    v_name food.fname%type := '&p_name';
    v_price food.fprice%type := '&p_price';
     v_no food.food_num%type := '&p_no';
        
        Cursor s1
    is
    select * from food;

BEGIN
    IF v_no = 1 THEN
insert into food values (seq_food.nextval, v_name, v_price);
 DBMS_Output.put_line('메뉴 정보를 추가함');
    ELSIF v_no = 2 THEN
    DBMS_Output.put_line('음식번호     음식명     가격');
    DBMS_Output.put_line('-------------------------------');
    for s in s1 loop
        exit when s1%notfound;
        DBMS_Output.put_line(s.food_num||'     '||s.fname||'     ' 
        ||s.fprice);
    end loop;
    end if;
end;
/