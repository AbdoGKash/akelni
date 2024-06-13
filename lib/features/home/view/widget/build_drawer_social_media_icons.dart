import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/theming/colors.dart';

class BuildDrawerSocialMediaIcons extends StatelessWidget {
  const BuildDrawerSocialMediaIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 16),
      child: Row(
        children: [
          buildIcon(
              FontAwesomeIcons.facebook,
              'https://www.facebook.com/profile.php?id=100007743407436',
              Colors.blue),
          const SizedBox(
            width: 15,
          ),
          buildIcon(
              FontAwesomeIcons.youtube,
              'https://www.youtube.com/@abdog.kashkosh8885/videos',
              ColorsManager.red),
          const SizedBox(
            width: 20,
          ),
          buildIcon(FontAwesomeIcons.telegram, 'https://web.telegram.org/a/',
              const Color.fromARGB(255, 10, 83, 143)),
          const SizedBox(
            width: 15,
          ),
          buildIcon(
              FontAwesomeIcons.whatsapp,
              'https://api.whatsapp.com/send?phone=201025598871&app',
              const Color.fromARGB(255, 70, 143, 10)),
        ],
      ),
    );
  }

  void _launchURL(String url) async {
    await launchUrl(Uri.parse(url));
  }

  Widget buildIcon(IconData icon, String url, Color color) {
    return InkWell(
      onTap: () => _launchURL(url),
      child: Icon(
        icon,
        color: color,
        size: 35,
      ),
    );
  }
}
