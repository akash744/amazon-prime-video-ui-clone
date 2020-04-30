import 'package:flutter/material.dart';
import '../image_list.dart';
import '../asset_lists.dart';
import '../constants.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MoviesScreen extends StatefulWidget {
  @override
  _MoviesScreenState createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: <Widget>[
        Column(
          children: <Widget>[
            CarouselSlider(
              options: CarouselOptions(
                height: 200.0,
                enableInfiniteScroll: true,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 5),
              ),
              items: moviesWatchNext.map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage('$i'),
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            ImageList(
              categoryTitle: 'Watch next movies',
              imageList: moviesWatchNext,
              height: 90,
              width: 150,
            ),
            ImageList(
              categoryTitle: 'Amazon Original movies',
              imageList: moviesAOM,
              height: 90,
              width: 150,
            ),
            ImageList(
              categoryTitle: 'Latest movies',
              imageList: homeLatestMoviesImageList,
              height: 90,
              width: 150,
            ),
            ImageList(
              categoryTitle: 'Top movies > ',
              imageList: moviesTop,
              height: 90,
              width: 150,
            ),
            ImageList(
              categoryTitle: 'Comedy movies > ',
              imageList: moviesComedy,
              height: 90,
              width: 150,
            ),
            ImageList(
              categoryTitle: 'Recently added movies > ',
              imageList: moviesRecent,
              height: 135,
              width: 310,
            ),
            kSpacings,
          ],
        ),
      ],
    );
  }
}
