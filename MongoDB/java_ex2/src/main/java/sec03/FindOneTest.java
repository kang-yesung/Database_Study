package sec03;

import app.Database;
import com.mongodb.client.MongoCollection;
import org.bson.conversions.Bson;
import org.bson.types.ObjectId;
import org.bson.Document;
import static com.mongodb.client.model.Filters.eq;


public class FindOneTest {
    public static void main(String[] args) {
        MongoCollection<Document> collection = Database.getCollection("todo");
        String id = "683528306fc7d549acc0a528";
        // ObjectId : 도큐먼트의 기본 고유 식별자
        /*
        * Bson : Binary Json
        * */

        // db.users.find({age : {$gr:20}) -> 조건문에 해당하는 쿼리
        Bson query = eq("_id", new ObjectId(id));

        // 조건에 해당하ㅡ Document 찾기
        // .first() : 첫버째로 찾은 도큐머트 반환
        Document doc = collection.find(query).first();
        System.out.println("==> findByIdResult : " + doc);
        Database.close();
    }
}