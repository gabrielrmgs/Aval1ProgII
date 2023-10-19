
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
    return genotype.split('').toSet().toList();
  }

  List <String> get agglutinogens{
    List <String> lista1 = [];
    if (_genotypes[_genotype] == 'A') {
      lista1.add('A');
    }
    if (_genotypes[_genotype] == 'B') {
      lista1.add('B');
    }
    if (_genotypes[_genotype] == 'AB') {
      lista1.add('A');
      lista1.add('B');
    }
    if (_genotypes[_genotype] == 'O') {
      lista1.add('');
    }
    return lista1;
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
    List <String> possibilities = [];
    List <String> genotipo1 = genotype.split('');
    List <String> genotipo2 = g.genotype.split('');
    possibilities.add (genotipo1[0] + genotipo2[0]);
    possibilities.add (genotipo1[1] + genotipo2[1]);
    possibilities.add (genotipo1[1] + genotipo2[0]);
    possibilities.add (genotipo1[0] + genotipo2[1]);
    for (var i = 0;  i < possibilities.length; i++){
      if (possibilities[i] == "iA"){possibilities[i] = "Ai";}
      else if (possibilities[i] == "iB"){possibilities[i] = "Bi";}
      else if (possibilities[i] == "BA"){possibilities[i] = "AB";}
    }
    possibilities.sort();
    return possibilities.toSet().toList();
  }

  bool compatible(Genotype g) {
    if (genotype == 'ii') {
      return true;
    } else if ((genotype == "AA" || genotype == "Ai") &&
      (g.genotype == "AA" || g.genotype == "AB" || g.genotype == "Ai")) {
    return true;
  } else if ((genotype == "BB" || genotype == "Bi") &&
      (g.genotype == "BB" || g.genotype == "AB" || g.genotype == "Bi")) {
    return true;
  } else if (genotype == "AB" && (g.genotype == "AB")) {
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
