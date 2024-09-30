import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<Place>> getAllPlace() async {
  final response = await http.get(Uri.parse('https://example.com/api/getAllPlace'));

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((data) => Place.fromJson(data)).toList();
  } else {
    throw Exception('Không thể tải danh sách địa điểm');
  }
}

class Place {
  final String name;
  final String imageUrl;

  Place({required this.name, required this.imageUrl});

  factory Place.fromJson(Map<String, dynamic> json) {
    return Place(
      name: json['name'],
      imageUrl: json['imageUrl'],
    );
  }
}
