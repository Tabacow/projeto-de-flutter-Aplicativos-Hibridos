
class PokeCardController {
  getType(pokeType1, pokeType2){
    if(pokeType2!="None")
      return pokeType1 + " " + pokeType2;
    else
      return pokeType1;
  }
}