import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mangmentv101/pages/manager/manfirstpage.dart';
import 'package:mangmentv101/pages/manager/manprojectinfo.dart';

class projectprovider extends ChangeNotifier {
  List<ProjectModelclass> projectlist = [];

  String? name;
  String? desc;

  int? teamleadid;
  final strdateCont = TextEditingController();
  final enddateCont = TextEditingController();

  bool get isValid =>
      name != null &&
      desc != null &&
      strdateCont.text.isNotEmpty &&
      strdateCont.text.isNotEmpty;

  setProjectName(String? value) {
    name = value;
    notifyListeners();
  }

  setDesc(String? value) {
    desc = value;
    notifyListeners();
  }

  setstrDate(DateTime? date) {
    if (date == null) {
      strdateCont.text = "";
      return;
    }

    DateTime currentDate = DateTime.now();
    DateTime now =
        DateTime(currentDate.year, currentDate.month, currentDate.day);

    int diff = date.difference(now).inDays;

    if (diff == 0) {
      strdateCont.text = "Today";
    } else if (diff == 1) {
      strdateCont.text = "Tommorrow";
    } else {
      strdateCont.text = "${date.day}-${date.month}-${date.year}";
    }

    notifyListeners();
  }

  setendDate(DateTime? date) {
    if (date == null) {
      enddateCont.text = '';
      return;
    }

    DateTime currentDate = DateTime.now();
    DateTime now =
        DateTime(currentDate.year, currentDate.month, currentDate.day);

    int diff = date.difference(now).inDays;

    if (diff == 0) {
      enddateCont.text = "Today";
    } else if (diff == 1) {
      enddateCont.text = "Tommorrow";
    } else {
      enddateCont.text = "${date.day}-${date.month}-${date.year}";
    }

    notifyListeners();
  }

  setTeamlead(int? value) {
    if (value == 101) {
      return;
    }
    teamleadid = value;
    notifyListeners();
  }

  addProject() {
    if (!isValid || strdateCont.text.isEmpty || enddateCont.text.isEmpty) {
      return;
    }

    final task = ProjectModelclass(
        name!, strdateCont.text, enddateCont.text, desc!, teamleadid!);

    projectlist.add(task);
    strdateCont.clear();
    enddateCont.clear();
    log(projectlist.length);

    notifyListeners();
  }

  updateProject(int index, String updatename, String updatestrdate,
      String updateenddate, String updatedesc, int updateteamleadid) {
    if (index < 0 || index >= projectlist.length) {
      log(101);
      return;
    }

    final Project = projectlist[index];
    Project.name = updatename;
    Project.strdate = updatestrdate;
    Project.enddate = updateenddate;
    Project.teamleadid = updateteamleadid;
    Project.desc = updatedesc;

    notifyListeners();
  }

  deleteTask(int index) {
    if (index < 0 || index >= projectlist.length) {
      //og('Invalid task index' as num);
      return;
    }

    projectlist.removeAt(index);
    log('$index ' as num);

    notifyListeners();
  }
}
