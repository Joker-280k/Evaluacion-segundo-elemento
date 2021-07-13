import 'package:dio/dio.dart';
import 'package:app_final_fsjr/src/model/jokemodel.dart';

class JokesProvider {
  final String _url = 'https://v2.jokeapi.dev/joke/Any?amount=10';
  final http = Dio();

  Future<List<JokeModel>> obtenerChistes() async {
    List<JokeModel> jokes = [];
    final response = await http.get(_url);
    List<dynamic> respuestaData = response.data['jokes'];
    return respuestaData.map((data) => JokeModel.fromMapJSON(data)).toList();
  }
}
