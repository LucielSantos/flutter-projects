class StateDetailModel {
  int _cases;
  int _suspects;
  int _deaths;
  int _refuses;

  StateDetailModel(
    this._cases,
    this._suspects,
    this._deaths,
    this._refuses,
  );

  get cases => this._cases;
  get suspects => this._suspects;
  get deaths => this._deaths;
  get refuses => this._refuses;

  factory StateDetailModel.fromJson(Map<String, dynamic> map) {
    return StateDetailModel(
      map['cases'],
      map['suspects'],
      map['deaths'],
      map['refuses'],
    );
  }
}
