import 'package:flutter/material.dart';

import '../../../controller/data.dart';
import '../../../models/newsModel.dart';

class Newsprovider extends ChangeNotifier {
  List<NewsModel> list = [];
  bool isloading = false;
  String Error = "no";

  getnewsaData() async {
    isloading = true;
    notifyListeners();

    final response = await getnews();
    if (response == "something went wrong") {
      Error = "yes";
      notifyListeners();
    } else {
      List<NewsModel> responses = response as List<NewsModel>;

      print(responses.length);
      isloading = false;
      list = response;
      Error = "no";
      notifyListeners();
    }
  }
}
