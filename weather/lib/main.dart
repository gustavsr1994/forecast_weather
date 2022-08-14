import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:weather/data/datasources/remote/weather_datasource.dart';
import 'package:weather/data/repositories/weather_repository_impl.dart';
import 'package:weather/domain/usecases/weather_usecase.dart';
import 'package:weather/presentation/controllers/weather/weather_bloc.dart';
import 'package:weather/presentation/pages/list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherBloc(
          weatherUsecase: WeatherUsecaseImpl(
              repository: WeatherRepositoryImpl(dataApi: WeatherDataApi()))),
      child: const GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: ListPage(),
      ),
    );
  }
}
