import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:weather/domain/entities/weather_entity.dart';
import 'package:weather/presentation/components/date_formatter.dart';
import 'package:weather/presentation/controllers/weather/weather_bloc.dart';
import 'package:weather/presentation/pages/detail_page.dart';
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
          style: textLargeColor(boldCondition: true, color: colorTextWhite),
        ),
      ),
      body: BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
        if (state is WeatherSuccess) {
          return listWeather(state.listEntity!);
        } else if (state is WeatherError) {
          return Center(
            child: Text(state.messageError),
          );
        } else if (state is WaitingLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return const SizedBox(
            height: 0,
          );
        }
      }),
    );
  }

  Widget listWeather(List<WeatherEntity> dataEntity) {
    return ListView.builder(
        itemCount: dataEntity.length,
        itemBuilder: (context, index) => Card(
              elevation: 3,
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  leading: Image.network(dataEntity[index].iconWeather!),
                  onTap: () => Get.to(DetailPage(
                    weatherEntity: dataEntity[index],
                  )),
                  trailing: const Icon(Icons.arrow_forward_ios_rounded),
                  title: Text(
                    DateFormatter.formatTitle(
                        dataEntity[index].dateTimeWeather!),
                    style: textMediumColor(
                        boldCondition: true, color: colorTextBlack),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 2),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 3),
                        child: Text(
                          dataEntity[index].titleWeather!,
                          style: textMediumColor(
                              boldCondition: false, color: colorTextBlack),
                        ),
                      ),
                      Text(
                        "Temp : ${dataEntity[index].temp}°C",
                        style: textMediumColor(
                            boldCondition: false, color: colorTextBlack),
                      )
                    ],
                  ),
                ),
              ),
            ));
  }
}
