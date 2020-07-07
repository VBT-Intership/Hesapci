import 'dart:io';
enum Processes{
  add,
  substract,
  multiply,
  divide,
  exit
}
class Processor{
  String getProcessName(Processes process){
    switch(process){
      case Processes.add: 
        return "Toplama";
      case Processes.substract: 
        return "Çıkarma";
        case Processes.multiply: 
        return "Çarpma";
        case Processes.divide: 
        return "Bölme";
      default:
        return "";
    }
  }
  double transaction(Processes process, double nOne, double nTwo){
    switch(process){
      case Processes.add:{
        return nOne + nTwo;
      }
      break;
      case Processes.substract:{
        return nOne-nTwo;
      }
      break;
      case Processes.multiply:{
        return nOne*nTwo;
      }
      break;
      case Processes.divide:{
        if(nTwo != 0) return nOne/nTwo;
        else return 0;
      }
      break;
      case Processes.exit:{
        exit(0);
      }
      break;
    }
  }
}