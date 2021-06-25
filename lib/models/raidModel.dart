class Raid {
  int? id;
  int? hostFC;
  Pokemon? pokemon;

  Raid(
      {this.id,
      this.hostFC,
      this.pokemon});

  Raid.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    hostFC = json['hostFC'];
    pokemon =
        json['pokemon'] != null ? new Pokemon.fromJson(json['pokemon']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['hostFC'] = this.hostFC;
    if (this.pokemon != null) {
      data['pokemon'] = this.pokemon!.toJson();
    }
    return data;
  }
}

class Pokemon {
  int? number;
  String? name;

  Pokemon({required this.number, required this.name});

  Pokemon.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['number'] = this.number;
    data['name'] = this.name;
    return data;
  }
}