// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  String image, title, genre;
  int rating;

  MovieCard(
      {required this.image,
      required this.title,
      required this.genre,
      required this.rating});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 24),
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(21),
            child: Container(
              child: Image.asset(
                image,
                height: 207,
                width: 300,
              ),
            ),
          ),
          SizedBox(
            height: 19,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0xff0D0846),
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    genre,
                    style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff929292),
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
