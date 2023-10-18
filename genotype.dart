

class Genotype{
  final _genotypes = {'AA':'A', 'Ai':'A', 'BB':'B', 'Bi':'B', 'AB':'AB', 'ii':'O'};
  final _genotype;
  Genotype(this._genotype){
    if (_genotypes.containsKey(_genotype) == false){
      throw 'Bad individual genotype: $_genotype';
    }
  }

  String get genotype{
    return _genotype;
  }

  String get bloodType{
    return _genotypes[_genotype]!;
  }

  List <String> get alleles{
    return genotype.split('').toList();
  }

  List <String> get agglutinogens{
    return genotype.split('').toList();
  }

  List <String> get agglutinins{

    List <String> lista1 = [];
    if (_genotypes[_genotype] == 'A') {
      lista1.add('B');
    }

    if (_genotypes[_genotype] == 'B') {
      lista1.add('A');
    }

    if (_genotypes[_genotype] == 'AB') {
      lista1.add('');
    }

    if (_genotypes[_genotype] == 'O') {
      lista1.add('A');
      lista1.add('B');
    }

    return lista1;
  }

  List <String> offsprings(Genotype g){
    List <String> listaFinal = [];
    var genotipo1 = genotype.split('');
    var genotipo2 = g.genotype.split('');
    var result1 = genotipo1[0] + genotipo2[0];
    var result2 = genotipo1[1] + genotipo2[1];

    if (result1 == result2){
      listaFinal.add(result1);
    } else {
      listaFinal.add(result1);
      listaFinal.add(result2);
    }

    return listaFinal;
  }

  bool compatible( g) {
    if (this == 'ii') {
      return true;
    } else if ((this == "AA" || this == "Ai") &&
      (g == "AA" || g == "AB" || g == "Ai")) {
    return true;
  } else if ((this == "BB" || this == "Bi") &&
      (g == "BB" || g == "AB" || g == "Bi")) {
    return true;
  } else if (this == "AB" && (g == "AB")) {
    return true;
  } else {
    return false;
      }
  }

  @override
  String toString(){
    return '$genotype';
  }

  
}
