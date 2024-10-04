import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../app.dart';
import 'components/email_form_field.dart';

class ContactView extends StatefulWidget {
  const ContactView({super.key, required this.constraints});

  final BoxConstraints constraints;

  @override
  State<ContactView> createState() => _ContactViewState();
}

class _ContactViewState extends State<ContactView> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  bool footerOnHoverd = false;
  int footerHoveredIndex = 0;
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    double screenWidth = widget.constraints.maxWidth;
    bool isMobile = screenWidth < 600;
    bool isTablet = screenWidth >= 600 && screenWidth < 1024;
    final TextStyle textStyle = Theme.of(context)
        .textTheme
        .labelLarge!
        .copyWith(fontWeight: FontWeight.normal, color: whiteColor);
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(deviceSize.width * 0.03),
          child: Container(
            color: Color.fromARGB(255, 5, 13, 89),
            width: double.maxFinite,
            child: Column(
              children: [
                sizedHeight(deviceSize.height * 0.05),
                Text("Let's get in touch",
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.w400, color: whiteColor)),
                sizedHeight(deviceSize.height * 0.02),
                SizedBox(
                  width: isMobile || isTablet
                      ? deviceSize.width * 0.7
                      : deviceSize.width * 0.4,
                  child: Text(
                      "Got a question or proposal, or just want to say hello? Go head.",
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: whiteColor)),
                ),
                sizedHeight(deviceSize.height * 0.07),
                Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: deviceSize.width * 0.03),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Your Name", style: textStyle),
                      sizedHeight(deviceSize.height * 0.02),
                      EmailFormField(
                          controller: _nameController,
                          hintText: "Enter your name"),
                      sizedHeight(deviceSize.height * 0.03),
                      Text("Email Address", style: textStyle),
                      sizedHeight(deviceSize.height * 0.02),
                      EmailFormField(
                          controller: _emailController,
                          hintText: "Enter your email address"),
                      sizedHeight(deviceSize.height * 0.03),
                      Text("Your Message", style: textStyle),
                      sizedHeight(deviceSize.height * 0.02),
                      EmailFormField(
                          maxLines: 5,
                          controller: _messageController,
                          hintText:
                              "Hi, I think we need a web or mobile apps to be developed for our products at Company X. Can we discuss about it?"),
                      sizedHeight(deviceSize.height * 0.02),
                    ],
                  ),
                ),
                sizedHeight(deviceSize.height * 0.02),
                SizedBox(
                  width: deviceSize.width * 0.25,
                  child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          // backgroundColor: primaryColor,
                          shape: BeveledRectangleBorder(
                        borderRadius: BorderRadius.circular(2),
                      )),
                      onPressed: _sendEmail,
                      icon: const Icon(Icons.mail),
                      label: Text("Shoot",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(color: whiteColor))),
                ),
                sizedHeight(deviceSize.height * 0.02),
              ],
            ),
          ),
        ),
        FooterView(
            constraints: widget.constraints,
            footerHoveredIndex: footerHoveredIndex,
            footerOnHoverd: footerOnHoverd,
            onHover: _onfooterOnHoverd)
      ],
    );
  }

  void _onfooterOnHoverd(bool isHovered, int index) {
    setState(() {
      footerOnHoverd = isHovered;
      footerHoveredIndex = footerHoveredIndex == index ? 1000 : index;
    });
  }

  Future<void> _sendEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: 'kalkidandemes99@gmail.com',
      query:
          "subject=${_nameController.text.isEmpty ? "Message from Portfolio Website" : "${_nameController.text}: Message from Portfolio Website"}&body=${_messageController.text.isEmpty ? "Hi, I think we need a web or mobile apps to be developed for our products at Company X. Can we discuss about it?\n ${_emailController.text.isNotEmpty ? "Here is my email address ${_emailController.text}" : ""}" : _messageController.text}",
    );

    if (await launchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      // Handle the error
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }
}
