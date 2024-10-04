import 'package:flutter/material.dart';
import 'package:portofollio/app.dart';

class EmailFormField extends StatelessWidget {
  const EmailFormField(
      {super.key,
      required this.controller,
      required this.hintText,
      this.maxLines = 1});
  final TextEditingController controller;
  final String hintText;
  final int maxLines;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      controller: controller,
      style: Theme.of(context)
          .textTheme
          .labelMedium!
          .copyWith(fontWeight: FontWeight.normal, color: whiteColor),
      autofocus: false,
      onSaved: (String? value) {},
      validator: (_) {
        return "Field is required";
      },
      textInputAction: TextInputAction.done,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
          hintStyle: Theme.of(context)
              .textTheme
              .labelSmall!
              .copyWith(color: blackColor10),
          hintText: hintText),
    );
  }
}
