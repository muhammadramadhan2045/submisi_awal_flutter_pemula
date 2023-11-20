import 'package:flutter/material.dart';
import 'package:todolistapp/model/task_model.dart';
import 'package:todolistapp/widget/detailitempriority.dart';
import 'package:todolistapp/widget/detailitemstatus.dart';
import 'package:todolistapp/widget/detailitemtime.dart';
import 'package:todolistapp/widget/myappbar.dart';
import 'package:intl/intl.dart';

class DetailTodoView extends StatelessWidget {
  final Task task;
  const DetailTodoView({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          "Detail Task",
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(16),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: TextEditingController(text: task.title),
              enabled: false,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            DetailItemTime(
              date: DateFormat("E, dd MMM yyyy").format(task.date),
              icon: Icons.calendar_month,
            ),
            const SizedBox(height: 10),
            DetailItemTime(
              date: DateFormat("HH:mm").format(task.date),
              icon: Icons.access_time,
            ),
            const SizedBox(height: 10),
            DetailItemPriority(
              initDesc: "Priority Level",
              initIcon: Icons.circle,
              iconColor: task.priority == 'Low'
                  ? Colors.green
                  : task.priority == 'Medium'
                      ? Colors.yellow
                      : Colors.red,
              initText: task.priority,
            ),
            const SizedBox(height: 10),
            DetailItemStatus(
              initDesc: "Category",
              initText: task.category,
              initBoxColor: Theme.of(context).primaryColorLight,
            ),
            const SizedBox(height: 10),
            DetailItemStatus(
              initDesc: "Status",
              initText: task.isCompleted.toString(),
              initBoxColor: task.isCompleted
                  ? Colors.green
                  : Theme.of(context).colorScheme.inversePrimary,
            ),
            const SizedBox(height: 10),
            DetailItemStatus(
              initDesc: "Description",
              initText: task.description,
              initBoxColor: Theme.of(context).primaryColorLight,
            ),
          ],
        ),
      ),
    );
  }
}
