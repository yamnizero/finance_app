import 'package:finance_app/data/moneyModel.dart';
List<MoneyModel> geter_top(){
  MoneyModel snapFood = MoneyModel();
  snapFood.name = 'macdonald';
  snapFood.fee = '-\$ 100';
  snapFood.time = 'jan 30,2022';
  snapFood.image = 'macdonald.png';
  snapFood.buy = true;

  MoneyModel snap = MoneyModel();
  snap.name = 'Transfer';
  snap.fee = '- \$ 60';
  snap.time = 'today';
  snap.image = 'Transfer.png';
  snap.buy = true;


  return [snapFood,snap] ;
}