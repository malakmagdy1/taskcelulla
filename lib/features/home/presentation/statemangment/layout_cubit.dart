import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import '../../domain/weather/weather_entity.dart';

class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit() : super(LayoutInitialState());

  static LayoutCubit get(BuildContext context) => BlocProvider.of(context);

  WeatherInfoRealTime? weather;

  Future<void> getData() async {
    try {
      final response = await http.get(Uri.parse(
          "https://api.weatherapi.com/v1/current.json?q=egypt&key=ca98ce66998b4299ba2212530251707"));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        weather = WeatherInfoRealTime.fromJson(data);
        emit(GetWeatherSuccessState());
      } else {
        emit(FailedToGetWeatherState());
      }
    } catch (e) {
      print('Error fetching weather: $e');
      emit(FailedToGetWeatherState());
    }
  }

  WeatherInfoForeCast? weather2;

  Future<void> getData2() async {
    try {
      final response = await http.get(Uri.parse(
          "https://api.weatherapi.com/v1/forecast.json?q=giza&days=1&hour=24&key=ca98ce66998b4299ba2212530251707"));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        weather2 = WeatherInfoForeCast.fromJson(data);
        emit(GetWeatherSuccessState2());
      } else {
        emit(FailedToGetWeatherState2());
      }
    } catch (e) {
      print(
          '####################################################################Error fetching weather: $e');
      emit(FailedToGetWeatherState());
    }
  }
}

abstract class LayoutStates {}

class GetWeatherSuccessState2 extends LayoutStates {}

class FailedToGetWeatherState2 extends LayoutStates {}

class LayoutInitialState extends LayoutStates {}

class GetWeatherSuccessState extends LayoutStates {}

class FailedToGetWeatherState extends LayoutStates {}
