// use shop

// 조건연산자
/*
* $or
* - 여러조건중 하나라도 만족하는 문서를 찾을 때 사용
* */
db.member.find({
    $or: [
        { office: "seoul"},
        { age: 1}
    ]
})

/*
* $and
* - 모든 조건을 만족하는 문서를 찾을 때 사용
* */
db.member.find({
    $and: [
        { office: "busan"},
        { age: 1}
    ]
})

/*
* $in
* - 지정한 값중 하나라도 일치하면 해당 문서를 반환
* */
db.member.find({
    office: { $in: ["busan", "seoul"]}
})

// 비교연산자
// - 숫자 또는 날짜 값을 기준으로 비교연산할때 사용
/*
* $gt  (greater than): 값보다 큰 문서
* $lt  (less than): 값보다 작은 문서
* $gte (greater than or equal): 값보다 크거나 같은 문서
* $lte (less than or equal): 값보다 작거나 같은 문서
* */
db.member.find({
    age: { $gt: 50}
})
db.member.find({
    age: { $lt: 10}
})
db.member.find({
    age: { $gte:20, $lte:30 }
})

/*
* $ne
* not equal (같지 않음) 조건
* */
db.member.find({
    office: { $ne : "busan"}
})
/*
* $exists
* - 특정 필드가 존재하는 문서만 찾기
* - true면 해당 필드가 있으면 조회
* - false면 해당필드가 없어야 조회
* */
// age가 1~10까지인 member들의 phone 필드 지우기
db.member.updateMany({
    age: { $gte: 1, $lte: 10}
}, {
    $unset: {phone:""}
})
// $not : 부정연산자 (조건을 부정할때 사용)
db.member.find({
    phone: { $not : { $exists: true}}
})

/*
* $regex
* 정규표현식 검색
* */
db.member.find({
    // name이 G로 시작하는 member
    name: {$regex: /^G/}
})

//다음 형태의 문서 20,000건을 추가하세요.
//○ database: test
//○ collecti다음 형태의 문서 20,000건을 추가하세요.
//○ database: test
//○ collection: product
//○ 문서 필드
// num: 순번 (0부터 시작)
// name: '스마트폰 ' + 순번on: product
//○ 문서 필드
// num: 순번 (0부터 시작)
// name: '스마트폰 ' + 순번
for (let i = 0; i < 20000; i++) {
    db.product.insertOne({
        num: i,
        name: "스마트폰" + i
    })
}

// product 컬렉션의 전체 문서수를 출력하세요.
db.product.find().count();

// product 컬렉션의 문서를 num의 내림 차순으로 정렬하여 출력하세요.
db.product.find().sort({num: -1}).limit(10);

// product 컬렉션의 문서를 num의 내림 차순으로 정렬한 상태에서 다음을 처리하세요.
db.product.find().sort({num: -1}).skip(50).limit(10);

// product 컬렉션에서 num이 15미만 이거나 19995 초과인 것을 출력하세요.
db.product.find({
    $or: [{num: {$lt: 15}}, {num: {$lt: 19995}}]
})

// product 컬렉션에서 name이 '스마트폰 10', '스마트폰 100', '스마트폰 1000' 중에 하나이면 출력하세요.
db.product.find({
    name: {$in: ["스마트폰10", "스마트폰100", "스마트폰1000"]}
})
// product 컬렉션에서 num이 5보다 작은 문서를 출력하는데, name만 출력하세요.(_id 출력하면 안됨)
db.product.find({num: {$lt: 5}}, {name: 1, _id: 0})
