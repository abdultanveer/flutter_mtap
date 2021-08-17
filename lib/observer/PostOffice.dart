import 'package:flutter_mtap/observer/Subject.dart';
import 'Passport.dart';

class PostOffice implements Subject{
  List<Passport>? allMail = [];
  List? observers = [];


  @override
  void Notify() {
    for (int i = 0; i < observers!.length; i++)
      observers!.elementAt(i).update(this);  }

  @override
  void register(Observer o) {
    observers!.add(o);
  }

  @override
  void unRegister(Observer o) {
    observers!.remove(o);
  }

   List<Passport>? getState()
  {
    return allMail;
  }

   void addMail(Passport m){
    allMail!.add(m);
    Notify();
  }
}