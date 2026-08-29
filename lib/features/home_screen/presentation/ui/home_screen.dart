import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskaty_app/features/auth/data/model/task_model.dart';
import 'package:taskaty_app/features/home_screen/presentation/cubit/home_cubit.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    super.key,
  });

  final List<TaskModel> tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
        ),
        body: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {
            Navigator.pop(context);
          },
          builder: (context, state) {
            return BlocBuilder<HomeCubit, HomeState>(
              buildWhen: (previous, current) =>
                  current is HomeSuccess ||
                  current is HomeError ||
                  current is HomeLoading,
              builder: (context, state) {
                if (state is HomeLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is HomeSuccess) {
                  return ListView.separated(
                      itemBuilder: (context, index) {
                        return TaskItem(
                          taskModel: tasks[index],
                          cubit: context.read<HomeCubit>(),
                        );
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 10,
                          ),
                      itemCount: tasks.length);
                } else {
                  return const Text("Error");
                }
              },
            );
          },
        ));
  }
}

class TaskItem extends StatefulWidget {
  final TaskModel? taskModel;
  final cubit;
  const TaskItem({
    super.key,
    this.taskModel,
    this.cubit,
  });

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  var statusController = TextEditingController();

  @override
  void initState() {
    titleController.text = widget.taskModel?.title ?? "";
    descriptionController.text = widget.taskModel?.title ?? "";
    statusController.text = widget.taskModel?.title ?? "";
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    statusController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  widget.taskModel?.title ?? "",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  // color: _getPriorityColor(task.priority).withOpacity(0.15),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  widget.taskModel?.priority ?? "",
                  style: const TextStyle(
                    // color: _getPriorityColor(task.priority),
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
              ),
              BlocListener<HomeCubit, HomeState>(
                listener: (context, state) {
                  if (state is TaskUbdateLoading) {
                  } else if (state is TaskUbdateSuccess) {
                    //Navigator.pop(context);
                  }
                },
                child: IconButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                title: Text("Edit task"),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextFormField(
                                      decoration: InputDecoration(
                                          hintText:
                                              widget.taskModel?.title ?? ""),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    TextFormField(
                                        decoration: InputDecoration(
                                            hintText:
                                                widget.taskModel?.description ??
                                                    "")),
                                    TextFormField(
                                        decoration: InputDecoration(
                                            hintText:
                                                widget.taskModel?.status ?? ""))
                                  ],
                                ),
                              ));
                    },
                    icon: ElevatedButton(
                        onPressed: () {
                          widget.cubit.editTask(
                              taskId: widget.taskModel?.taskId ?? 0,
                              title: titleController.text,
                              description: descriptionController.text);
                        },
                        child: const Text("Confirm"))),
              )
            ],
          ),
          const SizedBox(height: 6),
          Text(
            widget.taskModel?.description ?? "",
            style: TextStyle(color: Colors.grey[700], fontSize: 13),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Icon(Icons.calendar_today, size: 14, color: Colors.grey[600]),
              const SizedBox(width: 4),
              Text(
                widget.taskModel?.deliveryDate ?? "".split(" ").first,
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              ),
              const Spacer(),
              Chip(
                label: Text(
                  widget.taskModel?.status ?? "",
                  style: const TextStyle(fontSize: 11),
                ),
                padding: EdgeInsets.zero,
                visualDensity: VisualDensity.compact,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
