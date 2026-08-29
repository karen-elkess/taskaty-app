

class TaskModel {
  final int taskId;
  final String title;
  final String description;
  final String status;
  final String deliveryDate;
  final String priority;
  final String createdAt;

  TaskModel({
    required this.taskId,
    required this.title,
    required this.description,
    required this.status,
    required this.deliveryDate,
    required this.priority,
    required this.createdAt,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      taskId: json['taskId'],
      title: json['title'],
      description: json['description'],
      status: json['status'],
      deliveryDate: json['deliveryDate'],
      priority: json['priority'],
      createdAt: json['createdAt'],
    );
  }
} 
class TaskListResponseModel {
  final List<TaskModel> data;
  final MetaModel meta;
  final String? error;

  TaskListResponseModel({
    required this.data,
    required this.meta,
    this.error,
  });

  factory TaskListResponseModel.fromJson(Map<String, dynamic> json) {
    return TaskListResponseModel(
      data: (json['data'] as List<dynamic>)
          .map((e) => TaskModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: MetaModel.fromJson(json['meta'] as Map<String, dynamic>),
      error: json['error'] as String?,
    );
  }
} 


class MetaModel{
  final int? total;
  final int? page;

  MetaModel({this.total, this.page});

  factory MetaModel.fromJson(Map<String, dynamic> json) {
    return MetaModel(
      total: json['total'] as int?,
      page: json['page'] as int?,
    );
  }
}