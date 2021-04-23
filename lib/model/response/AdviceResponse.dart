
class SearchAdviceResponse {
  String query;
  List<Slip> slips;
  String totalResults;

  SearchAdviceResponse.fromJSON(Map<String, dynamic> parsedJson) {
    this.query = parsedJson['query'];
    this.slips = parsedJson['slips'];
    this.totalResults = parsedJson['total_results'];
  }
}


class AdviceResponse {
  Slip slip;

  AdviceResponse.fromJSON(Map<String, dynamic> parsedJson) {
    this.slip = parsedJson['slip'];
  }
}


class Slip {
  String advice;
  int id;

  Slip.fromJSON(Map<String, dynamic> parsedJson) {
    this.advice = parsedJson['advice'];
    this.id = parsedJson['id'];
  }
}