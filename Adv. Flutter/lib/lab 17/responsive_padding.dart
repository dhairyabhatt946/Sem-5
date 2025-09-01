import 'package:flutter/material.dart';

class ResponsivePadding extends StatelessWidget {
  const ResponsivePadding({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Responsive Padding'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.05,
          vertical: screenHeight * 0.02,
        ),
        child: Container(
          color: Colors.blue,
          child: Text('Responsive Padding Example'),
        ),
      ),
    );
  }
}
