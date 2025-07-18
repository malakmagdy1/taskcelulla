//
// class WeatherScreen extends StatelessWidget {
//   const WeatherScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => LayoutCubit()
//         ..getData()
//         ..getData2(),
//       child: BlocConsumer<LayoutCubit, LayoutStates>(
//         listener: (context, state) {
//           if (state is FailedToGetWeatherState ||
//               state is FailedToGetWeatherState2) {
//             print("❌ Error fetching weather data");
//           }
//           if (state is GetWeatherSuccessState2) {
//             print("✅ Forecast data received: ${LayoutCubit.get(context).weather2}");
//           }
//         },
//         builder: (context, state) {
//           final cubit = LayoutCubit.get(context);
//           final weather = cubit.weather;
//           final weather2 = cubit.weather2;
//           if (weather != null && weather2 != null) {
//             return Scaffold(
//               body: Center(
//                 child: SingleChildScrollView(
//                   padding: EdgeInsets.all(16),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text("API 1 - Current Weather", style: TextStyle(color: Colors.white, fontSize: 20)),
//                       SizedBox(height: 8),
//                       Text("City: ${weather.name}", style: TextStyle(color: Colors.white)),
//                       Text("Condition: ${weather.conditionText}", style: TextStyle(color: Colors.white)),
//                       Text("Temp: ${weather.tempC} °C", style: TextStyle(color: Colors.white)),
//                       Text("Wind Degree: ${weather.windDegree}°", style: TextStyle(color: Colors.white)),
//                       Text("Humidity: ${weather.humidityDegree}%", style: TextStyle(color: Colors.white)),
//                       Text("Cloud: ${weather.cloudDegree}%", style: TextStyle(color: Colors.white)),
//                       Image.network(weather.iconUrl),
//                       Divider(color: Colors.white),
//                       SizedBox(height: 20),
//                       Text("API 2 - Forecast", style: TextStyle(color: Colors.white, fontSize: 20)),
//                       SizedBox(height: 8),
//                       Text("Date: ${weather2.Date}", style: TextStyle(color: Colors.white)),
//                       Text("Day Condition: ${weather2.DayCondition}", style: TextStyle(color: Colors.white)),
//                       Text("Max Temp: ${weather2.MaxTemp} °C", style: TextStyle(color: Colors.white)),
//                       Text("Min Temp: ${weather2.MinTemp} °C", style: TextStyle(color: Colors.white)),
//                       Text("Sunrise: ${weather2.SunRise}", style: TextStyle(color: Colors.white)),
//                       Text("Sunset: ${weather2.SunSet}", style: TextStyle(color: Colors.white)),
//                     ],
//                   ),
//                 ),
//               ),
//             );
//           } else if (state is FailedToGetWeatherState || state is FailedToGetWeatherState2) {
//             return Scaffold(
//               body: Center(
//                 child: Text("⚠️ Failed to load weather data", style: TextStyle(color: Colors.red, fontSize: 18)),
//               ),
//             );
//           } else {
//             return Scaffold(
//               body: Center(child: CircularProgressIndicator()),
//             );
//           }
//         },
//       ),
//     );
//   }
// }
//
//
//
