import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:taskaty_app/core/routes/routes.dart';
import 'package:taskaty_app/features/add_task/presentation/cubit/add_task_cubit.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

// ignore: unused_field
class _AddTaskScreenState extends State<AddTaskScreen> {
  final titleController = TextEditingController();
  final describtionController = TextEditingController();
  final dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("add Task"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: BlocListener<AddTaskCubit, AddTaskState>(
          listener: (context, state) {
            if(state is AddTaskLoading){
              showDialog(context: context, builder: (context)=> const AlertDialog(
                backgroundColor: Colors.transparent,
                content: Center(child: CircularProgressIndicator()),
              ));
            }else if(state is AddTaskSuccess){
              Navigator.pushNamedAndRemoveUntil(context, Routes.homeScreen, (v)=>false);
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  hintText: "Title",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 14),
              TextField(
                controller: describtionController,
                decoration: const InputDecoration(
                  hintText: "Description",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 14),
              TextField(
                controller: dateController,
                readOnly: true,
                onTap: () {
                  showDatePicker(context: context,
                   firstDate: DateTime.now(),
                    lastDate: DateTime(2030)).then((value){
                    var date=DateFormat('yyyy-MM-dd').format(value??DateTime.now());
                    dateController.text=date;
                   });
                },
                decoration: const InputDecoration(
                  hintText: "Date",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
               onPressed: () {
  context.read<AddTaskCubit>().addTask(
    title: titleController.text,
    description: describtionController.text,
    date: dateController.text,
  );
},
                child: const Text("Add Task"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
