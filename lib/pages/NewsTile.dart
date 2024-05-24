import 'package:flutter/material.dart';
import 'package:beritapps/screen/NewsDetail.dart';
import 'package:beritapps/theme.dart';

class NewsTile extends StatelessWidget {
  final String imageURL;
  final String title;
  final String time;
  final String author;
  const NewsTile(
      {super.key,
      required this.imageURL,
      required this.title,
      required this.time,
      required this.author});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: lightBgColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.10),
            blurRadius: 4,
            offset: Offset(3, 6), // Shadow position
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: lightDivColor,
              borderRadius: BorderRadius.circular(20),
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
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "$author",
                      style: subTitle,
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => NewsDetail()));
                  },
                  child: Text(
                    "$title",
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "$time",
                  style: subTitle,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
