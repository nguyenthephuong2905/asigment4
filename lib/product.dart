import 'dart:convert';
import 'package:http/http.dart' as http;
import 'product.dart'; // Đảm bảo import model Product

Future<List> fetchProducts() async {
  final response = await http.get(Uri.parse('https://t2210m-flutter.onrender.com/products'));

  if (response.statusCode == 200) {
    List<dynamic> data = jsonDecode(response.body);
    return data.map((json) => Product.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load products');
  }
}

mixin Product {
  String? get name => null;

  static fromJson(json) {}
}
