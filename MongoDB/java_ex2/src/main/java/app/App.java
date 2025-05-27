package app;

import app.domain.Todo;
import com.mongodb.client.MongoCollection;

import java.util.ArrayList;
import java.util.InputMismatchException;
import java.util.List;
import java.util.Scanner;

import static com.mongodb.client.model.Filters.eq;
import static com.mongodb.client.model.Updates.combine;
import static com.mongodb.client.model.Updates.set;

public class App {
    private static final Scanner scanner = new Scanner(System.in);
    private static final MongoCollection<Todo> collection = Database.getCollection("todo", Todo.class);

    public static void main(String[] args) {
        while (true) {
            System.out.println("\n==== Todo 관리 프로그램 ====");
            System.out.println("0. 종료");
            System.out.println("1. insertOne");
            System.out.println("2. insertMany");
            System.out.println("3. findAll");
            System.out.println("4. updateOne");
            System.out.println("5. deleteOne");
            System.out.print("원하는 작업 번호를 입력하세요: ");

            int choice;
            try {
                choice = scanner.nextInt();
                scanner.nextLine(); // 개행 문자 제거
            } catch (InputMismatchException e) {
                System.out.println("숫자만 입력하세요.");
                scanner.nextLine(); // 잘못된 입력 제거
                continue;
            }

            switch (choice) {
                case 0 -> {
                    System.out.println("프로그램을 종료합니다.");
                    Database.close();
                    return; // main 메서드 종료
                }
                case 1 -> insertOne();
                case 2 -> insertMany();
                case 3 -> findAll();
                case 4 -> updateOne();
                case 5 -> deleteOne();
                default -> System.out.println("잘못된 번호입니다.");
            }
        }
    }

    private static void deleteOne() {
        collection.deleteOne(
                eq("title", "insertMany 2"));
    }

    private static void updateOne() {

        collection.updateOne(
                eq("title", "insertMany 1"), // 조건
                combine(                // 수정할 내용
                        set("title", "updateOne 1"),
                        set("desc", "updateOne 1 테스트")
                )
        );

    }

    private static void findAll() {
        List<Todo> todos = new ArrayList<>();

        // into() : List에다 매핑한 find결과를 담아줌
        collection.find().into(todos);

        for(Todo todo : todos){
            System.out.println(todo);
        }
    }

    private static void insertMany(){
        List<Todo> list = new ArrayList<>();

        Todo todo1 = new Todo(null, "insertMany 1", "insertMany 테스트 확인1", false);
        Todo todo2 = new Todo(null, "insertMany 2", "insertMany 테스트 확인2", false);
        Todo todo3 = new Todo(null, "insertMany 3", "insertMany 테스트 확인3", false);

        list.add(todo1);
        list.add(todo2);
        list.add(todo3);

        collection.insertMany(list);

    }

    private static void insertOne() {
        Todo newTodo = new Todo(null, "POJO2", "POJO 테스트 확인2", false);

        System.out.println("ID : " + newTodo.getId() + "====> insert 이전");

        collection.insertOne(newTodo);

        // insertOne 을 할경우 객체에 id 값이 자동으로 저장됨
        System.out.println("ID : " + newTodo.getId() + "====> insert 이후");
    }
}