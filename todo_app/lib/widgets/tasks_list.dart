import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/task_data.dart';
import 'task_tile.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
            padding: EdgeInsets.all(20),
            itemBuilder: (context, index) {
              final task = taskData.tasks[index];
              return TaskTile(
                  isChecked: task.isDone,
                  taskTitle: task.name,
                  checkBoxCallBack: (isChecked) {
                    taskData.updateTask(task);
                  },
                  longPressCallBack: () {
                    taskData.deleteTask(task);
                  });
            },
            itemCount: taskData.taskCount);
      },
    );
  }
}
