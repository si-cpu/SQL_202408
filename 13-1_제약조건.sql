-- 테이블 생성과 제약조건
-- : 테이블에 부적절한 데이터가 입력되는 것을 방지하기 위해 규칙을 설정하는 것.

-- 테이블 열레벨 제약조건 (PRIMARY KEY, UNIQUE, NOT NULL, FOREIGN KEY, CHECK)
-- PRIMARY KEY: 테이블의 고유 식별 컬럼입니다. (주요 키) 때에 따라서 2개가 될수도 있다.
-- UNIQUE: 유일한 값을 갖게 하는 컬럼 (중복값 방지)
-- NOT NULL: null을 허용하지 않음. (필수값)
-- FOREIGN KEY: 참조하는 테이블의 PRIMARY KEY를 저장하는 컬럼
-- CHECK: 정의된 형식만 저장되도록 허용.

-- 컬럼레벨 제약조건 (컬럼 선언마다 제약조건 지정)
CREATE TABLE dept2(
    -- 제약조건 식별자는 생략이 가능합니다. (오라클에서 알아서 이름 지음)
    dept_no NUMBER(2) CONSTRAINT dept2_deptno_pk PRIMARY KEY,
    dept_name VARCHAR2(14)NOT NULL CONSTRAINT dept2_deptname_uk UNIQUE, --필수이며, 중복없다고 선언한것.
    loca NUMBER(4) CONSTRAINT dept2_loca_locid_fk REFERENCES locations(location_id),
    dept_bonus NUMBER(10)CONSTRAINT dept2_bonus_ck CHECK(dept_bonus > 10000),
    dept_gender VARCHAR2(1) CONSTRAINT dept2_gender_ck CHECK(dept_gender IN('M','F'))    
);
---------------------------------------------------------------------------------
DROP TABLE dept2;
---------------------------------------------------------------------------------
-- 테이블 레벨 제약 조건 ( 모든 열 선언 후 제약 조건을 취하는 방식)
CREATE TABLE dept2(
    dept_no NUMBER(2),
    dept_name VARCHAR2(14) NOT NULL,
    loca NUMBER(4),
    dept_bonus NUMBER(10),
    dept_gender VARCHAR2(1),
    
    CONSTRAINT dept2_deptno_pk PRIMARY KEY(dept_no), 
    CONSTRAINT dept2_deptname_uk UNIQUE(dept_name),
    CONSTRAINT dept2_loca_locid_fk FOREIGN KEY(loca) REFERENCES locations(location_id),
    CONSTRAINT dept2_bonus_ck CHECK(dept_bonus > 10000),
    CONSTRAINT dept2_gender_ck CHECK(dept_gender IN('M', 'F'))
);

--------------------------------------------------------------------------------


























