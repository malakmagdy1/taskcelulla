import '../domain/weather/weather_entity.dart';

class WeatherModel extends WeatherInfoRealTime {
  WeatherModel.fromJson(Map<String, dynamic> json)
      : super(
          name: json['location']['name'],
          region: json['location']['region'],
          countryName: json['location']['country'],
          tempC: json['current']['temp_c'],
          tempF: json['current']['temp_f'],
          windDegree: json['current']['wind_degree'],
          humidityDegree: json['current']['humidity'],
          cloudDegree: json['current']['cloud'],
          isDay: json['current']['is_day'] == 1,
          conditionText: json['current']['condition']['text'],
          iconUrl: 'https:${json['current']['condition']['icon']}',
        );
}

class WeatherForecastModel extends WeatherInfoForeCast {
  WeatherForecastModel.fromJson(Map<String, dynamic> json)
      : super(
          date: json['forecast']['forecastday'][0]['date'],
          maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
          minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
          dayCondition: json['forecast']['forecastday'][0]['day']['condition']
              ['text'],
          sunRise: json['forecast']['forecastday'][0]['astro']['sunrise'],
          sunSet: json['forecast']['forecastday'][0]['astro']['sunset'],
        );
}
