class DataModel {
  int activeCases;
  int activeCasesNew;
  int recovered;
  int recoveredNew;
  int deaths;
  int deathsNew;
  int previousDayTests;
  int totalCases;
  String sourceUrl;
  String lastUpdatedAtApify;
  String readMe;
  List<RegionData> regionData;

  DataModel(
      {this.activeCases,
      this.activeCasesNew,
      this.recovered,
      this.recoveredNew,
      this.deaths,
      this.deathsNew,
      this.previousDayTests,
      this.totalCases,
      this.sourceUrl,
      this.lastUpdatedAtApify,
      this.readMe,
      this.regionData});

  DataModel.fromJson(Map<String, dynamic> json) {
    activeCases = json['activeCases'];
    activeCasesNew = json['activeCasesNew'];
    recovered = json['recovered'];
    recoveredNew = json['recoveredNew'];
    deaths = json['deaths'];
    deathsNew = json['deathsNew'];
    previousDayTests = json['previousDayTests'];
    totalCases = json['totalCases'];
    sourceUrl = json['sourceUrl'];
    lastUpdatedAtApify = json['lastUpdatedAtApify'];
    readMe = json['readMe'];
    if (json['regionData'] != null) {
      regionData = new List<RegionData>();
      json['regionData'].forEach((v) {
        regionData.add(new RegionData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['activeCases'] = this.activeCases;
    data['activeCasesNew'] = this.activeCasesNew;
    data['recovered'] = this.recovered;
    data['recoveredNew'] = this.recoveredNew;
    data['deaths'] = this.deaths;
    data['deathsNew'] = this.deathsNew;
    data['previousDayTests'] = this.previousDayTests;
    data['totalCases'] = this.totalCases;
    data['sourceUrl'] = this.sourceUrl;
    data['lastUpdatedAtApify'] = this.lastUpdatedAtApify;
    data['readMe'] = this.readMe;
    if (this.regionData != null) {
      data['regionData'] = this.regionData.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RegionData {
  String region;
  int activeCases;
  int newInfected;
  int recovered;
  int newRecovered;
  int deceased;
  int newDeceased;
  int totalInfected;

  RegionData(
      {this.region,
      this.activeCases,
      this.newInfected,
      this.recovered,
      this.newRecovered,
      this.deceased,
      this.newDeceased,
      this.totalInfected});

  RegionData.fromJson(Map<String, dynamic> json) {
    region = json['region'];
    activeCases = json['activeCases'];
    newInfected = json['newInfected'];
    recovered = json['recovered'];
    newRecovered = json['newRecovered'];
    deceased = json['deceased'];
    newDeceased = json['newDeceased'];
    totalInfected = json['totalInfected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['region'] = this.region;
    data['activeCases'] = this.activeCases;
    data['newInfected'] = this.newInfected;
    data['recovered'] = this.recovered;
    data['newRecovered'] = this.newRecovered;
    data['deceased'] = this.deceased;
    data['newDeceased'] = this.newDeceased;
    data['totalInfected'] = this.totalInfected;
    return data;
  }
}
