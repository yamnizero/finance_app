import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 240,
                  decoration: const BoxDecoration(
                    color: Color(0xff368983),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 35,
                        left: 340,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(7),
                          child: Container(
                            height: 40,
                            width: 40,
                            color: const Color.fromRGBO(250, 250, 250, 0.1),
                            child: const Icon(
                              Icons.notification_add_outlined,
                              size: 30,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 35, left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              "Good afternoon",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Color.fromARGB(255, 224, 223, 223),
                              ),
                            ),
                            Text(
                              "Mohammed Gamal",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ///card
            Positioned(
              top: 140,
              left: 37,
              child: Container(
                height: 170,
                width: 320,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 47, 125, 121),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Total Balance",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          Icon(
                            Icons.more_horiz,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Row(
                        children: const [
                          Text(
                            "\$ 2,957",
                            style:  TextStyle(
                              fontWeight: FontWeight.bold, fontSize:25,
                              color: Colors.white,

                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: const [
                             CircleAvatar(
                               radius: 13,
                               backgroundColor: Color.fromARGB(255, 85, 145, 141),
                               child: Icon(Icons.arrow_downward,color: Colors.white,size: 19,),
                             ),
                              SizedBox(
                                width: 7,
                              ),
                              Text(
                                "Income",
                                style:  TextStyle(
                                  fontWeight: FontWeight.w500, fontSize:16  ,
                                  color: Color.fromARGB(255, 216, 216, 216),

                                ),
                              )
                            ],
                          ),
                          Row(
                            children: const [
                             CircleAvatar(
                               radius: 13,
                               backgroundColor: Color.fromARGB(255, 85, 145, 141),
                               child: Icon(Icons.arrow_upward,color: Colors.white,size: 19,),
                             ),
                              SizedBox(
                                width: 7,
                              ),
                              Text(
                                "Expenses",
                                style:  TextStyle(
                                  fontWeight: FontWeight.w500, fontSize:16  ,
                                  color: Color.fromARGB(255, 216, 216, 216),

                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "\$ 2.856",
                            style:  TextStyle(
                              fontWeight: FontWeight.w500, fontSize:17  ,
                              color: Colors.white,

                            ),
                          ),
                          Text(
                            "\$ 1.856",
                            style:  TextStyle(
                              fontWeight: FontWeight.w500, fontSize:17  ,
                              color: Colors.white,

                            ),
                          )
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
