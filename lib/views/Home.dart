import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:personal_meeting_prompta/controllers/data_controller.dart';
import 'package:personal_meeting_prompta/views/Add.dart';
import 'package:personal_meeting_prompta/widgets/custom_button.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final dataCtrlr = DataController.to;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    final DateFormat formatter = DateFormat('dd-MM-yyyy');
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: height,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    right: 24.0, bottom: 0, left: 24.0, top: 50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Personal Meeting Prompta',
                      style: TextStyle(fontSize: 23.0),
                    ),
                    Icon(
                      Icons.meeting_room,
                      size: 32.0,
                    )
                  ],
                ),
              ),
              Container(
                height: height * 0.8,
                padding: const EdgeInsets.all(20.0),
                child: Obx(() => Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(children: [
                            const Text(
                              'Meeting',
                              style: TextStyle(fontSize: 18.0),
                            ),
                            const SizedBox(
                              height: 12.0,
                            ),
                            Text(dataCtrlr.meeting.value == ''
                                ? 'N/A'
                                : dataCtrlr.meeting.value)
                          ]),
                          Column(children: [
                            const Text(
                              'Calendar for each year',
                              style: TextStyle(fontSize: 18.0),
                            ),
                            const SizedBox(
                              height: 12.0,
                            ),
                            dataCtrlr.date.value == ''
                                ? const Text('N/A')
                                : Text(formatter.format(
                                    DateTime.parse(dataCtrlr.date.value)))
                          ]),
                          Column(children: [
                            const Text(
                              'Points',
                              style: TextStyle(fontSize: 18.0),
                            ),
                            const SizedBox(
                              height: 12.0,
                            ),
                            Text(dataCtrlr.points.value == ''
                                ? 'N/A'
                                : dataCtrlr.points.value)
                          ]),
                          CustomButton(
                              label: 'Edit',
                              filled: false,
                              width: width * 0.1,
                              onPressed: () => Get.to(Add())),
                        ])),
              )
            ],
          ),
        ),
      ),
    );
  }
}
