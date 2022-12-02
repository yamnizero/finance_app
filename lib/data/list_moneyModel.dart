import 'package:finance_app/data/moneyModel.dart';
List<MoneyModel> geter(){
  MoneyModel upwork = MoneyModel();
  upwork.name = 'upwork';
  upwork.fee = '650';
  upwork.time = 'today';
  upwork.image = 'up.png';
  upwork.buy = false;

  MoneyModel starbucks = MoneyModel();
  starbucks.buy =  true;
  starbucks.fee = '15';
  starbucks.image = 'starbucks.jpeg';
  starbucks.name = 'starbucks';
  starbucks.time = 'today';

  MoneyModel transfer = MoneyModel();
  transfer.buy =  true;
  transfer.fee = '100';
  transfer.image = 'Transfer.png';
  transfer.name = 'transfer for yamni';
  transfer.time = 'jan 30,2022';

  return [upwork,starbucks,transfer,upwork,starbucks,transfer] ;
}