import 'package:flutter/material.dart';

import '../constants.dart';

class get_network_image extends StatelessWidget {
  ImageProvider image;

  get_network_image({this.image});

  @override
  Widget build(BuildContext context) {
    return Image(
      fit: BoxFit.cover,
      image: this.image,
      loadingBuilder: (context, child, progress) {
        return progress == null
            ? child
            : Container(
                height: 150,
                child: Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(main_dark_color),
                  ),
                ),
              );
      },
    );
    ;
  }
}
