import 'package:flutter_riverpod/flutter_riverpod.dart';

final booksProvider = // 관리할 StateNotifier와 Notifier가 관리할 타입을 넣어줌
    StateNotifierProvider<BookStateNotifier, List<Book>>((ref) {
  return BookStateNotifier();
});

// List 형식의 책 상태를 관리할 것이라 제네릭을 통해 나타냄
class BookStateNotifier extends StateNotifier<List<Book>> {
  BookStateNotifier() : super([]);
// state = List<Book> -> 상태를 변경하는 것이라서 .add와 같은 메소드를 사용하지 않음
  void addBook(Book newBook) {
    state = [...state, newBook];
  }

  void removeBook(Book removeBook) {
    state = state.where((book) => book != removeBook).toList();
  }
}

class Book {
  final String title;
  final String description;

  Book({required this.title, required this.description});
}
