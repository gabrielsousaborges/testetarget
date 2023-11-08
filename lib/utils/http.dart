import 'package:url_launcher/url_launcher.dart';

class HttpConnet {
  void redirectLink() async {
    final url = 'https://www.google.com.br';

    if (await canLaunchUrl(Uri.parse(url))) {
      launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }
}
