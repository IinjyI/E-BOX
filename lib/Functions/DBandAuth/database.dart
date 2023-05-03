import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore _fireStore = FirebaseFirestore.instance;

/// store user
void upLoadProfile(Map<String, dynamic> userInfo, String username) {
  _fireStore.collection('users').doc(username).set(userInfo);
}

/// get user information  from firebase
Future<DocumentSnapshot<Map<String, dynamic>>> getUserInformation(
    String? username) {
  return _fireStore.collection('users').doc(username).get();
}

///get username for specific email
Future<String?> getUsername(email) async {
  return _fireStore
      .collection('users')
      .where('email', isEqualTo: email)
      .get()
      .then((value) {
    return value.docs[0].id;
  });
}

/// search by username
Future searchUserName(String userName) {
  return _fireStore
      .collection('users')
      .where('username', isEqualTo: userName)
      .get()
      .then((value) => value.docs.length);
}

/// search by email
Future searchEmail(String email) {
  return _fireStore
      .collection('users')
      .where('email', isEqualTo: email)
      .get()
      .then((value) => value.docs.length);
}

/// store book in firebase
Future storeBook(String username, Map<String, dynamic> info, String userIndx,
    booksIndx) async {
  _fireStore
      .collection('users')
      .doc(username)
      .collection('books')
      .doc(userIndx)
      .set(info);
  _fireStore.collection('books').doc(booksIndx).set(info);
}

/// get user books from firestore
Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getUserBooks(
    String? username) {
  return _fireStore
      .collection('users')
      .doc(username)
      .collection('books')
      .orderBy("timestamp", descending: true)
      .get()
      .then((value) => value.docs);
}

Future<int> getUserBooksLen(String? username) async {
  return await _fireStore
      .collection('users')
      .doc(username)
      .collection('books')
      .get()
      .then((value) => value.docs.length);
}

Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>> getBooks() {
  return _fireStore
      .collection('books')
      .orderBy("timestamp", descending: true)
      .get()
      .then((value) => value.docs);
}

Future<int> getBooksLen() {
  return _fireStore
      .collection('books')
      .orderBy("timestamp", descending: true)
      .get()
      .then((value) => value.docs.length);
}
