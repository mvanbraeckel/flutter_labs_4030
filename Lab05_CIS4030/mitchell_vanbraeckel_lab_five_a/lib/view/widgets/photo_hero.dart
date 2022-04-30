import 'package:flutter/material.dart';

class PhotoHero extends StatelessWidget {
  const PhotoHero({ Key? key, required this.photo, required this.onTap, required this.width, required this.boxFit }) : super(key: key);

  final String photo;
  final VoidCallback onTap;
  final double width;
  final BoxFit boxFit;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Hero(
        tag: photo,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Image.network(
              photo,
              fit: boxFit,
            ),
          ),
        ),
      ),
    );
  }
}