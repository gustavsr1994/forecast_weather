import 'package:weather/data/datasources/remote/weather_datasource.dart';
import 'package:weather/domain/entities/weather_entity.dart';
import 'package:weather/domain/repositories/weather_repository.dart';
import 'package:weather/presentation/components/string_constant.dart';

class WeatherRepositoryImpl extends WeatherRepository {
  WeatherDataApi dataApi = WeatherDataApi();
  WeatherRepositoryImpl({required this.dataApi});

  @override
  Future<List<WeatherEntity>> listWeather(double lat, double lon) async {
    var data = await dataApi.listWeather(lat, lon);
    var result = <WeatherEntity>[];
    for (var items in data.list!) {
      WeatherEntity weatherEntity = WeatherEntity();
      weatherEntity.dateTimeWeather = items.dtTxt!;
      weatherEntity.temp = items.main!.temp;
      weatherEntity.tempMin = items.main!.tempMin;
      weatherEntity.tempMax = items.main!.tempMax;
      weatherEntity.titleWeather = items.weather![0].main!;
      weatherEntity.descWeather = items.weather![0].description!;
      weatherEntity.iconWeather = urlIcon(items.weather![0].icon);
      result.add(weatherEntity);
    }
    return result;
  }
}
