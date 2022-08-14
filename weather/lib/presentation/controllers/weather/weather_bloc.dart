import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:weather/domain/entities/weather_entity.dart';
import 'package:weather/domain/usecases/weather_usecase.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherUsecase weatherUsecase;
  WeatherBloc({required this.weatherUsecase}) : super(WeatherInitial()) {
    on<LoadWeatherEvent>((event, emit) async {
      emit(WaitingLoading());
      try {
        var listData = await weatherUsecase.listWeather(event.lat!, event.lon!);
        emit(WeatherSuccess(listEntity: listData));
      } on DioError catch (error) {
        emit(WeatherError(messageError: error.message));
      }
    });
  }
}
