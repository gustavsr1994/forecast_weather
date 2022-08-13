class WeatherEntity {
  String? dateTimeWeather;
  String? titleWeather;
  String? descWeather;
  num? temp;
  num? tempMin;
  num? tempMax;
  String? iconWeather;
  WeatherEntity(
      {this.dateTimeWeather,
      this.titleWeather,
      this.descWeather,
      this.temp,
      this.tempMax,
      this.tempMin,
      this.iconWeather});
}
