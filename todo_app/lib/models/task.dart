import 'package:flutter/material.dart';

class Task {
  final String name;
  bool isDone;

  Task(
      {required this.name,
      this.isDone = false}); // cz every new task will be undone at first

  // function to toggle the task to the opposite state it is in rn
  void toggleDone() {
    isDone = !isDone;
  }
}
