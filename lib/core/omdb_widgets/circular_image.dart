import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CircularImage extends StatelessWidget {
  final String url;
  final double factor;

  CircularImage._(this.url, this.factor);

  CircularImage.network({required this.url, this.factor = 1});

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.white),
              borderRadius: BorderRadius.circular(45),
              image: DecorationImage(
                  image: NetworkImage(url), fit: BoxFit.cover))),
      scale: factor,
    );
  }
}
