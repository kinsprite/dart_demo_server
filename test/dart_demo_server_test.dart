import 'package:dart_demo_server/dart_demo_server.dart';
import 'package:test/test.dart';

void main() {
  test('addBook_id', () {
    var store = BookStore();
    store.addBook('Test-1', 123.45);
    var books = store.getBooks();
    expect(books.last.id, books.length);
  });
}
