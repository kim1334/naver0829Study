-- pl-sql이란?
-- sql 언어에 절차적 언어요소를 추가해서 프로그래밍 한 것을 pl-sql 이라고 한다
-- 예제 1
DECLARE
    -- 변수 선언하는 영역
    v_no NUMBER(4, 1); --4자리에 소숫점이하 1자리 값을 넣는 변수 선언

BEGIN
    -- sql 구문이나 pl-sql 문으로 코딩하는 영역 ( " := "대입, " = "<- 비교, 동등연산자
    v_no := 12.7;
    dbms_output.put_line(v_no); -- 출력 문장
END;
/

--예제 2
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
                         || '님은 '
                         || fprice
                         || '입니다');
END;
/

--예제 3
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

    dbms_output.put_line('주문자:' || pname);
    dbms_output.put_line('메뉴명:' || fmenu);
    dbms_output.put_line('메뉴가격:' || fprice);
END;
/

-- 예제 4
-- 상품명을 변수에 지정한 후 해당 상품명의 가격과 색상을 출력
DECLARE
    vsangpum VARCHAR2(20) := '체크자켓';
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

    dbms_output.put_line('상품명: ' || vsangpum);
    dbms_output.put_line('색 상: ' || vcolor);
    dbms_output.put_line('단 가: ' || vprice);
    dbms_output.put_line('단 가: ' || vprice2);
END;
/


/*
  if  조건식 then
        문장1;
else
    문장2;
    
    다중if문
    if 조건식1 then
    문장1
    elseif 조건2 then
    문장2;
    .....
    end if;
*/

--예쩨 5
-- 연도에 맞는 띠구하기
accept year prompt '태어난 년도를 입력하세요';

DECLARE
    v_year NUMBER(4) := &year;
    v_mod  NUMBER(2) := MOD(v_year, 12); --년도를 12로 나눈 나머지를 구한다.
    v_ddi  VARCHAR(10); --띠를 저장할 변수
BEGIN
    IF v_mod = 0 THEN
        v_ddi := '원숭이';
    ELSIF v_mod = 1 THEN
        v_ddi := '닭';
    ELSIF v_mod = 2 THEN
        v_ddi := '개';
    ELSIF v_mod = 3 THEN
        v_ddi := '돼지';
    ELSIF v_mod = 4 THEN
        v_ddi := '쥐';
    ELSIF v_mod = 5 THEN
        v_ddi := '소';
    ELSIF v_mod = 6 THEN
        v_ddi := '호랑이';
    ELSIF v_mod = 7 THEN
        v_ddi := '토끼';
    ELSIF v_mod = 8 THEN
        v_ddi := '용';
    ELSIF v_mod = 9 THEN
        v_ddi := '뱀';
    ELSIF v_mod = 10 THEN
        v_ddi := '말';
    ELSIF v_mod = 11 THEN
        v_ddi := '양';
    END IF;

    dbms_output.put_line(v_year
                         || '년생은'
                         || v_ddi
                         || '띠입니다');
END;
/

--예쩨 5
-- db 컬럼의 타입을 가져오는 방법 TYPE
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

    dbms_output.put_line('학생명 : ' || v_name);
    dbms_output.put_line('키 : ' || v_height);
    dbms_output.put_line('자바점수 : ' || v_java);
    dbms_output.put_line('스프링점수 : ' || v_spring);
    dbms_output.put_line('총점 : ' ||(v_java + v_spring));
END;
/

/*
 반복문 : loop
 문장들;
 exit when 조건;
 end loop;
*/
--1부터 10까지 반복해서 출력

DECLARE
    v_no NUMBER(2) := 0;
BEGIN
    LOOP
        v_no := v_no + 1;
        dbms_output.put_line('no=' || v_no);
        EXIT WHEN v_no = 10; --10일 경우 반복문을 빠져나간다.
    END LOOP;
END;
/

--문제 : 단을 입력하면 해당단을 출력하시오

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

