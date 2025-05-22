use sqldb;

create table tbl3
(
    a INT UNIQUE, -- a 유니크 키 -> UNIQUE 인덱스 생성 (중복불가, null 허용)
    b INT UNIQUE, -- b 유니크 키 -> UNIQUE 인덱스 생성 (중복불가, null 허용)
    c INT UNIQUE, -- c 유니크 키 -> UNIQUE 인덱스 생성 (중복불가, null 허용)
    d INT
);

-- tbl3이 가지고 있는 인덱스 조회
show index from tbl3;