part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeSuccess extends HomeState {

 final List<TaskModel> data;
   HomeSuccess(this.data);
}

final class HomeLoading extends HomeState {}
final class HomeError extends HomeState {}

final class TaskUbdateLoading extends HomeState {}
final class TaskUbdateError extends HomeState {}
final class TaskUbdateSuccess extends HomeState {}