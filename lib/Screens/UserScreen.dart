import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ebooks/CustomWidgets/CustomBooksItem.dart';
import 'package:ebooks/CustomWidgets/CustomInfoItem.dart';
import 'package:ebooks/Functions/DBandAuth/database.dart';
import 'package:flutter/material.dart';

class UserScreen extends StatefulWidget {
  static const String id = 'UserScreen';
  final String user;
  UserScreen({Key? key, required this.user}) : super(key: key);

  @override
  State<UserScreen> createState() => _UserScreenState(user);
}

class _UserScreenState extends State<UserScreen> {
  int itemsCount = 0;
  final String user;

  _UserScreenState(this.user);
  void initState() {
    super.initState();
    getUserBooksLen(user).then((value) => setState(() {
          itemsCount = value;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                future: getUserInformation(widget.user),
                builder: (c, snapshot) => snapshot.hasData
                    ? Column(children: [
                        CustomInfoItem(
                          icon: Icons.person,
                          label: snapshot.data!.data()!['username'],
                        ),
                        CustomInfoItem(
                          icon: Icons.email,
                          label: snapshot.data!.data()!['email'],
                        ),
                        CustomInfoItem(
                          icon: Icons.email,
                          label: snapshot.data!.data()!['phone'],
                        ),
                        Text('$itemsCount books found'),
                        FutureBuilder<
                            List<QueryDocumentSnapshot<Map<String, dynamic>>>>(
                          future: getUserBooks(widget.user),
                          builder: (context, snapshot) => snapshot.hasData
                              ? ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: snapshot.data!.length,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return CustomBooksItem(
                                      index: index,
                                      bookName: snapshot.data![index]
                                          .data()['bookName'],
                                      author: snapshot.data![index]
                                          .data()['author'],
                                      genre:
                                          snapshot.data![index].data()['genre'],
                                      user:
                                          snapshot.data![index].data()['user'],
                                    );
                                  })
                              : const Center(
                                  child: CircularProgressIndicator(),
                                ),
                        ),
                      ])
                    : const Center(child: CircularProgressIndicator()),
              )
            ],
          ),
        ),
      ),
    );
  }
}
