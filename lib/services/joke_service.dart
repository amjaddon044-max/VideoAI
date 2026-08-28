import 'package:http/http.dart' as http;
import 'dart:convert';

class JokeService {
  static const String _baseUrl = 'https://api.api-ninjas.com/v1/jokes';
  static const String _apiKey = 'YOUR_API_KEY_HERE'; // Get from api-ninjas.com

  /// Fetch a random joke from API Ninjas
  static Future<String> getRandomJoke() async {
    try {
      final response = await http.get(
        Uri.parse(_baseUrl),
        headers: {
          'X-Api-Key': _apiKey,
        },
      ).timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        if (data.isNotEmpty) {
          return data[0]['joke'] ?? 'No joke found!';
        }
        return 'No joke found!';
      } else if (response.statusCode == 401) {
        return 'API Key is invalid. Please check your API key.';
      } else {
        return 'Failed to load joke: ${response.statusCode}';
      }
    } catch (e) {
      return 'Error: ${e.toString()}';
    }
  }

  /// Fetch multiple random jokes
  static Future<List<String>> getMultipleJokes(int count) async {
    List<String> jokes = [];
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl?limit=$count'),
        headers: {
          'X-Api-Key': _apiKey,
        },
      ).timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        jokes = data.map((joke) => joke['joke'].toString()).toList();
        return jokes;
      } else {
        return ['Failed to load jokes'];
      }
    } catch (e) {
      return ['Error: ${e.toString()}'];
    }
  }
}
