

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskaty_app/features/task_details/presentation/cubit/task_details_cubit.dart';

class TaskDetailsScreen extends StatelessWidget {
  const TaskDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Task Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: BlocBuilder<TaskDetailsCubit, TaskDetailsState>(
          builder: (context, state) {
            if(state is TaskDetailsLoading){
             return const Center( child: CircularProgressIndicator(),);
            }else if(state is TaskDetailsSuccess){
            return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                   crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Title",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      state.taskModel?.title??"",
                      style:  const TextStyle(
                        fontSize: 15,
                        color: Colors.black54,
                      ),
                    ), 
                     const SizedBox(height: 16),
                    const Text(
                      "Description",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                     const SizedBox(height: 6),
                    Text(
                      state.taskModel?.description??"",
                      style:  const TextStyle(
                        fontSize: 15,
                        color: Colors.black54,
                      ),
                    ), 
                     const SizedBox(height: 16),
                    const Text(
                      "Date",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      state.taskModel?.deliveryDate?.toString()??"",
                      style:  const TextStyle(
                        fontSize: 15,
                        color: Colors.black54,
                      ),
                    ), 
                  ],
                );
            }else{
             return const AlertDialog(title: Text("Error"),);
            }
          }
        )
      ),
    );
  }
}
