import 'package:flutter/material.dart';

class MoneyField extends StatelessWidget {
  final TextEditingController controller;
  const MoneyField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          hintText: 'Money...',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }
}
