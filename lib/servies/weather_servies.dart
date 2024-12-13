import 'package:dio/dio.dart';
import 'package:weather_app/model/weather_model.dart';

class WeatherScrives {
  final Dio dio;
  String baseUrl = 'https://api.weatherapi.com/v1';
  String ApiKey = 'b2bea03b7dca46b0b8f132340240311';
  WeatherScrives(this.dio);
  Future<WeatherModel> getWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$ApiKey&q=$cityName&days=1');

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);

      return weatherModel;
    } on DioException catch (e) {
      String errMessage = e.response?.data['error']['message'] ??
          'Please check the spelling of your city name.';
      throw Exception(errMessage);
    } catch (e) {
      throw Exception('Oops, there was an error. Please try again later.');
    }
  }
}
