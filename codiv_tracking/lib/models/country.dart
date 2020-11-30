class CountryModel {
  String _country;
  int _cases;
  int _confirmed;
  int _deaths;
  int _recovered;

  CountryModel(
    this._country,
    this._cases,
    this._confirmed,
    this._deaths,
    this._recovered,
  );

  get country => this._country;
  get cases => this._cases;
  get confirmed => this._confirmed;
  get deaths => this._deaths;
  get recovered => this._recovered;

  factory CountryModel.fromJson(Map<String, dynamic> map) {
    return CountryModel(
      map['country'],
      map['cases'],
      map['confirmed'],
      map['deaths'],
      map['recovered'],
    );
  }
}
