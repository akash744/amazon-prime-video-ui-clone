import 'package:flutter/material.dart';
import '../image_list.dart';
import '../asset_lists.dart';
import '../constants.dart';
import 'package:carousel_slider/carousel_slider.dart';

class TVPage extends StatefulWidget {
  @override
  _TVPageState createState() => _TVPageState();
}

class _TVPageState extends State<TVPage> {
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
              items: homeAOSImageList.map((i) {
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
              categoryTitle: 'Watch next TV',
              imageList: tvWatchNext,
              height: 90,
              width: 150,
            ),
            ImageList(
              categoryTitle: 'Amazon Original Series ',
              imageList: homeAOSImageList,
              height: 90,
              width: 150,
            ),
            ImageList(
              categoryTitle: 'Latest TV',
              imageList: tvLatest,
              height: 90,
              width: 150,
            ),
            ImageList(
              categoryTitle: 'Top TV > ',
              imageList: tvLatest,
              height: 90,
              width: 150,
            ),
            ImageList(
              categoryTitle: 'Comedy TV > ',
              imageList: tvComedy,
              height: 90,
              width: 150,
            ),
            ImageList(
              categoryTitle: 'Recently added TV >',
              imageList: tvRecent,
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
