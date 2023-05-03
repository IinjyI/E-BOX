import 'package:ebooks/Providers/NavBottomProvider.dart';
import 'package:ebooks/Screens/HomeScreen.dart';
import '../Screens/MyBooksScreen.dart';
import '../Screens/AddNewBookScreen.dart';
import 'package:ebooks/Screens/ProfileScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavBottomBar extends StatelessWidget {
  const NavBottomBar({Key? key}) : super(key: key);
  static const String id = 'NavBottomBar';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => NavBottomProvider(), child: NavBottom());
  }
}

class NavBottom extends StatelessWidget {
  NavBottom({
    super.key,
  });

  final _screens = [
    const MyBooksScreen(),
    const AddNewBookScreen(),
    const HomeScreen(),
    const ProfileScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _screens[Provider.of<NavBottomProvider>(context).selectedIndex],
      bottomNavigationBar: SizedBox(
        height: 80,
        child: Consumer<NavBottomProvider>(builder: (_, value, child) {
          return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.black26,
            selectedLabelStyle:
                const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            currentIndex: Provider.of<NavBottomProvider>(context).selectedIndex,
            onTap: (index) {
              Provider.of<NavBottomProvider>(context, listen: false)
                  .updateIndex(index);
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.book), label: 'My Books'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.add), label: 'Add new book'),
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Profile'),
            ],
          );
        }),
      ),
    );
  }
}
