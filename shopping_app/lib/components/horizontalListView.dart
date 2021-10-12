// ignore_for_file: file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace, non_constant_identifier_names

import 'package:flutter/material.dart';

class HorizontaList extends StatelessWidget {
  const HorizontaList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Category(ImageCaption: 'shirt', ImageLocation: 'assets/kj1.jpg'),
          Category(ImageCaption: 'pant', ImageLocation: 'assets/kj1.jpg'),
          Category(ImageCaption: 'shirt', ImageLocation: 'assets/kj1.jpg'),
          Category(ImageCaption: 'shirt', ImageLocation: 'assets/kj1.jpg'),
          Category(ImageCaption: 'shirt', ImageLocation: 'assets/kj1.jpg'),
          Category(ImageCaption: 'shirt', ImageLocation: 'assets/kj1.jpg'),
          Category(ImageCaption: 'shirt', ImageLocation: 'assets/kj1.jpg'),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String ImageLocation;
  final String ImageCaption;
  const Category(
      {Key? key, required this.ImageCaption, required this.ImageLocation})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 80,
          child: ListTile(
            title: Image.asset(
              ImageLocation,
              width: 40,
              height: 40,
            ),
            subtitle: Text(
              ImageCaption,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
