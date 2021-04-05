import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Page de lecture
class LecturePage extends StatelessWidget {
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
              size: 30,
            ),
            onPressed: null),
        title: Text(""),
        actions: [
          IconButton(
              icon: Icon(
                Icons.more_vert,
                color: Colors.white,
                size: 23,
              ),
              onPressed: null)
        ],
        backgroundColor: Colors.white.withOpacity(0),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [imageAuthor, playerControl],
        ),
      ),
    );
  }
}

Widget playerControl = Container(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      playingMusicTitle,
      musicSliderSection,
      durationSection,
      musicControlButtonSection
    ],
  ),
);

Widget imageAuthor = Container(
  constraints: BoxConstraints.expand(
    height: 500.0,
  ),
  padding: EdgeInsets.only(left: 10.0, bottom: 5.0, right: 5.0),
  decoration: BoxDecoration(
    image: DecorationImage(
      image: AssetImage('images/ariana.jpeg'),
      fit: BoxFit.cover,
      colorFilter:
          ColorFilter.mode(Colors.blue.withOpacity(1), BlendMode.darken),
    ),
  ),
  child: Stack(children: [
    Positioned(
      top: 60.0,
      left: 130,
      child: titleSection,
    ),
    Positioned(
      top: 120,
      left: 0.0,
      child: Center(
        child: Row(
          children: [
            Column(
              children: [artistPictureSection],
            ),
          ],
        ),
      ),
    ),
    //artistPictureSection
  ]),
);

Widget artistPictureSection = Container(
  height: 300,
  padding: EdgeInsets.all(0),
  margin: EdgeInsets.all(1),
  decoration: BoxDecoration(
      color: Colors.black,
      image: DecorationImage(
        image: AssetImage('images/ariana.jpeg'),
        fit: BoxFit.cover,
      ),
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(40),
      )),
  child: Container(),
);

Widget playingMusicTitle = Container(
  margin: EdgeInsets.only(top: 20),
  padding: EdgeInsets.all(20),
  child: Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            'Imagine',
            style: GoogleFonts.lato(
              fontWeight: FontWeight.w700,
              fontSize: 25.0,
              color: Colors.black,
            ),
          ),
          SizedBox(width: 3),
          Text(
            'Ariana Grande',
            style: GoogleFonts.lato(
              fontWeight: FontWeight.w400,
              fontSize: 14.0,
              color: Colors.blue,
            ),
          ),
        ],
      )
    ],
  ),
);

// title on top after Appbar
Widget titleSection = Container(
  padding: EdgeInsets.all(20),
  child: Row(
    children: [
      Column(
        children: [
          Text(
            'Artist',
            style: GoogleFonts.lato(
              fontWeight: FontWeight.w300,
              fontSize: 14.0,
              color: Colors.white,
            ),
          ),
          Text(
            'Ariana Grande',
            style: GoogleFonts.lato(
              fontWeight: FontWeight.w800,
              fontSize: 17.0,
              color: Colors.white,
            ),
          ),
        ],
      )
    ],
  ),
);

Widget musicControlButtonSection = Container(
  margin: EdgeInsets.only(top: 10),
  padding: EdgeInsets.all(5),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      IconButton(
          icon: Icon(
            Icons.shuffle,
            color: Colors.grey,
            size: 35,
          ),
          onPressed: null),
      IconButton(
          icon: Icon(
            Icons.skip_previous,
            color: Colors.black,
            size: 40,
          ),
          onPressed: null),
      ElevatedButton(
        onPressed: () {},
        child: Container(
          padding: EdgeInsets.all(10),
          child: Icon(
            Icons.pause,
            color: Colors.black,
            size: 40.0,
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          shape: CircleBorder(),
          side: BorderSide(
            width: 1.0,
            color: Colors.grey,
          ),
        ),
      ),
      IconButton(
          icon: Icon(
            Icons.skip_next,
            color: Colors.black,
            size: 40,
          ),
          onPressed: null),
      IconButton(
          icon: Icon(
            Icons.repeat,
            color: Colors.grey,
            size: 35,
          ),
          onPressed: null),
    ],
  ),
);

Widget musicSliderSection = Container(
  //margin: EdgeInsets.only(top: 10),
  padding: EdgeInsets.all(5),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Expanded(
        child: Slider(
          value: 19,
          min: 1.0,
          max: 100,
          divisions: 10,
          activeColor: Colors.blue,
          inactiveColor: Colors.grey,
          onChanged: (double newValue) {},
        ),
      ),
    ],
  ),
);

Widget durationSection = Container(
    padding: EdgeInsets.all(5),
    margin: EdgeInsets.only(left: 20, right: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '1.08',
          style: GoogleFonts.lato(
            fontWeight: FontWeight.w400,
            fontSize: 14.0,
            color: Colors.grey,
          ),
        ),
        Text(
          '3.14',
          style: GoogleFonts.lato(
            fontWeight: FontWeight.w400,
            fontSize: 14.0,
            color: Colors.grey,
          ),
        ),
      ],
    ));
