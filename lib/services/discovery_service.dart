
import 'dart:convert';

import 'package:another_quickbooks/quickbook_models.dart';
import 'package:http/http.dart' as http;


class DiscoveryService {

  final String discoveryUrl;

  DiscoveryService({required this.discoveryUrl});

  Future<UrlDiscovery> initialize() async {
    var url = Uri.parse(discoveryUrl);

    var response = await http.get(url);
    if (response.statusCode == 200) {
      
      return UrlDiscovery.fromJson(jsonDecode(response.body));
    } else {
      throw DiscoveryFailedException(response.statusCode);
    }
  }
}

class DiscoveryFailedException implements Exception {
  final int statusCode;

  DiscoveryFailedException(this.statusCode);

}