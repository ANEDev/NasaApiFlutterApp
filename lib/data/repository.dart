import 'package:rest_project/models/nasa_media_object.dart';
import 'package:rest_project/services/web_service.dart';

abstract class Repository{
  Repository._();

  Future<NasaMediaObject> getAstronomyPictureOfTheDay();
  Future<NasaMediaObject> getAstronomyPictureOfSpecificDay(String date);
}

class WebServiceRepository implements Repository{

  @override
  Future<NasaMediaObject> getAstronomyPictureOfTheDay() async{
    NasaMediaObject nasaMediaObject;
    WebService webService = WebService();
    try {
      nasaMediaObject = await webService.getAstronomyPictureOfTheDay();
    }catch(e){
      return null;
    }
    return nasaMediaObject;
  }

  @override
  Future<NasaMediaObject> getAstronomyPictureOfSpecificDay(String date) async{
    NasaMediaObject nasaMediaObject;
    WebService webService = WebService();
    try {
      nasaMediaObject = await webService.getAstronomyPictureOfSpecificDay(date);
    }catch(e){
      return null;
    }
    return nasaMediaObject;
  }
}