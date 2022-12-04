import 'package:finance_app/screen/addScreen.dart';
import 'package:finance_app/screen/home.dart';
import 'package:finance_app/screen/statistics.dart';
import 'package:flutter/material.dart';

class BottomNAv extends StatefulWidget {
  const BottomNAv({Key? key}) : super(key: key);

  @override
  _BottomNAvState createState() => _BottomNAvState();
}

class _BottomNAvState extends State<BottomNAv> {
  int selectedNav =0;
  List Screen = [const HomeScreen(),const Statistics(),const HomeScreen(),const Statistics(),];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Screen[selectedNav],
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const AddScreen()));
        },
        child:  Icon(Icons.add),
        backgroundColor: const Color(0xff368983),

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Padding(
          padding: const EdgeInsets.only(top: 7.5,bottom: 7.5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children:  [
              GestureDetector(
                onTap: (){
                  setState(() {
                    selectedNav = 0;
                  });
                },
                  child:  Icon(Icons.home,size: 30,
                    color: selectedNav == 0 ?  const Color(0xff368983): Colors.grey ,
                  ),
              ),
              GestureDetector(
                onTap: (){
                  setState(() {
                    selectedNav = 1;
                  });
                },
                  child:  Icon(Icons.bar_chart_outlined,size: 30,
                      color: selectedNav == 1 ?  const Color(0xff368983): Colors.grey   ,)),
              const SizedBox(width: 20,),
              GestureDetector(
                onTap: (){
                  setState(() {
                    selectedNav = 2;
                  });
                },
                  child:  Icon(Icons.account_balance_wallet_outlined,size: 30,
                    color: selectedNav == 2 ?  const Color(0xff368983):Colors.grey  ,)),
              GestureDetector(
                onTap: (){
                  setState(() {
                    selectedNav = 3;
                  });
                },
                  child:  Icon(Icons.person_outlined,size: 30,
                    color: selectedNav == 3 ?  const Color(0xff368983): Colors.grey  ,)),
            ],
          ),
        ),
      ),
    );
  }
}
