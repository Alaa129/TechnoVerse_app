part of 'add_task_cubit.dart';

@immutable
sealed class AddTaskState {}

final class AddTaskInitial extends AddTaskState {}

class AppInitialState extends AddTaskState {}

class AppDatabaseInitialized extends AddTaskState {}

class AppDatabaseTableCreated extends AddTaskState {}

class AppDatabaseOpened extends AddTaskState {}

class AppDatabaseUserCreated extends AddTaskState {}

class AppDatabaseLoading extends AddTaskState {}

class GetDatabase extends AddTaskState {
  final List <TaskModel> taskModel;

  GetDatabase({required this.taskModel});
}

class DeleteTask extends AddTaskState {}

class TaskColorChanged extends AddTaskState {}
