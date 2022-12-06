import 'package:finance_app/data/model/add_date.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final box = Hive.box<Add_data>('data');
  DateTime date =  DateTime.now();
  String? selectedItem;
  String? selectedItemi;
  final TextEditingController explainController = TextEditingController() ;
  FocusNode ex =FocusNode();
  final TextEditingController amountController = TextEditingController() ;
  FocusNode amountFocus =FocusNode();
  final List<String> _item = [
    'food',
    "Transfer",
    "Transportation",
    "Education"
  ];

  final List<String> _itemi = [
    'Income',
    "Expand",
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ex.addListener(() {setState(() {});});
    amountFocus.addListener(() {setState(() {});});
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            backgroundContainer(context),
            Positioned(
              top: 120,
              child: mainContainer(),
            )
          ],
        ),
      ),
    );
  }

  Container mainContainer() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.white),
      height: 550,
      width: 340,
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          selectName(),
          const SizedBox(
            height: 30,
          ),
          explain(),
          const SizedBox(
            height: 30,
          ),
          amount(),
          const SizedBox(
            height: 30,
          ),
          how(),
          const SizedBox(
            height: 30,
          ),
          date_time(),
          const Spacer(),
          save(),

        ],
      ),
    );
  }

  GestureDetector save() {
    return GestureDetector (
          onTap: (){
            var add = Add_data(selectedItemi!, amountController.text, date, explainController.text, selectedItem!);
            box.add(add);
            Navigator.of(context).pop();
          },
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color(0xff368983),
            ),
            width: 120,
            height: 50,
            child: const Text(
              'Save',
              style: TextStyle(
                fontFamily: 'f',
                fontWeight: FontWeight.w600,
                color: Colors.white,
                fontSize: 17,
              ),
            ),
          ),
        );
  }



  Widget date_time() {
    return Container(
      alignment: Alignment.bottomLeft,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 2, color: const Color(0xffC5C5C5))),
      width: 300,
      child: TextButton(
        onPressed: () async {
          DateTime? newDate = await showDatePicker(
              context: context,
              initialDate: date,
              firstDate: DateTime(2020),
              lastDate: DateTime(2100));
          if (newDate == Null) return;
          setState(() {
            date = newDate!;
          });
        },
        child: Text(
          'Date : ${date.year} / ${date.day} / ${date.month}',
          style: const TextStyle(
            fontSize: 15,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
  Padding how() {
    return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            width: 300,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                width: 2,
                color: const Color(0xffc5c5c5),
              ),
            ),
            child: DropdownButton<String>(
              value: selectedItemi,
              items: _itemi
                  .map((e) => DropdownMenuItem(
                value: e,
                child:  Container(
                  alignment: Alignment.center,
                  child: Row(
                    children: [

                      Text(e,style: const TextStyle(fontSize: 18),)
                    ],
                  ),
                ),
              ))
                  .toList(),
              selectedItemBuilder: (BuildContext context) =>
                  _itemi.map((e) => Row(
                    children: [
                      Text(e),
                    ],
                  ),).toList(),

              hint: const Padding(
                padding: EdgeInsets.only(top: 12),
                child: Text('How',style: TextStyle(color: Colors.grey),),
              ),
              dropdownColor: Colors.white,
              isExpanded: true,
              underline: Container(),
              onChanged: ((val) {
                setState(() {
                  selectedItemi = val!;
                });
              }),
            ),
          ),
        );
  }

  Padding amount() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextField(
        controller: amountController,
        focusNode: amountFocus,
        keyboardType: TextInputType.number,
        decoration:  InputDecoration(
          contentPadding:  const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
          labelText: 'Amount',
          labelStyle: TextStyle(fontSize: 17,color: Colors.grey.shade500),
          enabledBorder:OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const  BorderSide(width: 2,color: Color(0xffc5c5c5)),
          ),
          focusedBorder:OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const  BorderSide(width: 2,color: Color(0xff368983)),
          ),
        ),
      ),
    );
  }

  Padding explain() {
    return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: TextField(
            controller: explainController,
            focusNode: ex,
            decoration:  InputDecoration(
              contentPadding:  const EdgeInsets.symmetric(horizontal: 15,vertical: 15),
              labelText: 'Explain',
              labelStyle: TextStyle(fontSize: 17,color: Colors.grey.shade500),
              enabledBorder:OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const  BorderSide(width: 2,color: Color(0xffc5c5c5)),
              ),
              focusedBorder:OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const  BorderSide(width: 2,color: Color(0xff368983)),
              ),
            ),
          ),
        );
  }

  Padding selectName() {
    return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            width: 300,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                width: 2,
                color: const Color(0xffc5c5c5),
              ),
            ),
            child: DropdownButton<String>(

              value: selectedItem,
              items: _item
                  .map((e) => DropdownMenuItem(
                alignment: Alignment.center,
                        value: e,
                        child:  Container(
                          child: Row(
                            children: [
                              SizedBox(
                                width: 40,
                                child: Image.asset('assets/images/$e.png'),
                              ),
                              const SizedBox(width: 10,),
                              Text(e,style: const TextStyle(fontSize: 18),)
                            ],
                          ),
                        ),
                      ))
                  .toList(),
                selectedItemBuilder: (BuildContext context) =>
                _item.map((e) => Row(
                  children: [
                   Container(
                     width: 42,
                     child: Image.asset('assets/images/$e.png'),
                   ),
                     const SizedBox(width: 5,),
                    Text(e),
                  ],
                ),).toList(),

              hint: const Padding(
                padding: EdgeInsets.only(top: 12),
                child: Text('Name',style: TextStyle(color: Colors.grey),),
              ),
              dropdownColor: Colors.white,
              isExpanded: true,
              underline: Container(),
              onChanged: ((val) {
                setState(() {
                  selectedItem = val!;
                });
              }),
            ),
          ),
        );
  }

  Column backgroundContainer(BuildContext context) {
    return Column(
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
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      "Adding",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    const Icon(
                      Icons.attach_file_outlined,
                      color: Colors.white,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
