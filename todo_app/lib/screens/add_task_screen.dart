import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    late String newTaskTitle;
    // ? We wrapped the whole container in SingleChildscrollview to make it sit on top of the bottom screen......with padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom) we are adding padding to the bottom of the container so that the whole context is visible above the keyboard

    return SingleChildScrollView(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      // * We add 2 containers bcz 1st container is of the same clr as the bgClr whn add screen is opened and we need to do this cz we cnt round the border of the 1st container but we can do it to 2nd container and we make the clr of the 2nd one pure white and decorate it acc to us
      child: Container(
        color: Color(0xff757575), // clr of the background aftr screen opens
        child: Container(
          padding: EdgeInsets.all(50),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          // * Everythng inside the add task pop up
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Add Task',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.lightBlueAccent,
                    fontSize: 30,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 8),
              TextField(
                  autofocus: true,
                  textAlign: TextAlign.center,
                  onChanged: (newText) {
                    newTaskTitle = newText;
                  }),
              SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  // here the listen: false is imp..without it kept on crashing
                  Provider.of<TaskData>(context, listen: false)
                      .addTask(newTaskTitle);
                  Navigator.pop(context);
                },
                child: Text(
                  'Add',
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
                style:
                    ElevatedButton.styleFrom(primary: Colors.lightBlueAccent),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
