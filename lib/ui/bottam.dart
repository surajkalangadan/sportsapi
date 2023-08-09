import 'package:flutter/material.dart';
import 'package:sports/ui/manager.dart';
import 'package:sports/ui/screen1.dart';

class bottam extends StatefulWidget {
  const bottam({super.key});

  @override
  State<bottam> createState() => _bottamState();
}

List<Widget> screens = [screen1(),manager()];
int currentIndex = 0;

class _bottamState extends State<bottam> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(canvasColor: Color(0XFF222232)),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                label: "home"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.perm_contact_cal,
                  color: Colors.black,
                ),
                label: "manager"),
          ],
        ),
      ),
      body: screens[currentIndex],
    );
  }
}
