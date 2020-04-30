import 'package:flutter/material.dart';
import 'constants.dart';

class ImageList extends StatefulWidget {
  ImageList(
      {@required this.imageList, this.categoryTitle, this.height, this.width});
  final String categoryTitle;
  final List imageList;
  final double height;
  final double width;

  @override
  _ImageListState createState() => _ImageListState();
}

class _ImageListState extends State<ImageList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          kSpacings,
          Text(
            widget.categoryTitle,
            style: kTextTitles,
          ),
          kSpacings,
          Container(
            height: widget.height,
            width: double.infinity,
            child: ListView.separated(
              shrinkWrap: true,
              itemCount: widget.imageList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  width: widget.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(widget.imageList[index]),
                    ),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(
                width: 10.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
