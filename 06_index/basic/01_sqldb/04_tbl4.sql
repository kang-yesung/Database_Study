use sqldb;

create table tbl4
(
    -- 클러스트형 인덱스
    -- mysql의 innoDB의 경우 테이블의 pk가 없을경우
    -- not null + unique 제약조건이 있는경우 첫번째 컬럼을 클러스트형 인덱스로 삼는다
    a INT UNIQUE not null,
    b INT UNIQUE, -- b 유니크 키 -> UNIQUE 인덱스 생성 (중복불가, null 허용)
    c INT UNIQUE, -- c 유니크 키 -> UNIQUE 인덱스 생성 (중복불가, null 허용)
    d INT
);

-- tbl4가 가지고 있는 인덱스 조회
show index from tbl4;