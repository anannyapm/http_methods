import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String title;
  final VoidCallback actionfunction;
  const AppButton(
      {super.key, required this.title, required this.actionfunction});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
            onPressed: actionfunction,
            child: Text(
              title,
              style: const TextStyle(fontSize: 18),
            )),
      ),
    );
  }
}
