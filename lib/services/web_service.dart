import 'dart:convert';
import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:rest_project/models/nasa_media_object.dart';

class WebService {
  static const APIKEY = 'DEMO_KEY';
  final baseURL = 'api.nasa.gov';

  Future<NasaMediaObject> getAstronomyPictureOfTheDay() async{
    var queryParameters = {
      'api_key': APIKEY,
    };
    var url = Uri.https(baseURL, '/planetary/apod', queryParameters);
    final response = await http.get(url);
    if (response.statusCode == 200){
      return NasaMediaObject.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<NasaMediaObject> getAstronomyPictureOfSpecificDay(String date) async{
    var queryParameters = {
      'api_key': APIKEY,
      'date': date,
    };
    var url = Uri.https(baseURL, '/planetary/apod', queryParameters);
    final response = await http.get(url);
    if (response.statusCode == 200){
      return NasaMediaObject.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }

//  Future<NasaMediaObject> postSomething(NasaMediaObject nasaMediaObject) async{
//    final response = await http.post('$url',
//        headers: {
//          HttpHeaders.contentTypeHeader: 'application/json'
//        },
//        body: NasaMediaObject.ToJson(nasaMediaObject)
//    );
//    if (response.statusCode == 200){
//      return NasaMediaObject.fromJson(json.decode(response.body));
//    }
//  }
}