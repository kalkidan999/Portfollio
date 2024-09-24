import 'package:flutter/material.dart';

class EmailMeView extends StatelessWidget {
  const EmailMeView(
      {super.key, required this.controller, required this.hintText});
  final TextEditingController controller;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return SizedBox(
      width: deviceSize.width <= 600
          ? deviceSize.width * 0.5
          : deviceSize.width * 0.2,
      child: TextFormField(
        controller: controller,
        style: Theme.of(context)
            .textTheme
            .labelMedium!
            .copyWith(fontWeight: FontWeight.normal),
        autofocus: false,
        onSaved: (String? value) {},
        validator: (_) {
          return "Field is required";
        },
        textInputAction: TextInputAction.done,
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
            fillColor: const Color.fromARGB(255, 5, 12, 78),
            hintStyle: Theme.of(context)
                .textTheme
                .labelSmall!
                .copyWith(color: Colors.grey),
            hintText: hintText),
      ),
    );
  }
}
