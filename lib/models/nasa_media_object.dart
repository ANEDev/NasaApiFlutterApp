// Beispielaufruf
// https://creativecommons.tankerkoenig.de/json/list.php?lat=52.521&lng=13.438&rad=1.5&sort=dist&type=all&apikey=00000000-0000-0000-0000-000000000002

class NasaMediaObject {
  final String date;
  final String explanation;
  final String media_type;
  final String service_version;
  final String title;
  final String url;
  final String copyright;
  
  NasaMediaObject({
    this.date,
    this.explanation,
    this.media_type,
    this.service_version,
    this.title,
    this.url,
    this.copyright});

  NasaMediaObject.fromJson(Map<String, dynamic> json)
      : date = json['date'],
        explanation = json['explanation'],
        media_type = json['media_type'],
        service_version = json['service_version'],
        title = json['title'],
        url = json['url'],
        copyright = json['copyright'];
}