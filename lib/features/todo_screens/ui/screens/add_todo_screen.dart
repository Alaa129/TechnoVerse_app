import 'package:alaa/core/routing/routes.dart';
import 'package:alaa/features/todo_screens/data/model/reminder_model.dart';
import 'package:alaa/features/todo_screens/logic/cubit/add_task_cubit.dart';
import 'package:alaa/core/shared_widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTodoScreen extends StatefulWidget {
  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  TextEditingController taskTitleController = TextEditingController();
  TextEditingController taskDateController = TextEditingController();

  TextEditingController taskStartTimeController = TextEditingController();
  TextEditingController taskEndTimeController = TextEditingController();
  int selectedREMINDER = 0;
  int selectedColor = 0;

  List<ReminderModel> reminderList = [
    ReminderModel(
      minutes: 10,
      reminder: '10 minutes before',
    ),
    ReminderModel(
      minutes: 30,
      reminder: '30 minutes before',
    ),
    ReminderModel(
      minutes: 60,
      reminder: '1 hour before',
    ),
  ];

  TimeOfDay endInitialTime = TimeOfDay.now();
  TimeOfDay startTime = TimeOfDay.now();

  @override
  void initState() {
    super.initState();
    context.read<AddTaskCubit>().getTasksData();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(height * 0.2),
            child: CustomAppBar(
              image: 'assets/images/note_icon.png',
              name: "Creat\n new task",
            )),
        body: BlocConsumer<AddTaskCubit, AddTaskState>(
          listener: (context, state) {
            if (state is AppDatabaseUserCreated) {
              Navigator.of(context).pop();
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Container(
                height: height,
                width: width,
                padding: EdgeInsets.all(height * 0.03),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Title',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      controller: taskTitleController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[200],
                        hintText: 'Enter Task Title',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.grey,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        hintStyle: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    const Text(
                      'Date',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      controller: taskDateController,
                      onTap: () {
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(2030),
                        ).then((value) {
                          taskDateController.text =
                              value.toString().split(' ').first;
                        });
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[200],
                        hintText: 'Task Date',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.grey,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        hintStyle: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Start Time',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              TextFormField(
                                controller: taskStartTimeController,
                                onTap: () {
                                  showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now(),
                                  ).then((value) {
                                    taskStartTimeController.text =
                                        value!.format(context);

                                    startTime = value;
                                    endInitialTime = value;

                                    setState(() {});
                                  });
                                },
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.grey[200],
                                  hintText: 'Start Time',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide.none,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide.none,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.grey,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  hintStyle: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 20.0,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'End Time',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              TextFormField(
                                controller: taskEndTimeController,
                                onTap: () {
                                  showTimePicker(
                                    context: context,
                                    initialTime: endInitialTime,
                                  ).then((value) {
                                    if (value!.hour > startTime.hour) {
                                      if (value.minute > startTime.minute) {
                                        taskEndTimeController.text =
                                            value.format(context);
                                      } else {
                                        debugPrint(
                                            'End time should be greater than start time');
                                      }
                                      taskEndTimeController.text =
                                          value.format(context);
                                    } else {
                                      debugPrint(
                                          'End time should be greater than start time');
                                    }
                                  });
                                },
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.grey[200],
                                  hintText: 'End Time',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide.none,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide.none,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.grey,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  hintStyle: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    const Text(
                      'Remind',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    DropdownButtonFormField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[200],
                        hintText: 'Task Date',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.grey,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        hintStyle: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      items: reminderList
                          .asMap()
                          .map(
                            (key, value) => MapEntry(
                              key,
                              DropdownMenuItem(
                                value: value.minutes,
                                child: Text(
                                  value.reminder,
                                ),
                              ),
                            ),
                          )
                          .values
                          .toList(),
                      onChanged: (value) {
                        debugPrint('$value');
                      },
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    const Text(
                      'Color',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        ...AddTaskCubit.get(context)
                            .taskColors
                            .asMap()
                            .map(
                              (key, value) => MapEntry(
                                key,
                                IconButton(
                                  onPressed: () {
                                    AddTaskCubit.get(context).changeColor(key);
                                    selectedColor == key;
                                  },
                                  icon: Container(
                                    width: 40.0,
                                    height: 40.0,
                                    decoration: BoxDecoration(
                                      // color: Colors.red,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: AddTaskCubit.get(context)
                                                    .selectedColorIndex ==
                                                key
                                            ? Colors.green
                                            : Colors.transparent,
                                        width: 3.0,
                                      ),
                                    ),
                                    padding: const EdgeInsets.all(2.0),
                                    child: Container(
                                      width: 40.0,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        color: value,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                            .values
                            .toList(),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        width: double.infinity,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(
                            12.0,
                          ),
                        ),
                        child: MaterialButton(
                          height: 54.0,
                          onPressed: () {
                            BlocProvider.of<AddTaskCubit>(context)
                                .insertTaskData(
                              title: taskTitleController.text,
                              date: taskDateController.text,
                              startTime: taskStartTimeController.text,
                              endTime: taskEndTimeController.text,
                              reminder: selectedREMINDER,
                              color: selectedColor,
                            );
                          },
                          child: const Text(
                            'Create Task',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
