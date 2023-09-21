-- anger 계정 연습
--전체 시퀀스 조회
SELECT  *  FROM seq;

-- sequence 생성
create SEQUENCE seq1 start with 1 INCREMENT by 1; -- 1부터 1씩 증가되는 시퀀스 생성
create SEQUENCE seq2 start with 5 INCREMENT by 3 nocache; -- 5부터 3씩 증가, cache값은 0
create SEQUENCE seq3 maxvalue 100 nocache; -- start with 와 increment 생략시 1로 초기값 지정

--값 발생시키기 
create SEQUENCE seq_test NOCACHE;

-- table 생성
create table test (
    num number(3) primary key, 
    name varchar2(20) not null,
    blood char(2) default 'A',
    weight number(5, 2),
    birthday date);
    
    --데이타 추가
    -- 일부 데이터만 넣는 경우 컬럼명을 반드시 표기한다.
    insert into test (num,name) values (seq_test.nextval, '캔디');

-- 순서대로 모든 컬럼값을 넣는 경우 컬럼명 생략가능
insert into test values (seq_test.nextval,'캐서린', 'AB', 67.89, sysdate);

-- 제약 조건에 안맞는 경우 오류 확인
insert into test (num,blood) values (seq_test.nextval, 'O');
insert into test (num,name,blood) values (2 ,'lee' , 'O');

--제대로 된 데이터 3개정ㄷ만 추가하기
insert into test values (seq_test.nextval,'강호동', 'B', 78.9, '2000-10-10');
insert into test values (seq_test.nextval,'유재석', 'A', 76.45, '1992-05-28');
insert into test values (seq_test.nextval,'이영자', 'O', 77.77, '1988-10-15');

-- rollback; --마지막 commit 한 이후 sql문(DML:insert, delete, update) 모두 취소
commit; -- 더이상 rollback 안됨

insert into test values (seq_test.nextval,'김말동', 'B', 56.78 ,'1989-09-09');

--이상태에서 rollback 하면 누가 취소될까?

rollback;

-- 수정 , 강호동의 혈액형을 AB형으로 수정
update test set blood = 'AB' where name = '강호동';

-- 두개의 컬럼 수정
update test set weight = 80.8, birthday = sysdate where num = 8 ;

--삭제
delete from test; -- 모든 데이터가 삭제되므로 주의해야한다
rollback;

--num 8,9,10 을 삭제하려면
delete from test where num in (7,9,10);

--table 제거
drop table test;

--시퀀스 제거
drop SEQUENCE seq_test;
rollback; -- DML(insert, delete, update 인 경우에만 롤백이 된다 drop는 안됨) 
----------------------------------------------------------------------------------
create table person (
    num number(3) CONSTRAINT person_pk_num primary key,
    blood char(2));
    
    --기존 제약조건 제거
    alter table person drop CONSTRAINT person_pk_num;
    
    --다시 primary key 에 대한 제약조건 추가
    alter table person add constraint person_num_pk primary key(num);
    
    --blood 에 대해서 check 제약조건 추가
    alter table person add constraint person_ck_blood check (blood in ('A','B','O','AB'));
    
    --데이타 추가
    insert into person values (1,'A');
    insert into person values (1,'B'); --ORA-00001: 무결성 제약 조건(ANGEL.PERSON_PK_NUM)에 위배됩니다
    insert into person values (2,'b');  -- 체크 제약조건(ANGEL.PERSON_CK_BLOOD)이 위배되었습니다
    insert into person values (2,'O');
    
    --컬럼을 추가(add
    alter table person add name varchar2(20);
    alter table person add score number(5, 1) default 30.5;
    
    --컬럼명 제가 (drop column)
    alter table person drop column num;
    
    -- java 라는 컬럼을 number 타입으로 추가 후 1~100 사이값만 들어오도록 제약조건도 추가
    alter table person add java number(3) default 0;
    alter table person add CONSTRAINT person_ck_java check (java>=0 and java<=100);
    
    --컬럼명 변경 rename column
    alter table person rename column java to spring;
    
    --데이터 추가시 컬럼 순서대로 주기싫을 경우, 컬럼명 주면 된다
    insert into person (name,blood,spring,score) values ('lee','O',90,35);
    
    drop table person;
    
    --문제
    --테이블 생성 (student) : num 숫자(5),name 문자열(10),height 숫자(5,1),
    --  java 숫자(3) 기본값 10,spring 숫자(3) 기본값 10, ban 문자열(20)
    create table student (
        num number(5),
        name varchar2(10),
        height number(5,1),
        spring number(3) default 10,
        java number(3) default 10,
        ban varchar2(20)
        );
        
        ----시퀀스 생성  seq_stu  기본(1부터 1씩증가), nocache 추가
        create SEQUENCE seq_stu start with 1 INCREMENT by 1 nocache; --1부터 1 증가는 생략해도 된다.
        
        
        --제약조건들 추가
        --num  에 primary key 추가(student_pk_nu)
        alter table student add CONSTRAINT student_pk_num primary key(num); -- 이름은 보통 테이블명 - 제약조건 - 컬럼명 이렇게 한다 student pk num
        
        --java,spring 은 1~100 만 가능하도록 check 제약조건 추가
        alter table student add CONSTRAINT student_ck_java check (java>=1 and java<=100);
        alter table student add CONSTRAINT student_ck_spring check (spring>=1 and spring<=100);
        
        --ban 은 '햇님반','달님반','별님반' 만 추가할수 있도록 check 추가
        alter table student add CONSTRAINT student_ck_ban check (ban in('햇님반', '달님반', '별님반')); --or로 해도 된다 햇님 or 달님 or 별님 or;
        
        --5개 정도만 데이타를 추가해보자
       
        insert into student (num,name,height,java,spring,ban) values (1,'KIM',120,50,30,'달님반');
        insert into student (num,name,height,java,spring,ban) values (2,'이진',120,50,30,'햇님반');
        insert into student (num,name,height,java,spring,ban) values (3,'이효리',120,50,30,'별님반');
        insert into student (num,name,height,java,spring,ban) values (4,'강호동',120,50,30,'햇님반');
        insert into student (num,name,height,java,spring,ban) values (5,'원빈',120,50,30,'달님반');
       
        -- 데이터 추가 다른 방법 (아래와 같은 방법을 더 많이 사용, 순서대로 데이터를 입력한다면 따로 컬럼언급 필요없음.
        insert into student values (seq_stu.nextval,'이철수',179.1,90,86,'햇님반');
        
        --커밋하기
        commit;
        
        --num>=4 이상 모두 삭제
        delete from student where num>=4;
        
        -- num 이 3인 사람의 java점수를 99로 ,ban을 '달님반' 으로 수정
        update student set java = 99, ban = '달님반' where num = 3;
        
        --num=2 인사람의 키를 188.9 로 수정
        update student set height = 188.9 where num =2;
        
        --num=2 인 데이타 삭제
        delete from student where num = 2;
        
        --데이타 3개정도 더 추가
        insert into student (num,name,height,java,spring,ban) values (7,'일락',170,87,80,'햇님반');
        insert into student (num,name,height,java,spring,ban) values (10,'현상',173,76,29,'달님반');
        insert into student (num,name,height,java,spring,ban) values (29,'성택',178,59,90,'별님반');
        commit;
        
        --조회 : 이름  반 자바  스프링  총점  평균 -총점이 높은 사람부터 출력
        select name,ban,java,spring,(java+spring) total,(java+spring)/2 avg from student order by total desc;
       
        
        
        
        


  





