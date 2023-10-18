import 'genotype.dart';

class Individual{
  late final Genotype _genotype;
  final genotipo;
  late final _name;
  int indivNum = 0;

  Individual(this.genotipo, [this._name = 'Indiv']){
    _genotype = Genotype(genotipo);
  }

  Genotype get genotype{
    return _genotype;
  }

  String get name {
    return _name;
  }

  String namegenerator(){
    indivNum++;
    return '${name}($indivNum)';
  }

  @override
  String toString() {
    return '$name'+'${genotype.bloodType}';
  }
}
