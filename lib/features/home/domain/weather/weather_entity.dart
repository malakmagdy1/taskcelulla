

class WeatherInfoRealTime {
  late String name;
  late String region;
  late String countryName;
  late double tempC;
  late double tempF;
  late int windDegree;
  late int humidityDegree;
  late int cloudDegree;
  late bool isDay;
  late String conditionText;
  late String iconUrl;

  WeatherInfoRealTime.fromJson(Map<String, dynamic> json) {
    name = json['location']['name'];
    region = json['location']['region'];
    countryName = json['location']['country'];
    tempC = json['current']['temp_c'];
    tempF = json['current']['temp_f'];
    windDegree = json['current']['wind_degree'];
    humidityDegree = json['current']['humidity'];
    cloudDegree = json['current']['cloud'];
    isDay = json['current']['is_day'] == 1;
    conditionText = json['current']['condition']['text'];
    iconUrl = 'https:${json['current']['condition']['icon']}'; // Add https:
  }
}

class WeatherInfoForeCast {
  late String SunRise;
  late String SunSet;
  late String Date;
  late double MaxTemp;
  late double MinTemp;
  late String DayCondition;

  WeatherInfoForeCast.fromJson(Map<String, dynamic> json) {
    final forecastDay = json['forecast']['forecastday'][0];
    Date = forecastDay['date'];
    MaxTemp = forecastDay['day']['maxtemp_c'];
    MinTemp = forecastDay['day']['mintemp_c'];
    DayCondition = forecastDay['day']['condition']['text'];
    SunRise = forecastDay['astro']['sunrise'];
    SunSet = forecastDay['astro']['sunset'];
  }
}
