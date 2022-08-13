part of 'weather_bloc.dart';

@immutable
abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WeatherSuccess extends WeatherState {
  final List<WeatherEntity>? listEntity;
  WeatherSuccess({this.listEntity});
}
