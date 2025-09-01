import 'package:flutter/material.dart';

class DisplayWidthHeight extends StatelessWidget {
  const DisplayWidthHeight({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Screen Dimensions'),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Screen Width: ${screenWidth.toStringAsFixed(2)}'),
              Text('Screen Height: ${screenHeight.toStringAsFixed(2)}'),
            ]
        ),
      ),
    );
  }
}
