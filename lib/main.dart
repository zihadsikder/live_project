import 'package:flutter/material.dart';
import 'package:flutter_project_course/home_page.dart';

void main() =>
  runApp(const ToDo());
class ToDo extends StatelessWidget {
  const ToDo({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'flutter app',
      home: HomePage(),
    );
  }
}

