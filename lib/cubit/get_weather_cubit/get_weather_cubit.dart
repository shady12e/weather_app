import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_weather_cubit/weather_state.dart';
import 'package:weather_app/model/weather_model.dart';

import 'package:weather_app/servies/weather_servies.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(InitialWeatherState());

   WeatherModel? weatherModel;

  getWeather({required String CityName}) async {
    try {
       weatherModel =
          await WeatherScrives(Dio()).getWeather(cityName: CityName);

      emit(weatherStateLouding());
    } catch (e) {
      emit(FulearState());
    }
  }
}

