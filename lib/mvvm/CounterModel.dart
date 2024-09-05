import 'package:http/http.dart';
import 'dart:async';

// Future<http.Response> get(Uri uri) => http.get(uri);

class CounterData {
  final int count;

  CounterData(this.count);
}

class CounterModel {

  Future<CounterData> loadCountFromServer() async {
    final uri = Uri.parse("https://myfluttercounterapp.net/count");
    final response = await get(uri);
    if (response.statusCode == 200) {
      return CounterData(int.parse(response.body));
    } else {
      throw Exception('Failed to load count');
    }
  }

  Future<CounterData> updateCountOnServer(int count) async {
    // TODO: implement updateCountOnServer
    throw UnimplementedError();
  }
}
