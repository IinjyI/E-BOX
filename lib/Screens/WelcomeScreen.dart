import 'package:ebooks/Screens/NavBottomBar.dart';
import 'package:ebooks/Screens/SigninScreen.dart';
import 'package:ebooks/Screens/SignupScreen.dart';
import 'package:flutter/material.dart';

import '../CustomWidgets/CustomButton.dart';

///First screen if user didn't sign in/up
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  static const String id = 'WelcomeScreen';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Welcome(),
      ),
    );
  }
}

class Welcome extends StatelessWidget {
  const Welcome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, NavBottomBar.id);
              },
              child: const Text(
                "Skip",
                style: TextStyle(color: Colors.blueGrey, fontSize: 25),
              ),
            ),
          ),
          const Text(
            "Ebooks",
            style: TextStyle(
                color: Color(0xFF12346a),
                fontSize: 40,
                fontWeight: FontWeight.bold),
          ),
          Text(
            "Connecting bookworms together",
            style: TextStyle(color: Colors.grey, fontSize: 20),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Image.asset('assets/1.jpg'),
          ),
          const SizedBox(
            height: 50,
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomButton(
                  text: "Sign In",
                  function: () {
                    Navigator.of(context).pushReplacementNamed(SigninScreen.id);
                  }),
              CustomButton(
                  text: "Sign Up",
                  function: () {
                    Navigator.of(context).pushReplacementNamed(SignupScreen.id);
                  })
            ],
          )
        ],
      ),
    );
  }
}
