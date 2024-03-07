import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(20),
          child: const Text("CAMERA IS NOT AVAILABLE"),
        );
  }
}
