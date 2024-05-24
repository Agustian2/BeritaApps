import 'package:flutter/material.dart';
import 'package:beritapps/theme.dart';

class Trending extends StatelessWidget {
  final String imageURL;
  final String time;
  final String title;
  final String author;

  const Trending(
      {super.key,
      required this.imageURL,
      required this.time,
      required this.title,
      required this.author});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.all(5),
      // height: 300,
      width: 280,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: lightBgColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.10),
            blurRadius: 4,
            offset: Offset(3, 5), // Shadow position
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),

              // color: kWhiteColor,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                imageURL,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "$author",
                style: subTitle,
              ),
              Text(
                "$time",
                style: subTitle,
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  title,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
