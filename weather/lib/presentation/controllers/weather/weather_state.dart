part of 'weather_bloc.dart';

@immutable
abstract class WeatherState {}

class WeatherInitial extends WeatherState {}

class WaitingLoading extends WeatherState {}

class WeatherSuccess extends WeatherState {
  final List<WeatherEntity>? listEntity;
  WeatherSuccess({this.listEntity});
}

class WeatherError extends WeatherState {
  final String messageError;
  WeatherError({required this.messageError});
}

class WeatherNoData extends WeatherState {
  final String messageError;
  WeatherNoData({required this.messageError});
}
