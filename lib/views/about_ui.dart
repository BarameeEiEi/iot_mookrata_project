import 'package:flutter/material.dart';

class AboutUI extends StatefulWidget {
  const AboutUI({super.key});

  @override
  State<AboutUI> createState() => _AboutUIState();
}

class _AboutUIState extends State<AboutUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Image.asset(
              'assets/images/saulogo.png',
              width: 180,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Tech SAU BUFFET',
              style: TextStyle(
                color: Colors.deepOrange,
                fontSize: 25.0,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'แอปพลิเคชันร้านหมูกระทะ',
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 15.0,
              ),
            ),
            Text(
              'เพื่อคนไทย',
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 15.0,
              ),
            ),
            Text(
              'โดยเด็กไทย',
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 15.0,
              ),
            ),
            Text(
              'สนใจแอปพลิเคชันติดต่อ',
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 15.0,
              ),
            ),
            Text(
              'เด็กไอที SAU',
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 25.0,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Image.asset(
              'assets/images/sauqr.png',
              width: 100.0,
            ),
          ],
        ),
      ),
    );
  }
}
