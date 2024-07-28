import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_book_list/book_state_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookAddScreen extends ConsumerWidget {
  const BookAddScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var title = "";
    var description = "";

    return Scaffold(
        appBar: AppBar(
          title: const Text("책 추가하기"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(hintText: "책 제목을 입력해주세요."),
                onChanged: (text) {
                  title = text;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(hintText: "책 소개를 입력해주세요."),
                onChanged: (text) {
                  description = text;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                  onPressed: () {
                    final book = Book(title: title, description: description);
                    ref.read(booksProvider.notifier).addBook(book);
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.white),
                  child: const Text("책 추가하기"))
            ],
          ),
        ));
  }
}
