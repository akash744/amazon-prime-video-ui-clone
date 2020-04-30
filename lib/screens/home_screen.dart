import 'package:flutter/material.dart';
import 'home_page.dart' as homepage;
import 'package:amazonprimevideoclone/screens/tv_shows_screen.dart'
    as tvshowspage;
import 'package:amazonprimevideoclone/screens/kids_screen.dart' as kidspage;
import 'package:amazonprimevideoclone/screens/movies_screen.dart' as moviespage;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Theme(
        data: ThemeData(
          primaryColor: Colors.grey[900],
          accentColor: Colors.white,
          scaffoldBackgroundColor: Colors.grey[900],
        ),
        child: Scaffold(
          appBar: AppBar(
            title: Center(
              child: Image(
                image: NetworkImage(
                  'https://logodownload.org/wp-content/uploads/2018/07/prime-video-1.png',
                  scale: 40,
                ),
              ),
            ),
            bottom: TabBar(
              tabs: <Widget>[
                Tab(text: 'Home'),
                Tab(text: 'TV Shows'),
                Tab(text: 'Movies'),
                Tab(text: 'Kids'),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              homepage.HomePage(),
              tvshowspage.TVPage(),
              moviespage.MoviesScreen(),
              kidspage.KidsScreen(),
            ],
          ), //ScreenSelector(page: 'HOME'),
          bottomNavigationBar: Theme(
            data: ThemeData(
              canvasColor: Colors.black,
            ),
            child: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  title: Text('Home'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  title: Text('Find'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.file_download),
                  title: Text('Download'),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  title: Text('My Stuff'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
