class StockData {
  MetaData metaData;
  Map<String, TimeSeriesData> timeSeries;

  StockData({required this.metaData, required this.timeSeries});

  factory StockData.fromJson(Map<String, dynamic> json) {
    return StockData(
      metaData: MetaData.fromJson(json['Meta Data']),
      timeSeries: _parseTimeSeries(json['Time Series (15min)']),
    );
  }

  static Map<String, TimeSeriesData> _parseTimeSeries(
      Map<String, dynamic> json) {
    final timeSeriesData = <String, TimeSeriesData>{};
    json.forEach((key, value) {
      timeSeriesData[key] = TimeSeriesData.fromJson(value);
    });
    return timeSeriesData;
  }
}

class MetaData {
  String information;
  String symbol;
  String lastRefreshed;
  String interval;
  String outputSize;
  String timeZone;

  MetaData({
    required this.information,
    required this.symbol,
    required this.lastRefreshed,
    required this.interval,
    required this.outputSize,
    required this.timeZone,
  });

  factory MetaData.fromJson(Map<String, dynamic> json) {
    return MetaData(
      information: json['1. Information'],
      symbol: json['2. Symbol'],
      lastRefreshed: json['3. Last Refreshed'],
      interval: json['4. Interval'],
      outputSize: json['5. Output Size'],
      timeZone: json['6. Time Zone'],
    );
  }
}

class TimeSeriesData {
  double open;
  double high;
  double low;
  double close;
  int volume;

  TimeSeriesData({
    required this.open,
    required this.high,
    required this.low,
    required this.close,
    required this.volume,
  });

  factory TimeSeriesData.fromJson(Map<String, dynamic> json) {
    return TimeSeriesData(
      open: double.parse(json['1. open']),
      high: double.parse(json['2. high']),
      low: double.parse(json['3. low']),
      close: double.parse(json['4. close']),
      volume: int.parse(json['5. volume']),
    );
  }
}
