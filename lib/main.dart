import 'package:flutter/material.dart';
import 'package:flutter_navigator2/widgets/books_list_screen.dart';

import 'models/book.dart';
import 'widgets/book_details_page.dart';

void main() {
  runApp(BooksApp());
}

class BooksApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _BooksAppState createState() => _BooksAppState();
}

class _BooksAppState extends State<BooksApp> {
  Book? _selectedBook;
  bool show404 = false;
  List<Book> books = [
    Book(title: 'Stranger in a Strange Land', author: 'Robert A. Heinlein'),
    Book(title: 'Foundation', author: 'Isaac Asimov'),
    Book(title: 'Fahrenheit 451', author: 'Ray Bradbury'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Books App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Navigator(
        pages: [
          MaterialPage(
            key: const ValueKey('BooksListPage'),
            child: BooksListScreen(
              books: books,
              onTapped: _handleBookTrapped,
            ),
          ),
          if (show404)
            MaterialPage(
              key: const ValueKey('UnknownPage'),
              child: Container(),
            )
          else if (_selectedBook != null)
            BookDetailsPage(book: _selectedBook!)
        ],
        onPopPage: (route, result) {
          if (!route.didPop(result)) {
            return false;
          }
          setState(() {
            _selectedBook = null;
          });

          return true;
        },
      ),
    );
  }

  void _handleBookTrapped(Book book) {
    setState(() {
      _selectedBook = book;
    });
  }
}
