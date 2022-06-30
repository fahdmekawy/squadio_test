import 'package:flutter/material.dart';
import 'package:squadio_test/widgets/appbar.dart';

import '../models/demo_model.dart';

class PeopleScreen extends StatefulWidget {
  static String routeName = '/people';

  const PeopleScreen({Key? key}) : super(key: key);

  @override
  State<PeopleScreen> createState() => _PeopleScreenState();
}

class _PeopleScreenState extends State<PeopleScreen> {
  List<DemoModel> user = [
    DemoModel('Fahd', false),
    DemoModel('Fahd', false),
    DemoModel('Fahd', false),
    DemoModel('Fahd', false),
    DemoModel('Fahd', false),
    DemoModel('Fahd', false),
    DemoModel('Fahd', false),
    DemoModel('Fahd', false),
    DemoModel('Fahd', false),
    DemoModel('Fahd', false),
    DemoModel('Fahd', false),
    DemoModel('Fahd', false),
    DemoModel('Fahd', false),
    DemoModel('Fahd', false),
    DemoModel('Fahd', false),
    DemoModel('Fahd', false),
    DemoModel('Fahd', false),
    DemoModel('Fahd', false),
    DemoModel('Fahd', false),
    DemoModel('Fahd', false),
  ];

  List<DemoModel>? selectedList=[];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar('People', false),
      body: SafeArea(
        child: Column(
          children: [
            selectedList==0 ?Expanded(
              flex: 1,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: selectedList?.length??0,
                  itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Container(
                          width: 100,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(color: Colors.grey)),
                          child: Center(
                              child: Text(selectedList?[index].name ?? '')),
                        ),
                      )),
            ):SizedBox(),
            Expanded(
              flex: 5,
              child: ListView.builder(
                itemCount: user.length,
                itemBuilder: (context, index) => ListTile(
                  onTap: () {
                    setState(() {
                      user[index].isSelected = !user[index].isSelected;
                      if (user[index].isSelected == true) {
                        selectedList?.add(DemoModel(
                            user[index].name, user[index].isSelected));
                      } else if (user[index].isSelected == false) {
                        selectedList?.removeWhere((element) =>
                            element.user[index].name == user[index].name);
                      }
                    });
                  },
                  leading: CircleAvatar(
                    backgroundColor: Colors.green[700],
                    child: const Icon(Icons.person_outline_outlined),
                  ),
                  title: Text(
                    user[index].name ?? '',
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  trailing: user[index].isSelected
                      ? Icon(
                          Icons.check_circle,
                          color: Colors.green[700],
                        )
                      : const Icon(
                          Icons.check_circle,
                          color: Colors.grey,
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
