import 'package:flutter/material.dart';
import 'package:portofollio/utils/utils.dart';
import 'package:portofollio/widgets/responsive_widget.dart';

class BulletList extends StatelessWidget {
  final String strings;
  final double width;
  const BulletList(this.strings, {super.key, this.width = 200});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('\u2022',
            style: TextStyle(fontSize: 20, color: Colors.cyan)),
        sizedWidth(5),
        SizedBox(
          width: width,
          child: Text(strings,
              textScaler: TextScaler.linear(ScaleSize.textScaleFactor(context)),
              textAlign: TextAlign.left,
              softWrap: true,
              style: Theme.of(context).textTheme.bodyMedium),
        ),
      ],
    );
  }
}
