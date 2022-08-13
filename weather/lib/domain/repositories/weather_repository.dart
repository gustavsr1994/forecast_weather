import 'package:weather/domain/entities/weather_entity.dart';

abstract class WeatherRepository {
  Future<List<WeatherEntity>> listWeather(double lat, double lon);
}
