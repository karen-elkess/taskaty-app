part of 'task_details_cubit.dart';

@immutable
sealed class TaskDetailsState {}

final class TaskDetailsInitial extends TaskDetailsState {}

final class TaskDetailsSuccess extends TaskDetailsState {
  final TaskModel? taskModel;

  TaskDetailsSuccess(this.taskModel);}

final class TaskDetailsError extends TaskDetailsState {}
final class TaskDetailsLoading extends TaskDetailsState {}
