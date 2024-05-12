import 'package:alaa/constant/app_router.dart';
import 'package:alaa/constant/routes.dart';
import 'package:alaa/screens/home_screen/home_screen.dart';
import 'package:alaa/screens/todo_screens/ui/screens/todo_screen.dart';
import 'package:alaa/screens/videos_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BottomNav extends StatefulWidget {
  BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}


class _BottomNavState extends State<BottomNav> {
  int currentIndexScreen = 0;

  List<Widget> screens = [
    HomeScreen(),
    VideoScreen(),
    TodoScreen(),
  ];

  Widget bottomNavigationBar() {
    return Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(19.5), topLeft: Radius.circular(19.5)),
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 1),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(20),
            topLeft: Radius.circular(20),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.shifting,
            currentIndex: currentIndexScreen,
            selectedItemColor:Color.fromARGB(255, 88, 101, 224),
            unselectedItemColor: Color.fromARGB(255, 88, 101, 224).withOpacity(0.6),
            onTap: (index) {
              setState(() {
                currentIndexScreen = index;
              });
            },
            items: const [
              BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_call_rounded),
            label: 'Video',
          ),
          
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Todo',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.link),
            label: 'Links',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndexScreen],
      bottomNavigationBar: bottomNavigationBar(),
    );
  }
}
