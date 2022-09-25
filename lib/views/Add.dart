import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:personal_meeting_prompta/controllers/data_controller.dart';
import 'package:personal_meeting_prompta/widgets/custom_button.dart';
import 'package:personal_meeting_prompta/widgets/custom_text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Add extends StatefulWidget {
  const Add({Key? key}) : super(key: key);

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  final dataCtrlr = DataController.to;

  DateTime date = DateTime.now();

  String _formatDate(DateTime d) {
    var day = d.day.toString().padLeft(2, "0");
    var month = d.month.toString().padLeft(2, "0");
    var year = d.year;
    return '$day/$month/$year';
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: date,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));

    if (picked != null) {
      setState(() {
        date = picked;
      });
    }
  }

  TextEditingController meetingController = TextEditingController();
  TextEditingController pointsController = TextEditingController();

  _handleCancel() {
    meetingController.text = '';
    pointsController.text = '';
    Get.back();
  }

  _handleSave() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('meeting', meetingController.text);
    prefs.setString('points', pointsController.text);
    prefs.setString('date', date.toString());

    dataCtrlr.meeting.value = meetingController.text;
    dataCtrlr.points.value = pointsController.text;
    dataCtrlr.date.value = date.toString();
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(title: const Text('Add Meeting Details')),
      body: SingleChildScrollView(
        child: SizedBox(
          height: height * 0.9,
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
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
                    const Text(
                      'Write a few words that best describes the meeting you are attending.',
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    CustomTextField(
                      label: 'Type Here...',
                      controller: meetingController,
                    )
                  ]),
                  Column(children: [
                    const Text(
                      'Calendar for each year',
                      style: TextStyle(fontSize: 18.0),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    const Text(
                      'Select/Highlight the date, month and year for the meeting.',
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    SizedBox(
                      width: 140.0,
                      child: InkWell(
                        onTap: () => _selectDate(context),
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(20.0)),
                          child: Text(
                            _formatDate(date),
                            style: const TextStyle(
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ),
                    )
                  ]),
                  Column(children: [
                    const Text(
                      'Points',
                      style: TextStyle(fontSize: 18.0),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    const Text(
                      'Write the things you want to discuss',
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    CustomTextField(
                      label: 'Type Here...',
                      lines: 3,
                      controller: pointsController,
                    )
                  ]),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButton(
                          label: 'Cancel',
                          filled: false,
                          width: width * 0.1,
                          onPressed: _handleCancel),
                      const SizedBox(
                        width: 12.0,
                      ),
                      CustomButton(
                          label: 'Save',
                          width: width * 0.1,
                          onPressed: _handleSave),
                    ],
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
