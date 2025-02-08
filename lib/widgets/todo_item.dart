import 'package:flutter/material.dart';
import 'package:todo_app/constant/tasktype.dart';
import 'package:todo_app/model/task.dart';

class TodoItem extends StatefulWidget {
  const TodoItem({super.key, required this.task, required this.deleteTask});
  final Task task;
  final void Function(Task selectedtask) deleteTask;

  @override
  State<TodoItem> createState() => _TodoItemState();
}

class _TodoItemState extends State<TodoItem> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: widget.task.isCompleted ? Colors.grey : Colors.white,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            widget.task.type == Tasktype.note
                ? Image.asset('lib/assets/images/category_1.png')
                : widget.task.type == Tasktype.contest
                    ? Image.asset('lib/assets/images/category_3.png')
                    : Image.asset('lib/assets/images/category_2.png'),
            Expanded(
              child: Text(
                widget.task.title,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 21,
                    decoration: widget.task.isCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
                textAlign: TextAlign.center,
              ),
            ),
            !widget.task.isCompleted
                ? Checkbox(
                    value: isChecked,
                    onChanged: (val) => {
                          setState(
                            () {
                              isChecked = val!;
                              widget.task.isCompleted =
                                  !widget.task.isCompleted;
                            },
                          )
                        })
                : IconButton(
                    onPressed: () {
                      widget.deleteTask(widget.task);
                    },
                    icon: Icon(
                      Icons.delete,
                      size: 35,
                      color: Colors.white,
                    )),
          ],
        ),
      ),
    );
  }
}
