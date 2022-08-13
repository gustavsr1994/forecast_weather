part of 'weather_bloc.dart';

@immutable
abstract class WeatherEvent {}

class LoadWeatherEvent extends WeatherEvent {
  final double? lat;
  final double? lon;
  LoadWeatherEvent({this.lat, this.lon});
}
