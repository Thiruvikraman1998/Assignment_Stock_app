class SearchResults {
  List<BestMatches>? bestMatches;

  SearchResults({this.bestMatches});

  SearchResults.fromJson(Map<String, dynamic> json) {
    if (json['bestMatches'] != null) {
      bestMatches = <BestMatches>[];
      json['bestMatches'].forEach((value) {
        bestMatches!.add(BestMatches.fromJson(value));
      });
    }
  }
}

class BestMatches {
  String? symbol;
  String? name;
  String? region;
  String? currency;

  BestMatches(this.symbol, this.name, this.region, this.currency);

  BestMatches.fromJson(Map<String, dynamic> json) {
    symbol = json['1. symbol'];
    name = json['2. name'];
    region = json['4. region'];
    currency = json['8. currency'];
  }
}
