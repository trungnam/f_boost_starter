
class SearchAdviceResponse {
  String _totalResults;
  String _query;
  List<Slip> _slips;

  SearchAdviceResponse({String totalResults, String query, List<Slip> slips}) {
    this._totalResults = totalResults;
    this._query = query;
    this._slips = slips;
  }

  // ignore: unnecessary_getters_setters
  String get totalResults => _totalResults;
  // ignore: unnecessary_getters_setters
  set totalResults(String totalResults) => _totalResults = totalResults;
  String get query => _query;
  // ignore: unnecessary_getters_setters
  set query(String query) => _query = query;
  // ignore: unnecessary_getters_setters
  List<Slip> get slips => _slips;
  // ignore: unnecessary_getters_setters
  set slips(List<Slip> slips) => _slips = slips;

  SearchAdviceResponse.fromJson(Map<String, dynamic> json) {
    _totalResults = json['total_results'];
    _query = json['query'];
    if (json['slips'] != null) {
      // ignore: deprecated_member_use
      _slips = new List<Slip>();
      json['slips'].forEach((v) {
        _slips.add(new Slip.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_results'] = this._totalResults;
    data['query'] = this._query;
    if (this._slips != null) {
      data['slips'] = this._slips.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


class AdviceResponse {
  Slip slip;

  AdviceResponse({this.slip});

  AdviceResponse.fromJson(Map<String, dynamic> json) {
    slip = json['slip'] != null ? new Slip.fromJson(json['slip']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.slip != null) {
      data['slip'] = this.slip.toJson();
    }
    return data;
  }
}

class Slip {
  int id;
  String advice;

  Slip({this.id, this.advice});

  Slip.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    advice = json['advice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['advice'] = this.advice;
    return data;
  }
}