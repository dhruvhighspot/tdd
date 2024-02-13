import 'package:flutter_test/flutter_test.dart';
import 'package:tdd/pages/home/model/home_model.dart';

void main() {
  late UsersResponse todos;

  setUp(() {
    todos = UsersResponse(
        id: 1,
        name: "Emily Johnson",
        company: "ABC Corporation",
        username: "emily_johnson",
        email: "emily.johnson@abccorporation.com",
        address: "123 Main St",
        zip: "12345",
        state: "California",
        country: "USA",
        phone: "+1-555-123-4567",
        photo: "http://placeimg.com/640/480/people");
  });

  test('TodosResponse Initialization Test', () {
    // Verify values are set correctly
    expect(todos.name, "Emily Johnson");
    expect(todos.id, 1);
    expect(todos.username, "emily_johnson");
    expect(todos.zip, "12345");
  });

  test('TodosResponse CopyWith Test', () {
    final updatedTodos = todos.copyWith();

    // Verify the updated object has the new values
    expect(todos.name, "Emily Johnson");
    expect(todos.id, 1);
    expect(todos.username, "emily_johnson");
    expect(todos.zip, "12345"); // completed should remain the same
  });

  test('TodosResponse Serialization/Deserialization Test', () {
    // Serialize the object to a Map
    final jsonMap = todos.toJson();

    // Verify the Map has the expected values
    expect(jsonMap['name'], "Emily Johnson");
    expect(jsonMap['id'], 1);
    expect(jsonMap['username'], "emily_johnson");
    expect(jsonMap['zip'], '12345');

    // Deserialize the Map back to a TodosResponse object
    final deserializedTodos = UsersResponse.fromJson(jsonMap);

    // Verify the deserialized object has the same values as the original object
    expect(deserializedTodos.name, "Emily Johnson");
    expect(deserializedTodos.id, 1);
    expect(deserializedTodos.username, "emily_johnson");
    expect(deserializedTodos.zip, '12345');
  });
}
