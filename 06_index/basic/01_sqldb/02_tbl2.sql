create table tbl2
(
    a INT PRIMARY KEY, -- a 기본키 -> 자동으로 클러스트형(PK) 인덱스 생성 (중복불가, null 불가)
    b INT UNIQUE, -- b 유니크 키 -> UNIQUE 인덱스 생성 (중복불가, null 허용)
    c INT UNIQUE, -- c 유니크 키 -> UNIQUE 인덱스 생성 (중복불가, null 허용)
    d INT
);

-- tbl2가 가지고 있는 인덱스 조회
show index from tbl2;