class WeatherInfoRealTime {
  final String name;
  final String region;
  final String countryName;
  final double tempC;
  final double tempF;
  final int windDegree;
  final int humidityDegree;
  final int cloudDegree;
  final bool isDay;
  final String conditionText;
  final String iconUrl;

  WeatherInfoRealTime({
    required this.name,
    required this.region,
    required this.countryName,
    required this.tempC,
    required this.tempF,
    required this.windDegree,
    required this.humidityDegree,
    required this.cloudDegree,
    required this.isDay,
    required this.conditionText,
    required this.iconUrl,
  });
}

class WeatherInfoForeCast {
  final String sunRise;
  final String sunSet;
  final String date;
  final double maxTemp;
  final double minTemp;
  final String dayCondition;

  WeatherInfoForeCast({
    required this.sunRise,
    required this.sunSet,
    required this.date,
    required this.maxTemp,
    required this.minTemp,
    required this.dayCondition,
  });
}
