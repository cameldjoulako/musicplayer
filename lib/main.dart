import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //Titre de la Liste de lecture
  List playList = ['No tears left to cry', 'Imagine', 'Into you'];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PlayMusic App',
      home: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            elevation: 0,
            leading: IconButton(
                icon: Icon(
                  Icons.chevron_left,
                  color: Colors.white,
                  size: 25,
                ),
                onPressed: null),
            title: Text(""),
            actions: [
              IconButton(
                  icon: Icon(
                    Icons.more_vert,
                    color: Colors.white,
                    size: 25,
                  ),
                  onPressed: null)
            ],
            backgroundColor: Colors.white.withOpacity(0),
          ),
          body: Center(
            child: Column(
              children: [
                playerImageSection,
                playListSection,
                music(playList[0]),
                music(playList[1], playing: 1),
                music(playList[2]),
              ],
            ),
          ),
          bottomNavigationBar: Container(
              child: ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0),
            ),
            child: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.pause,
                    color: Colors.white,
                    size: 40,
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Text(
                    "Imagine . Ariana Grande",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.arrow_circle_up,
                    color: Colors.white,
                    size: 35,
                  ),
                  label: '',
                ),
              ],
              //currentIndex: ,
              selectedItemColor: Colors.white,
              //onTap: ,
              backgroundColor: Colors.blue,
            ),
          ))),
    );
  }
}

Widget playerImageSection = Container(
    constraints: BoxConstraints.expand(
      height: 500.0,
    ),
    padding: EdgeInsets.only(left: 10.0, bottom: 5.0, right: 5.0),
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage('images/ariana.jpeg'),
        fit: BoxFit.cover,
      ),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(0),
        topRight: Radius.circular(0),
        bottomLeft: Radius.circular(50),
        bottomRight: Radius.circular(0),
      ), //BorderRadius.Only,
    ),
    child: Stack(
      children: [
        Positioned(
          left: 15.0,
          bottom: 20.0,
          child: Text(
            'Ariana Grande',
            style: GoogleFonts.arizonia(
              fontWeight: FontWeight.w800,
              fontSize: 43.0,
              color: Colors.white,
            ),
          ),
        ),
        Positioned(
          right: 10.0,
          bottom: 0.0,
          child: Column(
            children: [
              playButton,
            ],
          ),
        ),
      ],
    ));

Widget playButton = Container(
  margin: EdgeInsets.all(10),
  height: 70.0,
  child: SizedBox.fromSize(
    size: Size(70, 70), // button width and height
    child: ClipOval(
      child: Material(
        color: Color.fromRGBO(0, 160, 227, 1), // button color
        child: InkWell(
          splashColor: Color.fromRGBO(248, 177, 1, 1),
          // splash color
          onTap: () {},
          // button pressed
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.play_arrow_rounded,
                color: Colors.white,
                size: 30,
              ),
            ],
          ),
        ),
      ),
    ),
  ),
);

Widget playListSection = Container(
  margin: EdgeInsets.all(35),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        child: Column(
          children: [
            Text(
              'Popular',
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
      Container(
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            Text(
              'Show all',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    ],
  ),
);

/* liste de lecture */

var moreVert = Row(
  mainAxisSize: MainAxisSize.min,
  children: [
    Icon(Icons.more_vert, color: Colors.grey[500]),
  ],
);

//Verifie et defini la couleur de la musique en lecture
Function isPlayingColor = (int $playing) {
  if ($playing == 1) {
    return Colors.blue;
  } else {
    return Colors.black;
  }
};
Function music = (String $title, {playing = 0}) {
  return Container(
    margin: EdgeInsets.fromLTRB(30, 20, 30, 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          children: [
            Text(
              $title,
              style: TextStyle(
                color: isPlayingColor(playing),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '3:16',
                  style: TextStyle(
                    color: isPlayingColor(playing),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                moreVert,
              ],
            ),
          ],
        ),
      ],
    ),
  );
};