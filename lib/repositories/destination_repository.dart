import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/destination.dart';

class DestinationRepository {
  final String baseUrl = 'https://dlnyaba.com/gashtyar/public/api';

  Future<List<Destination>> fetchDestinations() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/destinations'));

      // print('RESPONSE STATUS: ${response.statusCode}');
      // print('RESPONSE BODY: ${response.body}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> body = jsonDecode(response.body);

        // important: body['data'] must exist
        final List<dynamic> data = body['data'];

        return data.map((json) => Destination.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load destinations');
      }
    } catch (e) {
      print('ERROR FETCHING DESTINATIONS: $e');
      throw Exception('Failed to load destinations');
    }
  }
}
