import 'package:weather/domain/entities/weather_entity.dart';
import 'package:weather/domain/repositories/weather_repository.dart';

abstract class WeatherUsecase {
  Future<List<WeatherEntity>> listWeather(double lat, double lon);
}

class WeatherUsecaseImpl extends WeatherUsecase {
  final WeatherRepository repository;
  WeatherUsecaseImpl({required this.repository});

  @override
  Future<List<WeatherEntity>> listWeather(double lat, double lon) =>
      repository.listWeather(lat, lon);
}
