import 'package:flutter/material.dart';
import 'package:flutter_navigator2/models/book.dart';
import 'package:flutter_navigator2/widgets/book_detials_screen.dart';

class BookDetailsPage extends Page {
  final Book book;

  BookDetailsPage({required this.book}) : super(key: ValueKey(book));

  @override
  Route createRoute(BuildContext context) {
    // return PageRouteBuilder(
    //     settings: this,
    //     pageBuilder: (context, animation, animation2) {
    //       final tween = Tween(begin: const Offset(0.0, 1.0), end: Offset.zero);
    //       final curveTween = CurveTween(curve: Curves.easeInOut);
    //
    //       return SlideTransition(
    //         position: animation.drive(curveTween).drive(tween),
    //         child: Container(),
    //       );
    //     });
    return MaterialPageRoute(
        settings: this,
        builder: (context) {
          return BookDetailsScreen(book: book);
        });
  }
}
