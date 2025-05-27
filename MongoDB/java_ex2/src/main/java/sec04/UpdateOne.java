package sec04;
import app.Database;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.model.Updates;
import com.mongodb.client.result.UpdateResult;
import org.bson.Document;
import org.bson.conversions.Bson;
import org.bson.types.ObjectId;

import static com.mongodb.client.model.Filters.eq;

public class UpdateOne {
    public static void main(String[] args) {
        MongoCollection<Document> collection = Database.getCollection("todo");

        String id = "683528306fc7d549acc0a528";

        Bson query = eq("_id", new ObjectId(id));

        /*
        * Update : mongoDB의 수정 쿼리를 작성하기 위한 객체
        *  - combine() : 여러 조건의 수정을 해야할 때, 엮어주는 역할
        *  - set("필드명", "수정할값") : 해당 필드의 값을 수정할 값으로 변경
        * - currentTimeStamp("필드") : 필드의 값을 현재시간으로 변경
        *  */
        Bson updates = Updates.combine(
                Updates.set("name", "modify name"),
                Updates.currentTimestamp("lastUpdated"));

        // 조건에 맞는 하나의 도큐먼트를 업데이트
        UpdateResult result = collection.updateOne(query, updates);

        // 조건에 맞는 모든 도큐먼트를 업데이트
        // UpdateResult result = collection.updateMany(query, updates);

        System.out.println("==> UpdateResult : " + result.getModifiedCount());
        Database.close();
    }
}
