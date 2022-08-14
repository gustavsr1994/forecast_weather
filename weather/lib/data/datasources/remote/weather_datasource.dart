import 'package:dio/dio.dart';
import 'package:weather/data/models/weather_model.dart';
import 'package:weather/presentation/components/string_constant.dart';

abstract class WeatherDatasource {
  Future<WeatherModel> listWeather(double lat, double longi);
}

class WeatherDataApi extends WeatherDatasource {
  @override
  Future<WeatherModel> listWeather(double lat, double longi) async {
    Dio dio = Dio();
    var url = baseApi + 'lat=$lat&lon=$longi&appid=$apiKey';
    Response response = await dio.get(url);
    return WeatherModel.fromJson(response.data as Map<String, dynamic>);
  }
}
