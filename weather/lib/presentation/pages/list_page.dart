import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/domain/entities/weather_entity.dart';
import 'package:weather/presentation/controllers/weather/weather_bloc.dart';
import 'package:weather/presentation/themes/color_palletes.dart';
import 'package:weather/presentation/themes/text_style.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  void initState() {
    super.initState();
    context.read<WeatherBloc>().add(
        LoadWeatherEvent(lat: -6.175115064391812, lon: 106.82708842419382));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Weather App",
          style: textLargeColor(boldCondition: true, color: colorText),
        ),
      ),
      body: BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
        if (state is WeatherSuccess) {
          return listWeather(state.listEntity!);
        } else {
          return SizedBox(height: 0);
        }
      }),
    );
  }

  Widget listWeather(List<WeatherEntity> dataEntity) {
    return SingleChildScrollView(
      child: Column(
        children: [
          for (var items in dataEntity)
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Colors.grey[300]!, width: 2))),
              child: ListTile(
                leading: CachedNetworkImage(imageUrl: items.iconWeather!),
                title: Text(
                  items.dateTimeWeather!,
                  style:
                      textMediumColor(boldCondition: true, color: colorPrimary),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      items.titleWeather!,
                      style: textMediumColor(boldCondition: false),
                    ),
                    Text(
                      "Temp : ${items.temp}C",
                      style: textMediumColor(boldCondition: false),
                    )
                  ],
                ),
              ),
            )
        ],
      ),
    );
  }
}
