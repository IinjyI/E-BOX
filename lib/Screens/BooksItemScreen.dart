import 'package:ebooks/CustomWidgets/CustomInfoItem.dart';
import 'package:ebooks/CustomWidgets/CustomTextField.dart';
import 'package:ebooks/Screens/UserScreen.dart';
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
          CustomInfoItem(
            label: 'author: $author',
            icon: Icons.person,
          ),
          const SizedBox(height: 10),
          CustomInfoItem(
              label: 'genre: $genre', icon: Icons.question_mark_sharp),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserScreen(
                    user: user,
                  ),
                ),
              );
            },
            child: CustomInfoItem(
                label: 'uploaded by:  $user',
                icon: Icons.account_circle_rounded),
          ),
        ]),
      ),
    );
  }
}
