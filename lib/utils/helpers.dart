import 'package:flutter/material.dart';

class Helpers {
  Center refreshingWidget(BuildContext context) {
    return Center(
        heightFactor: 1,
        widthFactor: 1,
        child: Transform.scale(
            scale: 0.5,
            child: CircularProgressIndicator(
                color: Theme.of(context).primaryIconTheme.color,
                strokeWidth: 5.0)));
  }
}
