import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:todo_app/constant/color.dart';
import 'package:todo_app/constant/tasktype.dart';
import 'package:todo_app/model/task.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key, required this.addNewTask});
  final void Function(Task newTask) addNewTask;
  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  Tasktype tasktype = Tasktype.calendar;
  @override
  Widget build(BuildContext context) {
    double dewiceHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor(backgroundColor),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(color: HexColor('#4A3780')),
                height: dewiceHeight / 10,
                child: Row(
                  children: <Widget>[
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 30,
                        )),
                    Expanded(
                        child: Text(
                      'Add New Task',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20),
                    ))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Text Title',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter a search term',
                      ),
                      controller: titleController,
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.symmetric(vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Category:',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          GestureDetector(
                            onTap: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  duration: Duration(milliseconds: 300),
                                  content: Text("Category 1 selected"),
                                ),
                              );
                              setState(() {
                                tasktype = Tasktype.note;
                              });
                            },
                            child:
                                Image.asset("lib/assets/images/category_1.png"),
                          ),
                          GestureDetector(
                            onTap: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  duration: Duration(milliseconds: 300),
                                  content: Text("Category 2  selected"),
                                ),
                              );
                              setState(() {
                                tasktype = Tasktype.calendar;
                              });
                            },
                            child:
                                Image.asset("lib/assets/images/category_2.png"),
                          ),
                          GestureDetector(
                            onTap: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  duration: Duration(milliseconds: 300),
                                  content: Text("Category 3 selected"),
                                ),
                              );
                              setState(() {
                                tasktype = Tasktype.contest;
                              });
                            },
                            child:
                                Image.asset("lib/assets/images/category_3.png"),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                      child: Column(
                    children: [
                      Text('Date'),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          decoration: InputDecoration(
                              filled: true, fillColor: Colors.white),
                          controller: dateController,
                        ),
                      )
                    ],
                  )),
                  Expanded(
                      child: Column(
                    children: [
                      Text('Time'),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: TextField(
                          decoration: InputDecoration(
                              filled: true, fillColor: Colors.white),
                          controller: timeController,
                        ),
                      )
                    ],
                  )),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text('Note'),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: SizedBox(
                  height: 300,
                  child: TextField(
                    controller: noteController,
                    expands: true,
                    maxLines: null,
                    decoration: const InputDecoration(
                        filled: true, fillColor: Colors.white, isDense: true),
                  ),
                ),
              ),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    Task newTask = Task(
                        type: tasktype,
                        title: titleController.text,
                        description: noteController.text,
                        isCompleted: false);
                    widget.addNewTask(newTask);
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: Text(
                    'Save',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
