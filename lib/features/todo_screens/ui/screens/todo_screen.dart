import 'package:alaa/core/routing/app_router.dart';
import 'package:alaa/core/routing/routes.dart';
import 'package:alaa/features/todo_screens/ui/screens/add_todo_screen.dart';
import 'package:alaa/features/todo_screens/data/model/task_model.dart';
import 'package:alaa/features/todo_screens/logic/cubit/add_task_cubit.dart';
import 'package:alaa/features/todo_screens/ui/widgets/todo_item_card.dart';
import 'package:alaa/core/shared_widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoScreen extends StatefulWidget {
  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  List<TaskModel>? todoList;
  List<Color> taskColors = [
    Color.fromARGB(255, 249, 172, 167),
    Color.fromARGB(255, 136, 194, 241),
    Color.fromARGB(255, 232, 224, 156),
    Color.fromARGB(255, 246, 162, 36),
    Color.fromARGB(255, 218, 154, 230),
  ];

  void checkBoxChanged(bool? value, BuildContext context, int taskId) {
    if (value == true) {
      BlocProvider.of<AddTaskCubit>(context).deleteTask(taskId);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<AddTaskCubit>(context).getTasksData();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(height * 0.3),
          child: CustomAppBar(
            image: 'assets/images/todo_img.png',
            name: 'TODO ✅',
          )),
      body: BlocBuilder<AddTaskCubit, AddTaskState>(
        builder: (context, state) {
          if (state is AppDatabaseInitialized) {
            return Center(
              child: CircularProgressIndicator(
                color: Color.fromARGB(255, 88, 101, 224).withOpacity(0.2),
              ),
            );
          }
          if (state is GetDatabase) {
            todoList = state.taskModel;
            return ListView.builder(
              itemCount: todoList!.length,
              itemBuilder: (context, index) {
                // taskId = todoList![index].id;
                return todoList!.isEmpty
                    ? Container(
                        color: Colors.amber,
                        child: Center(child: Text('No Todo Yet')))
                    : TodoItemCard(
                        taskName: todoList![index].title,
                        color: taskColors[todoList![index].color],
                        taskDate: todoList![index].date,
                        idTask: todoList![index].id,
                        onchange: checkBoxChanged,
                      );
              },
            );
          } else {
            return Container(
              child: Center(
                child: CircularProgressIndicator(
                  color: Color.fromARGB(255, 88, 101, 224).withOpacity(0.2),
                ),
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Navigator.of(context).pushNamed(Routes.addTodoScreen);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
