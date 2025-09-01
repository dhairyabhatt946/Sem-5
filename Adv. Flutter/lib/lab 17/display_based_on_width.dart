import 'package:flutter/material.dart';

class DisplayBasedOnWidth extends StatelessWidget {
  const DisplayBasedOnWidth({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double screenWidth = screenSize.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Display Based on Dimensions',
          style: TextStyle(
            color: screenWidth > 700 ? Colors.red : Colors.blue
          ),
        ),
      ),
      body: Center(
        child: Text(
          screenWidth > 700 ? 'This is web screen' : 'This is mobile screen'
        ),
      ),
      backgroundColor: screenWidth > 700 ? Colors.red : Colors.blue,
    );
  }
}
