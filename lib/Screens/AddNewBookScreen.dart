import 'package:ebooks/CustomWidgets/CustomButton.dart';
import 'package:ebooks/CustomWidgets/CustomSnackBar.dart';
import 'package:ebooks/CustomWidgets/CustomTextField.dart';
import 'package:ebooks/Functions/DBandAuth/mapAndStore.dart';
import 'package:ebooks/Functions/DBandAuth/sharedPrefs.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class AddNewBookScreen extends StatelessWidget {
  const AddNewBookScreen({Key? key}) : super(key: key);
  static const String id = 'AddNewBookScreen';

  @override
  Widget build(BuildContext context) {
    return AddNewBook();
  }
}

class AddNewBook extends StatelessWidget {
  AddNewBook({Key? key}) : super(key: key);
  final TextEditingController _bookName = TextEditingController();
  final TextEditingController _author = TextEditingController();
  final TextEditingController _genre = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(11),
            alignment: Alignment.topCenter,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Add new book',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 30),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        icon: Icons.book,
                        labelText: 'Name',
                        controller: _bookName,
                        validator: RequiredValidator(errorText: 'required'),
                      ),
                      CustomTextField(
                          icon: Icons.person,
                          labelText: 'Author',
                          controller: _author,
                          validator: RequiredValidator(errorText: 'required')),
                      CustomTextField(
                          icon: Icons.question_mark_sharp,
                          labelText: 'Genre',
                          controller: _genre,
                          validator: RequiredValidator(errorText: 'required')),
                    ],
                  ),
                ),
                CustomButton(
                    text: 'Add book',
                    function: () {
                      mapAndStore(_bookName.text, _author.text, _genre.text,
                          loggedInUser);
                      buildSnackBar(context, 'book added successfully');
                    }),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
