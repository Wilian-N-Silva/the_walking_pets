import 'package:url_launcher/url_launcher.dart';

class MapUtils {
  static Future<void> openMap(double lat, double lgn) async {
    String mapUrl = 'https://www.google.com/maps/search/?api=1&query=$lat,$lgn';

    if (await canLaunch(mapUrl)) {
      await launch(mapUrl);
    } else {
      throw 'Não foi possível abrir o mapa';
    }
  }
}
