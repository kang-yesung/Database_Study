package sec05;

import app.Database;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.result.DeleteResult;
import org.bson.Document;
import org.bson.conversions.Bson;
import org.bson.types.ObjectId;

import static com.mongodb.client.model.Filters.eq;

public class DeleteOneTest {
    public static void main(String[] args) {
        MongoCollection<Document> collection = Database.getCollection("todo");

        String id = "683528306fc7d549acc0a528";

        Bson query = eq("_id", new ObjectId(id));

        DeleteResult result = collection.deleteOne(query);

        System.out.println("==> DeleteResult : " + result.getDeletedCount());

        Database.close();
    }
}
