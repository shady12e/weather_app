import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubit/get_weather_cubit/weather_state.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                appBarTheme: AppBarTheme(
                    color: getColorTheme(
                        BlocProvider.of<GetWeatherCubit>(context)
                            .weatherModel
                            ?.WeatherMode)),
              ),
              debugShowCheckedModeBanner: false,
              home: HomeView(),
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getColorTheme(String? condition) {
  switch (condition) {
    case 'Sunny':
    case 'Cloudy':
    case 'Partly cloudy':
      return Colors.orange;

    case 'Patchy snow possible':
    case 'Patchy sleet possible':
    case 'Blowing snow':
      return Colors.blue;
    case 'Freezing fog':
    case 'Fog':
    case 'Mist':
      return Colors.grey;
    case 'Patchy light rain':
    case 'Light rain':
    case 'Moderate rain':
      return Colors.lightBlue;
    case 'Heavy rain':
      return Colors.blueGrey;
    case 'Partly cloudy':
    case 'Moderate snow':
      return Colors.cyan;
    case 'Heavy snow':
      return Colors.blueGrey;
    case 'Thundery outbreaks possible':
      return Colors.yellow;
    case 'Patchy freezing drizzle possible':
    case 'Freezing drizzle':
      return Colors.brown;
    default:
      return Colors.brown; // Fallback color
  }
}
