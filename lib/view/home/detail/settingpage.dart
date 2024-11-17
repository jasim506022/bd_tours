import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButtonWidget(),
        title: const Text(
          "Setting",
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTitleWidget(
              icon: Ionicons.person_outline,
              title: "Notification Settings",
              function: () {},
            ),
            ListTitleWidget(
              icon: Ionicons.key_outline,
              title: "Password Manager",
              function: () {},
            ),
            ListTitleWidget(
              icon: Ionicons.card_outline,
              title: "Delete Account",
              function: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class ListTitleWidget extends StatelessWidget {
  const ListTitleWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.function,
  });
  final IconData icon;
  final String title;
  final VoidCallback function;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(
            icon,
            size: 30,
            color: Colors.green,
          ),
          title: Text(
            title,
            style: GoogleFonts.dmSans(
                fontSize: 18, fontWeight: FontWeight.w400, color: Colors.black),
          ),
          trailing: IconButton(
              onPressed: function,
              icon: Icon(
                Icons.arrow_forward_ios,
                color: Colors.green,
              )),
        ),
        Divider(
          color: Colors.grey.shade200,
        )
      ],
    );
  }
}

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black26)),
          child: const Icon(Ionicons.arrow_back)),
    );
  }
}