-----익셉션
-- 예제 9 - Exception 처리 ( 예제 4 복사
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

    dbms_output.put_line('상품명: ' || vsangpum);
    dbms_output.put_line('색 상: ' || vcolor);
    dbms_output.put_line('단 가: ' || vprice);
    dbms_output.put_line('단 가: ' || vprice2);
    
    --결과가 2개 이상이거나 없으면 오류발생
    --오라클에서 예외처리 하는 방법
    EXCEPTION
        when no_data_found then
        dbms_output.put_line(vsangpum||'상품은 DB에 없습니다.');
        when too_many_rows then
        dbms_output.put_line(vsangpum||'상품이 DB애 두개이상 존재합니다');
        when OTHERS then
        dbms_output.put_line(vsangpum||'상품에 대한 오류 발생!!! 뭔지 아몰랑~~!');
END;
/

/*
    반복문
    for 변수 in [reverse]시작값...최종값 loop
        문장들;
        end loop;

*/
--예제 10 예제8 구구단 복수하 for문으로 변경
accept  dan prompt 'dan???';

DECLARE
    v_dan NUMBER(5) := '&dan';
    v_idx NUMBER(5);
BEGIN
    dbms_output.put_line('  **  '||v_dan||' 단 **');
    for v_idx in 1..9 loop
    
        dbms_output.put_line(v_dan
                             || 'x'
                             || v_dan
                             || '='
                             ||v_idx * v_dan);
    END LOOP;
END;
/

--레코드 단위로  데이타 가져오기

declare
    v_num student.num%type :=5;
    v_stu angel.student%rowtype; --레코드 단위로 읽어 올 경우.
    
BEGIN
    select * into v_stu
    from student where num = v_num;
    
    DBMS_Output.put_line('이름:'||v_stu.name);
    DBMS_Output.put_line('키:'||v_stu.height);
    DBMS_Output.put_line('자바:'||v_stu.java);
    DBMS_Output.put_line('스프링:'||v_stu.spring);
    DBMS_Output.put_line('반:'||v_stu.ban);
end;
/

-- db의 여러데이타를 조회할 경우
/*
    Cursor : sql 문을 실행할때마다 명령이 분석되고 실행되어 결과를 보관하기 위한
    특별한 메모리 영역을 사용하는데 이 영역을 참조하는 것이 커서이다.
    
    select 문에서 여러 데이타 조회시 사용하는 객체이다
    
    커서 속성
    sql%rowcount : 실행된 갯수 반환
    sql%found : 가장 최근의 sql문이 하나 이상의 행에 영향을 준 경우 true
    sql%notFound : 결과행이 없는 경우
    sql%isopen : 항상 false(항상 close를 하기 때문에 항상 false)
    
    
*/

-- 예제 12
declare
    v_sno number(3) := 20;
    v_shop angel.shop%rowtype;

    
BEGIN
select * into v_shop
from shop where sang_no=v_sno;

    DBMS_Output.put_line('상품명:'||v_shop.sang_name);
    DBMS_Output.put_line('조회된 실행갯수:'||sql%rowcount); --1
    
    --student 의 java 점수 변경하기
    update student set java = 99;
    DBMS_Output.put_line('수정된 실행갯수:'||sql%rowcount); --1
end;
/

--여러 레코드 조회
--예제 13
declare
    Cursor s1
    is
    select * from shop;
    
BEGIN
    DBMS_Output.put_line('상품번호      상품명     색상      가격');
    DBMS_Output.put_line('------------------------------------------');
    for s in s1 loop
        exit when s1%notfound;
        DBMS_Output.put_line(s.sang_no||'   '||s.sang_name||'     ' 
        ||s.sang_color||'      '||s.sang_price);
    end loop;
end;
/


-- 예제 14
-- 상품명, 색상, 가격을 입력하면 shop db에 추가하기........
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
         DBMS_Output.put_line('상품 정보를 추가했습니다');
end;
/


-- 문제 : food 테이블

/*
    fname , fprice, no 입력을 받아서
    no 가 1이면 fname, fprice 로 데이터 추가를 하고.
    no 가 2면 전체 food 전체 데이타 출력 
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




