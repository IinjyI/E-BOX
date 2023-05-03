import 'package:cloud_firestore/cloud_firestore.dart';

import 'database.dart';
import 'sharedPrefs.dart';

Future<void> mapAndStore(bookName, author, genre, user) async {
  if (loggedInUser != "NotLoggedIn") {
    Map<String, dynamic> bookInfo = {
      'timestamp': Timestamp.fromDate(DateTime.now()),
      'bookName': bookName,
      'author': author,
      'genre': genre,
      'user': user
    };
    int uLen = await getUserBooksLen(loggedInUser!);
    int bLen = await getBooksLen();
    await storeBook(loggedInUser!, bookInfo, '${uLen + 1}', '${bLen + 1}');
  }
}
