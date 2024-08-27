-- ONLY 오라클 참고만 하자 이말이야
-- 시퀀스 (순차적으로 증가,감소하는 값을 만들어주는 기능)

CREATE SEQUENCE test_seq
    START WITH 1  -- 시작값 (기본값은 증가할떄 최솟값, 감소할때 최댓값)
    INCREMENT BY 1 -- 증가값(양수면 증가, 음수면 감소, 기본값 1)
    MAXVALUE 10 -- 최댓값 (기본값은 증가일떄 1027, 감소일때는 -1)
    MINVALUE 1 -- 최솟값 ( 기본값은 증가일떄 1감소일때 -1028)
    NOCACHE -- 캐시 메모리 사용 여부 (CACHE) 
    NOCYCLE;  -- 순환 여부 (NOCYCLE이 기본, 순환시킬거면 CYCLE ) --> primary key를 만들기 위해서 사용함.

CREATE TABLE test_tbl(
    test_no NUMBER(2) PRIMARY KEY,
    TEST_msg VARCHAR2(100)
    );

--시퀀스 사용하기(NEXTVAL, CURRVAL)

INSERT INTO test_tbl
VALUES(test_seq.NEXTVAL, 'test');

SELECT test_seq.CURRVAL FROM dual; -- 시퀀스의 현재 값 확인
SELECT test_seq.NEXTVAL FROM dual; -- 시퀀스의 다음 값 확인

SELECT *FROM test_tbl;


-- 시퀀스 속성 수정(직접수정이 가능)
-- START WITH은 수정이 불가능 합니다.
ALTER SEQUENCE test_seq MAXVALUE 9999;
ALTER SEQUENCE test_seq INCREMENT BY 10;
ALTER SEQUENCE test_seq INCREMENT BY -10;
ALTER SEQUENCE test_seq MINVALUE 0;






































