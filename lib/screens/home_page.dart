import 'package:flutter/material.dart';
import 'package:amazonprimevideoclone/image_list.dart';
import 'package:amazonprimevideoclone/asset_lists.dart';
import 'package:amazonprimevideoclone/constants.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:video_player/video_player.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
              items: [
                'https://images-na.ssl-images-amazon.com/images/I/A1ISB4F5kRL._RI_.jpg',
                'https://images-na.ssl-images-amazon.com/images/I/91nmxQfdcPL._RI_.jpg',
                'https://images-eu.ssl-images-amazon.com/images/S/sgp-catalog-images/region_GB/wb-2077491_6000120912-Full-Image_GalleryCover-en-GB-1579843872386._UY500_UX667_RI_V3fqOHmlHoCVEZ1xr06dkMExJMJAaVSF_TTW_.jpg',
                'https://images-na.ssl-images-amazon.com/images/G/01/adlp/builder/d-hunters-hero-e-fd40abd7-971b-46d6-bf5c-6cbb2d70f23f._CB425998244_.jpg',
              ].map((i) {
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
              categoryTitle: 'Watch next TV and movies',
              imageList: homeWatchNextMoviesAndTVImageList,
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
              categoryTitle: 'Amazon Original Series',
              imageList: homeAOSImageList,
              height: 90,
              width: 150,
            ),
            ImageList(
              categoryTitle: 'Kids and family movies >',
              imageList: homeKidsAndFamilyImageList,
              height: 90,
              width: 150,
            ),
            kSpacings,
            FeaturedPreviews(),
            ImageList(
              categoryTitle: 'Thriller movies > ',
              imageList: homeThrillerMovies,
              height: 90,
              width: 150,
            ),
            ImageList(
              categoryTitle: 'Coming soon',
              imageList: homeComingSoon,
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

class FeaturedPreviews extends StatefulWidget {
  @override
  _FeaturedPreviewsState createState() => _FeaturedPreviewsState();
}

class _FeaturedPreviewsState extends State<FeaturedPreviews> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 315,
      width: double.infinity,
      color: Colors.blueGrey[800],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          kSpacings,
          Row(
            children: <Widget>[
              SizedBox(width: 15),
              Text(
                'Featured previews',
                style: kTextTitles,
              ),
            ],
          ),
          kSpacings,
          CarouselSlider(
            options: CarouselOptions(
              height: 200.0,
              enableInfiniteScroll: true,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
            ),
            items: [
              'assets/previews/mifallout.mp4',
              'assets/previews/joker.mp4',
              'assets/previews/theoffice.mp4',
              'assets/previews/jack_ryan.mp4',
            ].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: double.infinity,
                    child: VideoApp(videoPath: '$i'),
                  );
                },
              );
            }).toList(),
          ),

          /*
          Container(
            height: 200,
            child: VideoApp(),
          ),
           */

          kSpacings,
          Row(
            children: <Widget>[
              SizedBox(width: 15),
              Text(
                'Previewed Title',
                style: kTextTitles,
                textAlign: TextAlign.left,
              ),
              SizedBox(width: 150),
              Icon(
                Icons.play_arrow,
                color: Colors.white,
                size: 40,
              ),
              SizedBox(width: 10),
              Icon(
                Icons.add,
                color: Colors.white,
                size: 40,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class VideoApp extends StatefulWidget {
  VideoApp({@required this.videoPath});

  final String videoPath;

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoPath)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
        _controller.play();
      });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _controller.value.initialized
          ? AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            )
          : Container(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
