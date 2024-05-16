import 'package:alaa/core/shared_widgets/custom_app_bar.dart';
import 'package:alaa/core/shared_widgets/custom_link_card.dart';
import 'package:flutter/material.dart';

class LinkScreens extends StatelessWidget {
  const LinkScreens({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Links",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(width: width * 0.02),
            const Icon(
              Icons.insert_link_sharp,
              color: Colors.white,
              size: 25,
            ),
          ],
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 88, 101, 224),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: const [
            LinkCard(
              title: 'كورس برنامج الليستراتور',
              description:
                  'قناة محـمـد خـيـال لتعليم اساسيات برنامج الليستراتور',
              imageUrl: "assets/images/ai-header.jpeg",
              linkUrl: "https://bit.ly/2N3SHtv",
            ),
            LinkCard(
              title: 'كورس تعلم الفوتوشوب للمبتدئين',
              description: 'قناة نور ديزاين لتعليم اساسيات برنامج الفوتوشوب',
              imageUrl: "assets/images/photoshop.jpg",
              linkUrl: "https://bit.ly/2zsp8uC",
            ),
            LinkCard(
              title: 'كورس فوتوشوب احترافي',
              description: 'قناة نور ديزاين لتعليم الفوتوشوب حتي الاحتراف',
              imageUrl: "assets/images/photoshop_advanced.png",
              linkUrl: "https://bit.ly/3oU7TXb",
            ),
            LinkCard(
              title: 'كورس افترافيكت',
              description: 'قناة مصطفي مرم لتعليم الافترافيكت',
              imageUrl: "assets/images/after_effect.jpeg",
              linkUrl: "https://bit.ly/3azA9Jq",
            ),
            LinkCard(
              title: 'كورس افترافيكت احترافي',
              description: 'قناة سوني ديزاين لتعليم الافترافيكت احترافي',
              imageUrl: "assets/images/after_effect_advanced.png",
              linkUrl: "https://bit.ly/36Pk6WR",
            ),
            LinkCard(
              title: 'موقع عربي لتعلم البرمجة و الأنظمة و الشبكات',
              description:
                  'موقع تعليمي مجاني يهتم بعلوم الكمبيوتر و يقدم إليك المعرفة بشكل مبسط و مفصل',
              imageUrl: "assets/images/har_01.png",
              linkUrl: "https://harmash.com/",
            ),
            LinkCard(
              title: 'مواقع ادراك لتقديم الكورسات المتنوعه',
              description:
                  'ادراك تعلم اساسيات البرمجه وما يتعلق ب علوم التنكولوجيا',
              imageUrl: "assets/images/edrak.jpg",
              linkUrl: "https://www.edraak.org/",
            ),
            LinkCard(
              title: 'مواقع يوديمي للكورسات',
              description:
                  'تهتم منصة يوديمي بالعديدِ من المحتويات بما في ذلك البرمجة، الترجمة، الرسم، الربح من النت أو الإبداع بصفة عامّة',
              imageUrl: "assets/images/udemy.png",
              linkUrl: "https://www.udemy.com/",
            ),
            LinkCard(
              title: 'أكاديمية الزيرو',
              description:
                  'أكاديمية الزيرو هي منصة تعليمية تقوم على تقديم العديد من مسارات تطوير الويب بشرح تفصيلي تفاعلي باللغة العربية',
              imageUrl: "assets/images/Elzero.jpg",
              linkUrl: "https://www.youtube.com/@ElzeroWebSchool",
            ),
            LinkCard(
              title: 'منصة يوداستي',
              description:
                  'منحة يوداستي المجانية بالكامل لجميع الجنسيات حول العالم للحصول على فرصة التدريب في واحدة من اهم المجالات حاليا',
              imageUrl: "assets/images/Udacity-Logo_Blue.png",
              linkUrl: "https://www.udacity.com/",
            ),
          ],
        ),
      ),
    );
  }
}
