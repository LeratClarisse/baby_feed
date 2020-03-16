import 'package:flutter/material.dart';

class CustomBottomMenu extends StatelessWidget {
  final int index;

  CustomBottomMenu(this.index);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            title: Text('Data Entry'),
            activeIcon: Icon(Icons.add_circle, color: Colors.blue)
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.timeline),
            title: Text('Tracking'),
            activeIcon: Icon(Icons.timeline, color: Colors.blue)
        ),
      ],
      currentIndex: index,
      onTap: (int indexTapped){
        if (indexTapped != index) {
          if (indexTapped == 0) {
            Navigator.pushReplacementNamed(context, '/entries');
          } else {
            Navigator.pushReplacementNamed(context, '/graphs');
          }
        }
      },
    );
  }
}