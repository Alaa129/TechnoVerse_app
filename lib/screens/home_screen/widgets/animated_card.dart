import 'package:alaa/widget/custom_text.dart';
import 'package:flutter/material.dart';

class AnimatedCard extends StatefulWidget {
  const AnimatedCard({Key? key}) : super(key: key);

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
            const CustomText(
              txt: "Unit 1",
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 23, 33, 114),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            CustomText(
                txt: "jdsofjodsfjosdijf",
                fontSize: 12,
                color: Colors.black.withOpacity(0.5)),
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
          child: const ListTile(
            title: CustomText(
              txt: "Unit 1",
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 23, 33, 114),
            ),
            subtitle: Text(
              "\n-Additional data with more details and information to show on expansion",
            ),
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
