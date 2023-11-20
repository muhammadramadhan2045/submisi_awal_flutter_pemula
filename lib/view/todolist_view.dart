import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todolistapp/model/task_model.dart';
import 'package:todolistapp/view/detailtodo_view.dart';
import 'package:todolistapp/widget/introitem.dart';
import 'package:todolistapp/widget/myalertdialog.dart';
import 'package:todolistapp/widget/myappbar.dart';
import 'package:todolistapp/global.dart' as global;

class TodoListView extends StatefulWidget {
  const TodoListView({super.key});

  @override
  State<TodoListView> createState() => _TodoListViewState();
}

class _TodoListViewState extends State<TodoListView> {
  late List<Task> tasks;
  List<Task> sortedTasks = getSortedTaskList();
  var count = 0;
  @override
  void initState() {
    tasks = taskList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Todo List'),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(16),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              //exit app with dialog
              showDialog(
                context: context,
                builder: (context) {
                  return const MyAlertDialog();
                },
              );
            },
            icon: const Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const IntroItem(
            userName: global.name,
            introDesc: 'What\'s your plan today?',
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            child: const Text(
              'Priority Task',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            child: SizedBox(
              height: MediaQuery.of(context).size.height *
                  0.2, // Tinggi tetap kontainer
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Card(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 8,
                      ),
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(left: 16),
                                  child: Text(
                                    sortedTasks[index].priority,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: sortedTasks[index].priority ==
                                              'High'
                                          ? Colors.red
                                          : tasks[index].priority == 'Medium'
                                              ? Colors.orange
                                              : Colors.green,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(right: 16),
                                  child: Text(
                                    sortedTasks[index].category,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            ListTile(
                                title: Text(
                                  sortedTasks[index].title,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                subtitle: Text(
                                  DateFormat("E, dd MMM yyyy")
                                      .format(sortedTasks[index].date),
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                trailing: sortedTasks[index].isCompleted
                                    ? const Icon(
                                        Icons.check_circle,
                                        color: Colors.green,
                                      )
                                    : const Icon(
                                        Icons.cancel,
                                        color: Colors.grey,
                                      )),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                itemCount: sortedTasks.length,
                scrollDirection: Axis.horizontal,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Recent\'s Task',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '$count/${tasks.length} Tasks',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            flex: 1,
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return DetailTodoView(task: tasks[index]);
                        },
                      ),
                    );
                  },
                  child: Card(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 16),
                                child: Text(
                                  tasks[index].priority,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: tasks[index].priority == 'High'
                                        ? Colors.red
                                        : tasks[index].priority == 'Medium'
                                            ? Colors.orange
                                            : Colors.green,
                                  ),
                                ),
                              ),
                              const Text(
                                ' | ',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(right: 16),
                                child: Text(
                                  tasks[index].category,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          ListTile(
                            title: Text(
                              tasks[index].title,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            subtitle: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.calendar_today,
                                  size: 16,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  DateFormat("E, dd MMM yyyy")
                                      .format(tasks[index].date),
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            trailing: Checkbox(
                                value: tasks[index].isCompleted,
                                onChanged: (value) {
                                  setState(() {
                                    tasks[index].isCompleted = value!;
                                    if (tasks[index].isCompleted) {
                                      count++;
                                    } else {
                                      count--;
                                    }
                                    debugPrint(
                                        '${tasks[index].title} is completed: ${tasks[index].isCompleted}');
                                  });
                                }),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: tasks.length,
            ),
          ),
        ],
      ),
    );
  }
}
