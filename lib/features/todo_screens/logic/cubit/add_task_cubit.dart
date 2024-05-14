import 'package:alaa/core/helpers/database_helper.dart';
import 'package:alaa/features/todo_screens/data/model/task_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;

part 'add_task_state.dart';

class AddTaskCubit extends Cubit<AddTaskState> {
  AddTaskCubit() : super(AddTaskInitial());
  static AddTaskCubit get(context) => BlocProvider.of<AddTaskCubit>(context);

  final databaseHelper = DatabaseHelper.dbProvider;
  Database? database;

// Initialize the database
  void initDatabase() async {
    await databaseHelper.createDatabase();
    emit(AppDatabaseInitialized());
  }

  void insertTaskData({
    required String title,
    required String date,
    required String startTime,
    required String endTime,
    required int reminder,
    required int color,
  }) async {
    final db = await databaseHelper.database;
    await db!.transaction(
      (txn) async {
        int id = await txn.rawInsert(
          'INSERT INTO tasks (title, date, startTime, endTime, reminder, color)'
          ' VALUES ("$title", "$date", "$startTime", "$endTime", $reminder, $selectedColorIndex)',
        );
        debugPrint('Task Inserted');
      },
    ).then((value) {
      debugPrint('Task Data Inserted');

      // usernameController.clear();
      getTasksData();
      emit(AppDatabaseUserCreated());
    });
  }

  List<TaskModel> tasks = [];

  void getTasksData() async {
    final db = await databaseHelper.database;
    emit(AppDatabaseLoading());

    tasks = [];

    db!.rawQuery('SELECT * FROM tasks').then((value) {
      debugPrint('Tasks Data Fetched');
      debugPrint(value.toString());

      for (var element in value) {
        tasks.add(TaskModel.fromJson(element));
      }

      debugPrint(tasks.toString());
      emit(GetDatabase(taskModel: tasks));
    });
  }

  void deleteTask(int taskId) async {
    final db = await databaseHelper.database;
    await db!.delete('tasks', where: 'id = ?', whereArgs: [taskId]);
    debugPrint('Task deleted with ID: $taskId');

    // After deleting the task, update the UI to reflect the changes
    getTasksData();
    emit(DeleteTask());
  }

  List<Color> taskColors = [
    Color.fromARGB(255, 249, 172, 167),
    Color.fromARGB(255, 136, 194, 241),
    Color.fromARGB(255, 232, 224, 156),
    Color.fromARGB(255, 246, 162, 36),
    Color.fromARGB(255, 218, 154, 230),
  ];

  int selectedColorIndex = 0;

  void changeColor(index) {
    selectedColorIndex = index;
    emit(TaskColorChanged());
  }
}
