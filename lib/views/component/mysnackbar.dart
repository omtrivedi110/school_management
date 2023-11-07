import 'package:flutter/material.dart';

Widget Mysnackbar({required String text, required Color color}) {
  return SnackBar(
    content: Text(text),
    backgroundColor: color,
    padding: const EdgeInsets.all(5),
  );
}
