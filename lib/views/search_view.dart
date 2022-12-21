import 'package:flutter/material.dart';
import 'package:midterm/utils/helpers.dart';
import 'package:intl/intl.dart';

import '../model/search.dart';
import '../utils/dialogs/search_confirm_dialog.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final FilterCheckBoxList fileterCheckBoxList = FilterCheckBoxList();

  bool isPanelExpanded = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final DateTime dateTime = SearchAPI().selectedDate;

    return Scaffold(
      appBar: AppBar(title: const Text('Search')),
      body: ListView(
        children: [
          ExpansionPanelList(
            expansionCallback: (panelIndex, isExpanded) {
              setState(() {
                isPanelExpanded = !isExpanded;
              });
            },
            children: [
              ExpansionPanel(
                isExpanded: isPanelExpanded,
                headerBuilder: (context, isExpanded) {
                  return Row(
                    children: [
                      addHorizontalSpace(20),
                      const Text(
                        'Filter',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      addHorizontalSpace(width / 4),
                      const Flexible(
                        child: Text(
                          'select filter',
                          maxLines: 1,
                        ),
                      ),
                    ],
                  );
                },
                body: SingleChildScrollView(
                  child: Column(
                    children: fileterCheckBoxList.filterCheckBoxList
                        .map((e) => ListTile(
                              leading: Checkbox(
                                value: e.isChecked,
                                onChanged: (value) {
                                  setState(() {
                                    e.isChecked = value ?? false;
                                  });
                                },
                              ),
                              title: Text(SearchAPI()
                                  .getFilterOptionName(e.filterOption)),
                            ))
                        .toList(),
                  ),
                ),
              )
            ],
          ),
          addVerticalSpace(60),
          Row(
            children: [
              addHorizontalSpace(20),
              const Text(
                'Date',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ],
          ),
          addVerticalSpace(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.calendar_month),
                      Text("check-in"),
                    ],
                  ),
                  addVerticalSpace(5),
                  Text(DateFormat('yyyy.MM.dd (E)').format(dateTime)),
                  Text(DateFormat('kk:mm a').format(dateTime)),
                ],
              ),
              SizedBox(
                width: width / 3,
                child: ElevatedButton(
                  onPressed: () async {
                    await Navigator.of(context)
                        .push(DialogRoute<DateTime>(
                      context: context,
                      builder: (BuildContext context) {
                        return DatePickerDialog(
                          initialEntryMode: DatePickerEntryMode.calendarOnly,
                          initialDate: dateTime,
                          firstDate: DateTime(2021),
                          lastDate:
                              DateTime.now().add(const Duration(days: 365)),
                        );
                      },
                    ))
                        .then(
                      (value) {
                        setState(() {
                          SearchAPI().setSelectedDate(value ?? dateTime);
                        });
                      },
                    );
                  },
                  child: const Text('select date'),
                ),
              )
            ],
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        height: width / 3 * 0.4 > 60 ? 60 : width / 3 * 0.4,
        width: width / 3 > 300 ? 300 : width / 3,
        child: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          onPressed: () async {
            final state = ScaffoldMessenger.of(context);
            final shouldSearch = await showSearchConfirmDialog(context);
            if (shouldSearch) {
              state.showSnackBar(const SnackBar(
                content: Text('Searching...'),
                duration: Duration(seconds: 5),
              ));
            }
          },
          child: const Text('Search'),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

