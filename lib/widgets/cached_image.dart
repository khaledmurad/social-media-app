import 'package:flutter/material.dart';
import 'package:social_media_app/widgets/indicators.dart';

Widget cachedNetworkImage(String imgUrl) {
  return Image.network(
    imgUrl,
    fit: BoxFit.cover,

  );
}
