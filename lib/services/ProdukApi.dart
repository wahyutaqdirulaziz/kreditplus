import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kreditplus/models/Produk.dart';

class ProdukApiDB {
  static var client = http.Client();

  static Future<List<ProdukItemModel>> getdata() async {
    var response =
        await client.get(Uri.parse('https://fakestoreapi.com/products'));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return produkItemModelFromJson(jsonString);
    } else {
      return [];
    }
  }
}
