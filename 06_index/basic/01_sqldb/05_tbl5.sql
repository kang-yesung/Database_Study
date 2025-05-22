use sqldb;

create table tbl5
(
    a INT UNIQUE not null,
    b INT UNIQUE, -- b 유니크 키 -> UNIQUE 인덱스 생성 (중복불가, null 허용)
    c INT UNIQUE, -- c 유니크 키 -> UNIQUE 인덱스 생성 (중복불가, null 허용)
    d INT primary key -- PRIMARY 클러스트형 인덱스 설정
);

-- tbl5가 가지고 있는 인덱스 조회
show index from tbl5;