const baseApi =
    "https://api.openweathermap.org/data/2.5/forecast?units=Metric&";

const apiKey = "c9478c5887469e3d219aa2dfe9e5aa6a";

String urlIcon(String? code) {
  return "http://openweathermap.org/img/wn/$code@2x.png";
}
