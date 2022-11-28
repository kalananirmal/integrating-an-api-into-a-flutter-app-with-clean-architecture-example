import 'package:flutter/material.dart';

class DetailTextField extends StatelessWidget {
  final String label;
  final String value;

  const DetailTextField({
    Key? key,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          TextFormField(
            enabled: false,
            decoration: InputDecoration(
              disabledBorder: InputBorder.none,
              floatingLabelBehavior: FloatingLabelBehavior.always,
              hintText: value,
              hintStyle: const TextStyle(
                  color: Colors.teal,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
              labelText: label,
              labelStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
