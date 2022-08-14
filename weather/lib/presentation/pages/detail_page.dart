import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:weather/domain/entities/weather_entity.dart';
import 'package:weather/presentation/components/date_formatter.dart';
import 'package:weather/presentation/themes/color_palletes.dart';
import 'package:weather/presentation/themes/text_style.dart';

class DetailPage extends StatefulWidget {
  final WeatherEntity? weatherEntity;
  // ignore: use_key_in_widget_constructors
  const DetailPage({this.weatherEntity});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Weather Details",
          style: textLargeColor(boldCondition: true, color: colorTextWhite),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              DateFormatter.formatTitleComplete(
                  widget.weatherEntity!.dateTimeWeather!),
              style: textVeryLargeColor(boldCondition: true),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${widget.weatherEntity!.temp}°C',
                  style: textVeryXtraLargeColor(boldCondition: false),
                ),
                CachedNetworkImage(
                  imageUrl: widget.weatherEntity!.iconWeather!,
                  height: 120,
                  width: 120,
                  fit: BoxFit.fill,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              widget.weatherEntity!.titleWeather! +
                  " (${widget.weatherEntity!.descWeather})",
              style: textLargeColor(boldCondition: true),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Temp (min)',
                      style: textMediumColor(boldCondition: false),
                    ),
                    Text(
                      '${widget.weatherEntity!.tempMin}°C',
                      style: textMediumColor(boldCondition: true),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Temp (max)',
                      style: textMediumColor(boldCondition: false),
                    ),
                    Text(
                      '${widget.weatherEntity!.tempMax}°C',
                      style: textMediumColor(boldCondition: true),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
