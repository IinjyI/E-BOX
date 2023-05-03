import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebooks/Functions/DBandAuth/database.dart';
import 'package:flutter/material.dart';

import '../CustomWidgets/CustomBooksItem.dart';
import '../CustomWidgets/CustomNotLoggedIn.dart';
import '../Functions/DBandAuth/sharedPrefs.dart';

class MyBooksScreen extends StatelessWidget {
  const MyBooksScreen({Key? key}) : super(key: key);
  static const String id = 'MyBooksScreen';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: MyBooks(),
      ),
    );
  }
}

class MyBooks extends StatefulWidget {
  const MyBooks({Key? key}) : super(key: key);
  @override
  State<MyBooks> createState() => _MyBooksState();
}

class _MyBooksState extends State<MyBooks> {
  int itemsCount = 0;
  bool reverse = false;
  @override
  void initState() {
    super.initState();
    getUserBooksLen(loggedInUser).then((value) => setState(() {
          itemsCount = value;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return loggedInUser != "NotLoggedIn"
        ? SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(11),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello, $loggedInUser!',
                      style: const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 35),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      'My books',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          color: Colors.black45),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('$itemsCount items found'),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                reverse = !reverse;
                              });
                            },
                            child: const Text('sort'))
                      ],
                    ),
                    FutureBuilder<
                        List<QueryDocumentSnapshot<Map<String, dynamic>>>>(
                      future: getUserBooks(loggedInUser),
                      builder: (context, snapshot) => snapshot.hasData
                          ? ListView.builder(
                              reverse: reverse,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: snapshot.data!.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return CustomBooksItem(
                                  index: index,
                                  bookName:
                                      snapshot.data![index].data()['bookName'],
                                  author:
                                      snapshot.data![index].data()['author'],
                                  genre: snapshot.data![index].data()['genre'],
                                  user: snapshot.data![index].data()['user'],
                                );
                              })
                          : const Center(
                              child: CircularProgressIndicator(),
                            ),
                    ),
                  ]),
            ),
          )
        : const CustomNotLoggedIn();
  }
}
