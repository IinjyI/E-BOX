import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebooks/Functions/DBandAuth/database.dart';
import 'package:flutter/material.dart';

import '../CustomWidgets/CustomBooksItem.dart';
import '../CustomWidgets/CustomNotLoggedIn.dart';
import '../Functions/DBandAuth/sharedPrefs.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String id = 'HomeScreen';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Home(),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int itemsCount = 0;
  bool reverse = false;
  @override
  void initState() {
    super.initState();
    getBooksLen().then((value) => setState(() {
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
                        'Books',
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
                        future: getBooks(),
                        builder: (context, snapshot) => snapshot.hasData
                            ? ListView.builder(
                                reverse: reverse,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: snapshot.data!.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return CustomBooksItem(
                                    index: index,
                                    bookName: snapshot.data![index]
                                        .data()['bookName'],
                                    author:
                                        snapshot.data![index].data()['author'],
                                    genre:
                                        snapshot.data![index].data()['genre'],
                                    user: snapshot.data![index].data()['user'],
                                  );
                                })
                            : const Center(
                                child: CircularProgressIndicator(),
                              ),
                      ),
                    ])),
          )
        : const CustomNotLoggedIn();
  }
}
