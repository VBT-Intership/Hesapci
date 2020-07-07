import 'dart:io';
import 'processor.dart';
class Menu {
  Processor pr = new Processor();
  Menu(){
    while(true){
    stdin.echoMode = false;
    stdin.lineMode = false;
    try{
      Processes selectedProcess = selectProcess();
      List<double> numbers = getNumbers(selectedProcess);
      if(numbers.length < 2) throw Exception;
      print("\nHesapçı verdiğiniz bilgileri kontrol ediyor, tüm interneti tarayıp cevabınızı arıyor...\n");
      print("\x1B[32m"+pr.transaction(selectedProcess, numbers[0], numbers[1]).toString() + "\x1B[0m\n\n");
      sleep(Duration(seconds:1));
    }
    catch(e){
        if(e == IntegerDivisionByZeroException){
            print("\nHesapçı, verdiğiniz ikinci sayıyı beğenmedi. Tekrar deneyin...\n");
            sleep(Duration(seconds:1));
        }
      }
    }
  }
  Processes selectProcess(){
    print("Hesapçı'nın yapması için gereken işlemi seçiniz:\n1 - Toplama\n2 - Çıkartma\n3 - Çarpma\n4 - Bölme\n5 - Çıkış");
    var processIndex = (stdin.readByteSync())-49;
    if(Processes.values.elementAt(processIndex) == Processes.exit) exit(0);
    return Processes.values.elementAt(processIndex);
  }
  List<double> getNumbers(Processes process){
    stdin.lineMode = true;
    stdin.echoMode = true;
    print("Hesapçı, sizden "+ pr.getProcessName(process) + " işlemi için sizden 2 adet sayı talep etmekte.\nİlk sayınız:");
    try{
      double nOne = double.parse(stdin.readLineSync());
      print("\nHesapçı, sizden ikinci numarayı da talep etmekte.\nİkinci sayınız:");
      double nTwo = double.parse(stdin.readLineSync());
      if(process == Processes.divide && nTwo == 0) throw IntegerDivisionByZeroException;
      return [nOne,nTwo];
    }
    on FormatException{
      print("\nHesapçı sizin verdiğiniz sayıları beğenmedi.\n");
      sleep(Duration(seconds:1));
    }
  }
}