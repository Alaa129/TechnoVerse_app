import 'package:alaa/core/shared_widgets/custom_text.dart';
import 'package:alaa/features/home_screen/data/models/home_data_model.dart';
import 'package:flutter/material.dart';

class AnimatedCard extends StatefulWidget {
  const AnimatedCard({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  State<AnimatedCard> createState() => _MyListTileState();
}

class _MyListTileState extends State<AnimatedCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleSize() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
    if (_isExpanded) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }
  List<HomeDataModel> homeDataModelList = [
    HomeDataModel(
        title: "Title 1",
        description:
            "I downloaded and installed git 2.18 easily and then I proceeded o download the zip SDK of flutter. Once I did that, I extracted it to my documents folder and then I updated the path in the tab in the control panel"),
    HomeDataModel(
        title: "Title 2",
        description:
            "Description 2"),
    HomeDataModel(
        title: "Title 3",
        description:
            "Description 3"),
    HomeDataModel(
        title: "Title 4",
        description:
            "Description 4"),
    HomeDataModel(
        title: "Title 5",
        description:
            "Description 5"),
    HomeDataModel(
        title: "Title 6",
        description:
            "Description 6"),
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: _toggleSize,
      child: AnimatedCrossFade(
        firstChild: Container(
          height: height * 0.12,
          width: width,
          margin: EdgeInsets.fromLTRB(
              height * 0.02, height * 0.02, height * 0.02, 0),
          padding: EdgeInsets.all(height * 0.02),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(height * 0.02),
            color: Color.fromARGB(255, 88, 101, 224).withOpacity(0.2),
          ),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
             CustomText(
              txt: homeDataModelList[widget.index].title,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 23, 33, 114),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            CustomText(
                txt: homeDataModelList[widget.index].description,
                fontSize: 12,
                color: Colors.black.withOpacity(0.5),
                overflow: TextOverflow.ellipsis),
          ]),
        ),
        secondChild: Container(
          height: height * 0.15,
          width: width,
          margin: EdgeInsets.fromLTRB(
              height * 0.02, height * 0.02, height * 0.02, 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(height * 0.02),
            color: Color.fromARGB(255, 88, 101, 224).withOpacity(0.4),
          ),
          child: ListTile(
            title: CustomText(
              txt: homeDataModelList[widget.index].title,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 23, 33, 114),
            ),
            subtitle: homeDataModelList[widget.index].description.isNotEmpty
                ? CustomText(
                    txt: homeDataModelList[widget.index].description,
                    fontSize: 12,
                    color: Colors.black.withOpacity(0.5))
                : null,
            //minVerticalPadding: 25.0,
          ),
        ),
        crossFadeState:
            _isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
        duration: const Duration(milliseconds: 400),
      ),
    );
  }
}
