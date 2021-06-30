class Group {
  var id;
  var raidPokemon = new RaidPokemon();
  var hostFC;
  var guestFC1;
  var guestFC2;
  var guestFC3;


  Group(this.id, this.raidPokemon, this.hostFC, this.guestFC1, this.guestFC2, this.guestFC3);
//public PokemonDTO pokemon;
}

class RaidPokemon {
  var number;
  var name;
  var type1;
  var type2;
}