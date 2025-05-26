
//numbers 컬렉션에 20,000개의 문서를 생성하세요.
//○ 문서의 형태: { num: i }
for (let i = 0; i < 20000; i++) {
    db.members.insertOne({
        num: i,
        name: "스마트폰" + i
    })
}
//numbers 컬렉션의 문서 개수를 출력하세요.
db.members.find().count()

//numbers 컬렉션에서 num의 값이 20이상 25이하인 문서를 출력하세요.
db.members.find({
    num : {$gte : 20 , $lte:25}
})

//위 쿼리의 실행 통계를 출력하세요.
db.numbers.find({
    num: { $gte: 20, $lte: 25 }
}).explain("executionStats")

// numbers 컬렉션의 num 키에 대해서 인덱스를 생성하세요.
db.members.createIndex({num : 1})

// 위에서 생성한 인덱스 정보를 출력하세요.
db.members.getIndexes()

db.numbers.find({
    num: { $gte: 20, $lte: 25 }
}).explain("executionStats")