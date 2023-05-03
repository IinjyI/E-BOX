import 'package:flutter/material.dart';

class BooksItemScreen extends StatelessWidget {
  static const String id = 'BooksItemScreen';

  final String bookName, author, genre, user;
  const BooksItemScreen(
      {Key? key,
      required this.bookName,
      required this.author,
      required this.genre,
      required this.user})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            bookName,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30),
          ),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'author: $author',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
              ),
              Text(
                'genre: $genre',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
              ),
            ],
          ),
          Text(
            'uploaded by: $user',
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
          ),
        ]),
      ),
    );
  }
}
