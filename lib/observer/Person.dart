import 'package:flutter_mtap/observer/Subject.dart';
import 'PostOffice.dart';
import 'Passport.dart';

class Person implements Observer{
  String? name;

   Person(String name)
  {
    this.name = name;
  }


  @override
  void update(Object obj) {
    if (obj is PostOffice){
      PostOffice po =  obj;
      List<Passport>? passports = po.getState();
      checkMail(passports!);
    }
  }

   void checkMail(List<Passport> m)
  {
    if(m!= null) {
      for ( int i =0; i < m.length; i++)
      {
        String? name = m.elementAt(i).receiverName;
        if(name?.compareTo(name) == 0)
          print('$name $m.elementAt(i).content');
      }
    }
    else {
      print('$name no mail yet');
    }
  }


}