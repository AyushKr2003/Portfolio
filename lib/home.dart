import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  myAchive(num, type) {
    return Row(
      children: [
        Text(
          num,
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          child: Text(type),
        ),
      ],
    );
  }

  mySpec(icon, tech) {
    return Container(
      width: 105,
      height: 115,
      child: Card(
        margin: EdgeInsets.all(0),
        color: Color(0xff252525),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.white,
              ),
              SizedBox(height: 10),
              Text(
                tech,
                style: TextStyle(color: Colors.white, fontSize: 16),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: PopupMenuButton(
          icon: Icon(Icons.menu,color: Colors.white),
          color: Colors.black,
          itemBuilder: (context) => [
            PopupMenuItem(
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'projects');
                },
                child: Text(
                  'Projects',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              value: 1,
            ),
            PopupMenuItem(
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'about');
                },
                child: Text(
                  'About Me',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              value: 2,
            ),
          ],
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SlidingSheet(
        elevation: 8,
        cornerRadius: 50,
        snapSpec: const SnapSpec(
          // Enable snapping. This is true by default.
          snap: true,
          // Set custom snapping points.
          snappings: [0.38, 0.7, 1.0],
          // Define to what the snappings relate to. In this case,
          // the total available space that the sheet can expand to.
          positioning: SnapPositioning.relativeToAvailableSpace,
        ),
        // The body widget will be displayed under the SlidingSheet
        // and a parallax effect can be applied to it.
        body: Container(
          child: Stack(
            children: [
              Container(
                alignment: Alignment.topCenter,
                margin: EdgeInsets.only(top: 35),
                child: ShaderMask(
                    shaderCallback: (rect) {
                      return LinearGradient(
                              begin: Alignment.center,
                              end: Alignment.bottomCenter,
                              colors: [Colors.black, Colors.transparent])
                          .createShader(
                              Rect.fromLTRB(0, 0, rect.width, rect.height));
                    },
                    blendMode: BlendMode.dstIn,
                    child: Image.asset(
                      'assets/img1.png',
                      fit: BoxFit.contain,
                    )),
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.49),
                child: Column(
                  children: [
                    Text(
                      'Ayush Kumar Singh',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Software Developer',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        builder: (context, state) {
          // This is the content of the sheet that will get
          // scrolled, if the content is bigger than the available
          // height of the sheet.
          return Container(
            margin: EdgeInsets.fromLTRB(20, 30, 20, 0),
            height: 500,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    myAchive('78', ' Projects'),
                    myAchive('65', ' Clients'),
                    myAchive('92', ' Messages'),
                  ],
                ),
                SizedBox(height: 30),
                Text(
                  'Specialized In',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    mySpec(Icons.android, 'Android'),
                    mySpec(FontAwesomeIcons.docker, 'Docker'),
                    mySpec(FontAwesomeIcons.html5, 'HTML'),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    mySpec(FontAwesomeIcons.css3Alt, 'CSS'),
                    mySpec(Icons.android, 'Android'),
                    mySpec(Icons.android, 'Android'),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    mySpec(Icons.android, 'Android'),
                    mySpec(Icons.android, 'Android'),
                    mySpec(Icons.android, 'Android'),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
