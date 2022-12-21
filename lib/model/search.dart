import '../constant/enum.dart';

class SearchAPI{

  static final SearchAPI _singleton = SearchAPI._internal();
  factory SearchAPI() {
    return _singleton;
  }
  SearchAPI._internal();

  List<FilterCheckBox> _filterCheckedList = [];
  DateTime _selectedDate = DateTime.now();

  void fetch() {
    _filterCheckedList = FilterCheckBoxList().filterCheckBoxList.where((element) => element.isChecked).toList();
  }

  List<FilterCheckBox> checkedList(){
    fetch();
    return _filterCheckedList;
  }

  String? checkedFilters(){ 
    var list = checkedList();
    if(list.isEmpty) return null;
    return list.map((option) => getFilterOptionName(option.filterOption))
      .join(' / ');
  }
  

  String getFilterOptionName(FilterOption filterOption) {
    switch (filterOption) {
      case FilterOption.nokidszone:
        return 'No Kids Zone';
      case FilterOption.petfriendly:
        return 'Pet-Friendly';
      case FilterOption.freebreakfast:
        return 'Free Breakfast';
    }
  }

  void setSelectedDate(DateTime newDate){
    _selectedDate = newDate;
  }

  DateTime get selectedDate => _selectedDate;
}

class FilterCheckBox {
  bool isChecked;
  final FilterOption filterOption;

  FilterCheckBox({required this.filterOption, this.isChecked = false});
}

class FilterCheckBoxList {
  static final FilterCheckBoxList _singleton = FilterCheckBoxList._internal();
  factory FilterCheckBoxList() {
    return _singleton;
  }
  FilterCheckBoxList._internal();
  final List<FilterCheckBox> _filterCheckBoxList = [
    FilterCheckBox(filterOption: FilterOption.nokidszone),
    FilterCheckBox(filterOption: FilterOption.petfriendly),
    FilterCheckBox(filterOption: FilterOption.freebreakfast),
  ];

  List<FilterCheckBox> get filterCheckBoxList => _filterCheckBoxList;
}
