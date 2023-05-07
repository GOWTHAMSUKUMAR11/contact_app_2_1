import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:user/model/userDetails.dart';

class UserRepository {
  var client = http.Client();

  Future<List<UserDetails>> getDetails() async {
    String api = "https://jsonplaceholder.typicode.com/users";
    var url = Uri.parse(api);
    var response = await client.get(url);

    if (response.statusCode == 200) {
      final List result = convert.jsonDecode(response.body);
      return result.map(((e) => UserDetails.fromJson(e))).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
