import 'package:flutter/material.dart';
import 'package:flutter_navigator2/models/book.dart';

class BooksListScreen extends StatelessWidget {
  final List<Book> books;
  final ValueChanged<Book> onTapped;

  const BooksListScreen({Key? key, required this.books, required this.onTapped}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        shrinkWrap: true,
        children: [
          for (final book in books)
            ListTile(
              title: Text(book.title, textAlign: TextAlign.center),
              subtitle: Text(book.author, textAlign: TextAlign.center),
              onTap: () => onTapped(book),
            ),
        ],
      ),
    );
  }
}
