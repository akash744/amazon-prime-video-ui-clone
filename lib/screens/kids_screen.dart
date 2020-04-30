import 'package:flutter/material.dart';
import '../image_list.dart';
import '../asset_lists.dart';
import '../constants.dart';
import 'package:carousel_slider/carousel_slider.dart';

class KidsScreen extends StatefulWidget {
  @override
  _KidsScreenState createState() => _KidsScreenState();
}

class _KidsScreenState extends State<KidsScreen> {
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
              items: homeKidsAndFamilyImageList.map((i) {
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
              categoryTitle: 'Kids and family movies >',
              imageList: homeKidsAndFamilyImageList,
              height: 90,
              width: 150,
            ),
            ImageList(
              categoryTitle: 'Kids and family TV >',
              imageList: homeKidsAndFamilyImageList,
              height: 90,
              width: 150,
            ),
            ImageList(
              categoryTitle: 'Amazon Original Kids series >',
              imageList: kidsAOK,
              height: 90,
              width: 150,
            ),
            kSpacings,
          ],
        ),
      ],
    );
  }
}
