import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyProjects extends StatefulWidget {
  const MyProjects({Key? key}) : super(key: key);

  @override
  State<MyProjects> createState() => _MyProjectsState();
}

class _MyProjectsState extends State<MyProjects> {

  projectDetail(lang, title, desc, stars){

    return Container(
      height: 220,
      width: MediaQuery.of(context).size.width * 0.9,
      child: Card(
        color: Color(0xff262628),
        child: Container(
          margin: EdgeInsets.only(right: 15,left: 20,top: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                lang,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 15),
              Text(
                title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 2),
              Text(
                desc,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                ),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.star,size: 18,color: Colors.white70,),
                  SizedBox(width: 4),
                  Text(stars,style: TextStyle(color: Colors.white70),),
                  Expanded(child: Container()),
                  IconButton(onPressed: (){}, icon: Icon(FontAwesomeIcons.github,color: Colors.white70,))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color(0xff252525),
        title: Text('Projects'),
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              projectDetail('Flutter', 'Click To Code', 'An Online Compiler', '10'),
              projectDetail('Flutter', 'Click To Code', 'An Online Compiler', '10'),
              projectDetail('Flutter', 'Click To Code', 'An Online Compiler', '10'),
              projectDetail('Flutter', 'Click To Code', 'An Online Compiler', '10'),
              projectDetail('Flutter', 'Click To Code', 'An Online Compiler', '10'),
              projectDetail('Flutter', 'Click To Code', 'An Online Compiler', '10'),
              projectDetail('Flutter', 'Click To Code', 'An Online Compiler', '10'),
            ],
          ),
        ),
      ),
    );
  }
}
