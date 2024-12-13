class WeatherModel {
  final String Location;
  final DateTime UpDate;
  final String? image;
  final double AvrgTemp;
  final double MaxTemp;
  final double MinTemp;
  final String WeatherMode;
  WeatherModel({
    required this.Location,
    required this.UpDate,
    this.image,
    required this.AvrgTemp,
    required this.MaxTemp,
    required this.MinTemp,
    required this.WeatherMode,
  });

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      Location: json['location']['name'],
      UpDate: DateTime.parse(json['current']['last_updated']),
      AvrgTemp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      MaxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      MinTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      WeatherMode: json['forecast']['forecastday'][0]['day']['condition']
          ['text'],
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
    );
  }
}
