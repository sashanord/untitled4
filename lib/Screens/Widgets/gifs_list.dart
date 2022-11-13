import 'package:flutter/material.dart';

class GifsList extends StatelessWidget {
  List<String> gifList = [];

  GifsList(this.gifList, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: ScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: gifList.length,
        itemBuilder: (BuildContext context, int index) {
          return Image.network(gifList[index]);
        });
  }
}
