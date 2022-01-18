import 'dart:io';

import 'package:flutter/material.dart';

class MyNetworkImage extends StatelessWidget {
  const MyNetworkImage({
    Key? key,
    required this.url,
  }) : super(key: key);

  final String url;

  @override
  Widget build(BuildContext context) {
    return Platform.environment.containsKey('FLUTTER_TEST')
        ? const FlutterLogo(size: 320)
        : Image.network(url);
  }
}
