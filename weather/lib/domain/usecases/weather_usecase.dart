import 'package:flutter/material.dart';
import 'package:weather/data/datasources/remote/weather_datasource.dart';
import 'package:weather/data/repositories/weather_repository_impl.dart';
import 'package:weather/domain/entities/weather_entity.dart';

abstract class WeatherUsecase {
  Future<List<WeatherEntity>> listWeather(double lat, double lon);
}

class WeatherUsecaseImpl extends WeatherUsecase {
  WeatherDataApi dataApi = WeatherDataApi();
  WeatherUsecaseImpl({@required dataApi});

  @override
  Future<List<WeatherEntity>> listWeather(double lat, double lon) =>
      WeatherRepositoryImpl(dataApi).listWeather(lat, lon);
}
