import 'package:url_launcher/url_launcher.dart';

class Sms {
  String number;
  String text;
  Sms({
    required this.number,
    required this.text,
  });

  sendText() async {
    // Android
    final Uri uri = Uri.parse('sms:$number?body=$text');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      // iOS
      final Uri uri = Uri.parse('sms:$number?body=$text');
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
      } else {
        throw 'Could not launch $uri';
      }
    }
  }
}
