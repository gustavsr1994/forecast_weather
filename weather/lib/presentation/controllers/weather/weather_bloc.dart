import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather/data/datasources/remote/weather_datasource.dart';
import 'package:weather/domain/entities/weather_entity.dart';
import 'package:weather/domain/usecases/weather_usecase.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<LoadWeatherEvent>((event, emit) async {
      var repository = WeatherUsecaseImpl(dataApi: WeatherDataApi());
      var listData = await repository.listWeather(event.lat!, event.lon!);
      emit(WeatherSuccess(listEntity: listData));
    });
  }
}
