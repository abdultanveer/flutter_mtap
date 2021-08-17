import 'PostOffice.dart';
import 'Person.dart';
import 'Passport.dart';

void main(){
  PostOffice postoffice = new PostOffice();
  Person chris = new Person("Chris");
  Person john = new Person("John");
  Passport passport = new Passport("John", "johns address", "You've got a secret passport");
  //chris n john were bugging the post office
  /*chris.checkMail(null);
  john.checkMail(null);*/

  //post office was angry and asked them to leave[register] their ph nos
  postoffice.register(chris);
  postoffice.register(john);

  //postman going and informing john that he has a mail
  postoffice.addMail(passport);
}