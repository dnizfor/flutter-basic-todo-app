import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app/constant/color.dart';
import 'package:todo_app/constant/tasktype.dart';
import 'package:todo_app/model/task.dart';
import 'package:todo_app/screens/add_new_task.dart';
import 'package:todo_app/widgets/todo_item.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Task> todos = [
    Task(
        type: Tasktype.calendar,
        title: 'go school',
        description: 'description',
        isCompleted: false),
    Task(
        type: Tasktype.contest,
        title: 'cooke',
        description: 'description',
        isCompleted: false),
    Task(
        type: Tasktype.note,
        title: 'go to gym',
        description: 'description',
        isCompleted: false),
  ];
  bool isChecked = false;
  String today = DateTime.now().day.toString();

  void addNewTask(Task newTask) {
    setState(() {
      todos.add(newTask);
    });
  }

  void deleteTask(Task selectedTask) {
    setState(() {
      todos.remove(selectedTask);
    });
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double dewiceHeight = MediaQuery.of(context).size.height;
    return MaterialApp(
      home: SafeArea(
          child: Scaffold(
        backgroundColor: HexColor(backgroundColor),
        body: Column(
          children: [
            Container(
              width: deviceWidth,
              height: dewiceHeight / 5,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('lib/assets/images/header.png'),
                      fit: BoxFit.cover)),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: Text(
                      'My todo App',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 35.00,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: SingleChildScrollView(
                  child: ListView.builder(
                    primary: false,
                    shrinkWrap: true,
                    itemCount: todos.length,
                    itemBuilder: (BuildContext context, int index) {
                      return TodoItem(
                        task: todos[index],
                        deleteTask: (tsk) => deleteTask(tsk),
                      );
                    },
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) => AddTaskScreen(
                            addNewTask: (task) => addNewTask(task))),
                  );
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                child: Text(
                  'New Task',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
