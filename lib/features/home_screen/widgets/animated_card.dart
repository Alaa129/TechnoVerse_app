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
        title: "ما هو قسم تكنولوجيا التعليم؟",
        description:
            "قسم أكاديمي متخصص يدمج بين التربية وعلم النفس والتكنولوجيا لتصميم وتنفيذ وتقييم عمليات التعلم والتعليم"),
    HomeDataModel(title: ":رسالة القسم", description: "يسعى القسم إلى التميز والجودة في أدائه الأكاديمي والبحثي والمجتمعي، لإعداد جيل من المصممين التعليميين ومصممي الرسومات ومطوري المحتوى الرقمي والمقررات الالكترونية من ذوي الكفاءة القادرين على توظيف تكنولوجيا التعليم والتعلم الالكتروني في مجال التعليم والتعلم والتدريب، ليواكب متطلبات سوق العمل في ضوء رؤية مصر 2030"),
    HomeDataModel(title: ":رؤية القسم", description: "تحقيق التميز محليا وإقليميا وعالمياً في تطوير التعلم الالكتروني"),
    HomeDataModel(title: ":نبذه عن القسم", description: "يهدف تخصص تكنولوجيا التعليم والتعلم من خلال البرامج الأكاديمية التي يقدمها إلى رقمنة العملية التعليمية وتطوير المحتوى الالكتروني لتعزيز مخرجات التعلم من خلال دمج التكنولوجيا في بيئات التعلم لخلق بيئات تعلم افتراضية تفاعلية توافق العصر ومتطلباته. بالإضافة إلى ذلك يضم التخصص مقررات تكنولوجيا التعليم والتعلم الالكتروني التي تتضمن مواد تطبيقية ونظرية تمكن الطالب من اكتساب مهارات التصميم التعليمي وتطوير وانتاج المحتوى الرقمي - المعزز بالجرافيك والرسوم المتحركة ومحفزات الألعاب الرقمية – وفقاً لمعايير الجودة العالمية في التعلم الالكتروني والتعليم عن بُعد"),
    HomeDataModel(title: ":مجالات عمل خريج قسم تكنولوجيا التعليم", description: "( E- Courses Quality Specialist)أخصائي جودة المقررات الالكترونية\n(E-Courses Developer)مطور مقررات الكترونية \n(E-content Developer)مطور محتوى الكتروني E-content Developer\n(Multi-media Designer)مصمم وسائط تعليمية \n(Animation Designer)مصمم رسوم متحركة \n(Graphic Designer)مصمم جرافيك\n(Instructional Designer)مصمم تعليمي "),
    HomeDataModel(title: ":اهداف القسم", description: "الانفتاح على المؤسسات والهيئات الرسمية والأهلية من خلال التعاون معها لخدمة المجتمع محليا وإقليميا\nاكساب الخريج القدرة على المنافسة في مجالات سوق العمل مع أقرانه من خريجي الكليات المحلية والدولية المناظرة ليفي باحتياجات المؤسسات التعليمية والمشروعات الصغيرة وبصفة خاصة في مجال تطوير البرمجيات التعليمية\nإعداد أجيال متخصصة من أخصائي تكنولوجيا التعليم والمصممين التعليميين ومصممي الجرافيك والوسائط التعليمية ومطوري المحتوى الرقمي والبرمجيات التعليمية ومراجعي الجودة ذوي الكفاءة  العلمية والعملية في أداء مهامهم وبصورة تتسم بالتميز والفاعلية\nالمشاركة في تطوير المعرفة والمهارات المتعلقة بعمليات ومصادر التعلم من خلال البحث العلمي بمجال تكنولوجيا التعليم والتعلم الالكتروني\nتطوير عمليتي التعليم والتعلم من خلال التوظيف الأمثل لتكنولوجيا التعلم الالكتروني"),
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
          child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            CustomText(
              txt: homeDataModelList[widget.index].title,
              textAlign: TextAlign.right,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 23, 33, 114),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            CustomText(
                txt: homeDataModelList[widget.index].description,
                textAlign: TextAlign.right,
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
              textAlign: TextAlign.right,
              txt: homeDataModelList[widget.index].title,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 23, 33, 114),
            ),
            subtitle: homeDataModelList[widget.index].description.isNotEmpty
                ? CustomText(
                    textAlign: TextAlign.right,
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
