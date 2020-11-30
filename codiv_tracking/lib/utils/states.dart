class StateModel {
  String name;
  String uf;
  String slug;

  StateModel(this.uf, this.name, this.slug);
}

final List<StateModel> brazilStates = [
  StateModel("AC", "Acre", "ac"),
  StateModel("AL", "Alagoas", "al"),
  StateModel("AP", "Amapá", "ap"),
  StateModel("AM", "Amazonas", "am"),
  StateModel("BA", "Bahia", "ba"),
  StateModel("CE", "Ceará", "ce"),
  StateModel("DF", "Distrito Federal", "df"),
  StateModel("ES", "Espírito Santo", "es"),
  StateModel("GO", "Goiás", "go"),
  StateModel("MA", "Maranhão", "ma"),
  StateModel("MT", "Mato Grosso", "mt"),
  StateModel("MS", "Mato Grosso do Sul", "ms"),
  StateModel("MG", "Minas Gerais", "mg"),
  StateModel("PR", "Paraná", "pr"),
  StateModel("PB", "Paraíba", "pb"),
  StateModel("PA", "Pará", "pa"),
  StateModel("PE", "Pernambuco", "pe"),
  StateModel("PI", "Piauí", "pi"),
  StateModel("RN", "Rio Grande do Norte", "rn"),
  StateModel("RS", "Rio Grande do Sul", "rs"),
  StateModel("RJ", "Rio de Janeiro", "rj"),
  StateModel("RO", "Rondônia", "ro"),
  StateModel("RR", "Roraima", "rr"),
  StateModel("SC", "Santa Catarina", "sc"),
  StateModel("SE", "Sergipe", "se"),
  StateModel("SP", "São Paulo", "sp"),
  StateModel("TO", "Tocantins", "to"),
];
