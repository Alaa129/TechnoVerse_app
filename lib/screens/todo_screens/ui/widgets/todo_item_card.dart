import 'package:alaa/widget/custom_text.dart';
import 'package:flutter/material.dart';

typedef changeValue = Function(bool? value, BuildContext context, int idTask);

class TodoItemCard extends StatefulWidget {
  const TodoItemCard(
      {super.key,
      required this.taskName,
      required this.color,
      required this.taskDate,
      required this.onchange,
      this.initValue = false, required this.idTask});
  final String taskName;
  final Color color;
  final String taskDate;
  final changeValue onchange;
  final bool initValue;
  final int idTask;

  @override
  State<TodoItemCard> createState() => _TodoItemCardState();
}

class _TodoItemCardState extends State<TodoItemCard> {
  bool isSelected = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isSelected = widget.initValue;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
        height: height * 0.1,
        width: width,
        margin:
            EdgeInsets.fromLTRB(height * 0.02, height * 0.02, height * 0.02, 0),
        padding: EdgeInsets.fromLTRB(height * 0.02, 0, height * 0.02, 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(height * 0.02),
          color: widget.color ??
              Color.fromARGB(255, 88, 101, 224).withOpacity(0.2),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  txt: widget.taskName,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 23, 33, 114),
                ),
                Checkbox(
                    value: (isSelected),
                    onChanged: (value) {
                      setState(() {
                        isSelected = value!;
                      });
                      widget.onchange(value, context, widget.idTask);
                    }),
              ],
            ),
            CustomText(txt: widget.taskDate, fontSize: 12)
          ],
        ));
  }
}
