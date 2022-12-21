import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../model/search.dart';
import '../buttons/elevatedbutton.dart';
import '../helpers.dart';

Future<bool> showSearchConfirmDialog(BuildContext context) {
  final width = MediaQuery.of(context).size.width;
  return showDialog<bool>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      titlePadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      insetPadding: EdgeInsets.zero,
      buttonPadding: EdgeInsets.zero,
      actionsPadding: EdgeInsets.zero,
      content: SizedBox(
        width: width / 2,
        height: width / 2 * 1.5,
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                width: width,
                color: Colors.blueAccent,
                child: Center(
                    child: SizedBox(
                        width: width / 4,
                        child: const Text(
                          'Please check your choice :)',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ))),
              ),
            ),
            Expanded(
                flex: 3,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.filter_alt,
                            color: Colors.blueAccent,
                          ),
                          addHorizontalSpace(20),
                          Flexible(
                              child: Text(
                            SearchAPI().checkedFilters() ?? "No filters",
                            style: const TextStyle(color: Colors.grey),
                          )),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.calendar_month,
                            color: Colors.blueAccent,
                          ),
                          addHorizontalSpace(20),
                          const Text("IN"),
                          addHorizontalSpace(20),
                          Flexible(
                              child: Text(
                            DateFormat('yyyy.MM.dd (E)')
                                .format(SearchAPI().selectedDate),
                            style: const TextStyle(color: Colors.grey),
                          )),
                        ],
                      ),
                    ],
                  ),
                )),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MyElevatedButton(
                    onPressed: () => Navigator.pop(context, true),
                    text: 'Search',
                    textColor: Colors.white,
                    buttonBackgroundColor: Colors.blueAccent,
                  ),
                  MyElevatedButton(
                    onPressed: () => Navigator.pop(context, false),
                    text: 'Cancel',
                    textColor: Colors.white,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  ).then((value) => value ?? false);
}
