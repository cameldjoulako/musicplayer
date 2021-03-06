import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'player-page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Music player',
      home: HomePage(),
    );
  }
}

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  //Titre de la Liste de lecture
  List playList = ['No tears left to cry', 'Imagine', 'Into you'];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              onPressed: null,
            ),
          ],
          backgroundColor: Colors.white.withOpacity(0),
        ),
        body: Center(
          child: Column(
            children: [
              Container(
                constraints: BoxConstraints.expand(
                  height: 500.0,
                ),
                padding: EdgeInsets.only(
                  left: 10.0,
                  bottom: 5.0,
                  right: 5.0,
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/ariana.jpeg'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
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
                          MaterialButton(
                            color: Colors.blue,
                            shape: CircleBorder(),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PlayerPage(),
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(25),
                              child: Icon(
                                Icons.play_arrow_rounded,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              playListSection,
              music(playList[0]),
              music(
                playList[1],
                playing: 1,
              ),
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
            //on desactive l'activation des label et leur espace occup??
            showSelectedLabels: false,

            //on desactive l'activation des label et leur espace occup??
            showUnselectedLabels:
                false, //on desactive l'activation des label et leur espace occup??
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
        )));
  }
}

//Playlist section
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
                fontSize: 13,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    ],
  ),
);

//Verifie et defini la couleur de la musique en lecture
Function isPlayingColor = (int $playing) {
  if ($playing == 1) {
    return Colors.blue;
  } else {
    return Colors.black;
  }
};

//music item
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
              children: [
                Text(
                  '3:16',
                  style: TextStyle(
                    color: isPlayingColor(playing),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Icon(
                  Icons.more_vert,
                  color: Colors.grey[500],
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
};
