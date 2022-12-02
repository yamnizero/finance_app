import 'package:finance_app/data/moneyModel.dart';
List<MoneyModel> geter_top(){
  MoneyModel snap_food = MoneyModel();
  snap_food.name = 'macdonald';
  snap_food.fee = '-\$ 100';
  snap_food.time = 'jan 30,2022';
  snap_food.image = 'macdonald.png';
  snap_food.buy = true;

  MoneyModel snap = MoneyModel();
  snap.name = 'Transfer';
  snap.fee = '- \$ 60';
  snap.time = 'today';
  snap.image = 'Transfer.png';
  snap.buy = true;


  return [snap_food,snap] ;
}