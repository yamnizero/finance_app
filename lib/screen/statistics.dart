import 'package:finance_app/data/top.dart';
import 'package:flutter/material.dart';
import '../widget/chart.dart';

class Statistics extends StatefulWidget {
  const Statistics({Key? key}) : super(key: key);

  @override
  _StatisticsState createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  List day = ['Day', 'Week', 'Month', 'Year'];
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
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
                  const Chart(),
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
                leading: Image.asset('assets/images/${geter_top()[index].image!}',height: 40,),
                title: Text(
                  geter_top()[index].name!,
                  style: const TextStyle(fontSize: 17,fontWeight: FontWeight.w700),
                ),
                subtitle: Text(
                  geter_top()[index].time!,
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
                trailing: Text(
                  geter_top()[index].fee!,
                  style: const TextStyle(fontSize: 17,color: Colors.red,fontWeight: FontWeight.bold),
                ),
              );
            },
              childCount: geter_top().length,
            ),
            ),
          ],
        ),
      ),
    );
  }
}
