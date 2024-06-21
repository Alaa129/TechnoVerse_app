import 'package:flutter/material.dart';

class AboutScreens extends StatelessWidget {
  const AboutScreens({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 88, 101, 224),
        title: Text("About", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: <Widget>[
          Image.asset(
            'assets/images/2.png',
          ),
          SizedBox(height: height * 0.02),
          const Text(
            'About Our App',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
          ),
          SizedBox(height: height * 0.006),
          const Text(
            'Our app is a comprehensive educational tool designed for students of the Technology Department. It provides an overview of the department, educational videos about technology, and features for recording and noting down tasks and observations. This app aims to enhance the learning experience by offering accessible, valuable resources and a platform for students to track their academic progress efficiently.',
            style: TextStyle(fontSize: 14, height: 1.5),
          ),
          SizedBox(height: height * 0.02),
          const Text(
            'Under the supervision of',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
          ),
          SizedBox(height: height * 0.006),
          const Text(
            'Professor : Hassan Abdulaziz Elsabagh',
            style: TextStyle(
                fontSize: 14, height: 1.5, fontWeight: FontWeight.w400),
          ),
          SizedBox(height: height * 0.02),
          const Text(
            'Project Team',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
          ),
          SizedBox(height: height * 0.006),
          const Text(
            'Alaa Ahmed Shehab (Application programmer\nand designer and leader)',
            style: TextStyle(
                fontSize: 14, height: 1.5, fontWeight: FontWeight.w500),
          ),
          const Text(
            'Eman Ismail Abdelkarim (Application programmer)',
            style: TextStyle(
                fontSize: 14, height: 1.5, fontWeight: FontWeight.w400),
          ),
          const Text(
            'Esraa Hassan Mansour (vedios)',
            style: TextStyle(
                fontSize: 14, height: 1.5, fontWeight: FontWeight.w400),
          ),
          const Text(
            'Nada Zeinhom Mohammed (vedios)',
            style: TextStyle(
                fontSize: 14, height: 1.5, fontWeight: FontWeight.w400),
          ),
          const Text(
            'Hoda Mohamed Gad (vedios)',
            style: TextStyle(
                fontSize: 14, height: 1.5, fontWeight: FontWeight.w400),
          ),
          SizedBox(height: height * 0.04),
          Row(
            children: [
              Container(
                width: 125.0,
                height: 125.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: Color.fromARGB(255, 88, 101, 224), width: 1),
                ),
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/University_Logo.png',
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              SizedBox(width: width * 0.040),
              Container(
                width: 125.0,
                height: 125.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: Color.fromARGB(255, 88, 101, 224), width: 1),
                ),
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/TechnologyLogo.png',
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
