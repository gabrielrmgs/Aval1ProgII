import 'genotype.dart';

class Individual{
  late final Genotype _genotype;
  final genotipo;
  var _name;
  static int indivNum = 0;

  Individual(this.genotipo, [this._name = "Indiv"]){
    _genotype = Genotype(genotipo);
    _name = namegenerator();
  }

  Genotype get genotype{
    return _genotype;
  }

  String get name {
    return _name;
  }
  
  String namegenerator(){
    if(name == "Indiv"){
    return '${name}${++indivNum}';
    }else {return name;}
  }

  @override
  String toString() {
    return '$name'+'(${genotype.bloodType})';
  }
}
