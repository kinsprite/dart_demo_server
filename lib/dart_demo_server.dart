import 'package:json_annotation/json_annotation.dart';

part 'dart_demo_server.g.dart';

int calculate() {
  return 6 * 7;
}

@JsonSerializable()
class Book {
  int id;
  String name;
  double price;

  Book(this.id, this.name, this.price);

  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);

  Map<String, dynamic> toJson() => _$BookToJson(this);
}

class BookStore {
  List<Book> books = [
    Book(1, 'A-1', 10),
    Book(2, 'A-2', 16),
    Book(3, 'A-3', 28),
  ];

  int addBook(String name, double price) {
    var id = books.isNotEmpty ? books.last.id + 1 : 1;
    books.add(Book(id, name, price));
    return id;
  }

  void deleteBook(int id) {
    books.removeWhere((book) => book.id == id);
  }

  List<Book> getBooks() {
    return books;
  }
}
