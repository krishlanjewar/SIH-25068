import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:Center(
        child: Column(
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 15),
            Text("LOADING...."),
          ],
        ),
      ) ,
    );
  }
}