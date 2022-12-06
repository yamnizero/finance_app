import 'package:finance_app/data/model/add_date.dart';
import 'package:finance_app/data/model/utlity.dart';
import 'package:finance_app/data/top.dart';
import 'package:flutter/material.dart';
import '../widget/chart.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Statistics extends StatefulWidget {
  const Statistics({Key? key}) : super(key: key);

  @override
  _StatisticsState createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  List day = ['Day', 'Week', 'Month', 'Year'];
  List f = [today(), week(), month(), year()];
  List<Add_data> a = [];
  int selected = 0;
  ValueNotifier bb = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: bb ,
          builder: (context,dynamic value, child) {
            a = f[value];
            return buildCustomScrollView();
          }),
        ),
      );
  }

  CustomScrollView buildCustomScrollView() {
    return CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Statistics",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ...List.generate(
                        4,
                        (index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selected = index;
                                bb.value = index;
                              });
                            },
                            child: Container(
                              height: 40,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: selected == index
                                    ? const Color.fromARGB(255, 47, 125, 121)
                                    : Colors.white,
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                day[index],
                                style: TextStyle(
                                  color: selected == index
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: 40,
                        width: 120,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                             Text(
                              'Expense',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(
                              Icons.arrow_downward_sharp,
                              color: Colors.grey,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20,),
                 Chart(indexx: selected,),
                const SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                        Text('Top Spending',style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold
                        ),),
                      Icon(Icons.swap_vert,size: 25,color: Colors.grey,)
                    ],
                  ),
                )
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((context,index){
            return ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.asset(
                  'assets/images/${a[index].name!}.png',
                  height: 40,
                ),
              ),
              title: Text(
                a[index].name,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                ),
              ),
              subtitle: Text(
                '${day[a[index].datetime.weekday - 1]}  ${a[index].datetime.year}-${a[index].datetime.day}-${a[index].datetime.month}',
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              trailing: Text(
                a[index].amount,
                style:  TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 19,
                    color: a[index].IN == 'Income' ? Colors.green : Colors.red
                ),
              ),
            );
          },
            childCount: a.length,
          ),
          ),
        ],
      );
  }
}
