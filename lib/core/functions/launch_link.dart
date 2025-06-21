import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchLink(context, String link) async {
     final Uri url = Uri.parse(link);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text('Could not launch',),
        ),
      );
    }
  }