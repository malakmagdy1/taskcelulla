import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/features/home/presentation/statemangment/layout_cubit.dart';

import '../../../core/widget/app_bar.dart'; // Your CustomAppBar here

class WeatherScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    return BlocProvider(
      create: (_) => LayoutCubit()
        ..getData()
        ..getData2(),
      child: BlocConsumer<LayoutCubit, LayoutStates>(
        listener: (context, state) {
          if (state is FailedToGetWeatherState ||
              state is FailedToGetWeatherState2) {
            print("❌ Error fetching weather data");
          }
          if (state is GetWeatherSuccessState2) {
            print(
                "✅ Forecast data received: ${LayoutCubit.get(context).weather2}");
          }
        },
        builder: (context, state) {
          final cubit = LayoutCubit.get(context);
          final weather = cubit.weather;
          final weather2 = cubit.weather2;

          if (weather != null && weather2 != null) {
            return Scaffold(
              appBar: CustomAppBar(
                title1: "Today's Weather",
                title2: "${weather.name}, ${weather.region}",
              ),
              body: SingleChildScrollView(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        weather2.Date,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Main Weather Card
                    Container(
                      padding: EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blueGrey.withOpacity(0.2),
                      ),
                      child: Center(
                        child: Column(
                          children: [
                            Image.network(weather.iconUrl),
                            SizedBox(height: 10),
                            Text(
                              "${weather.tempC}°C",
                              style: TextStyle(
                                  fontSize: 32, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              weather.conditionText,
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),

                    // Weather stats
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        WeatherStat(
                          icon: Icons.water_drop,
                          label: "Humidity",
                          value: "${weather.humidityDegree}%",
                        ),
                        WeatherStat(
                          icon: Icons.air,
                          label: "Wind",
                          value: "${weather.windDegree} km/h",
                        ),
                        WeatherStat(
                          icon: Icons.cloud,
                          label: "Cloud",
                          value: "${weather.cloudDegree}%",
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 2,
                      color: Colors.white,
                    ),
                    Text("Max Temp: ${weather2.MaxTemp} °C",
                        style: TextStyle(color: Colors.white)),
                    Text("Min Temp: ${weather2.MinTemp} °C",
                        style: TextStyle(color: Colors.white)),
                    Text("Sunrise: ${weather2.SunRise}",
                        style: TextStyle(color: Colors.white)),
                    Text("Sunset: ${weather2.SunSet}",
                        style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            );
          } else {
            return Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }
        },
      ),
    );
  }
}

// Reusable WeatherStat Widget
class WeatherStat extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const WeatherStat({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 30, color: Colors.blue),
        SizedBox(height: 5),
        Text(value, style: TextStyle(fontWeight: FontWeight.bold)),
        Text(label, style: TextStyle(fontSize: 12)),
      ],
    );
  }
}
