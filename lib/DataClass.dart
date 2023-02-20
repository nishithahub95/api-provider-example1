

import 'package:api_provider/data_model.dart';
import 'package:api_provider/service.dart';
import 'package:flutter/cupertino.dart';

class DataClass extends ChangeNotifier{
  DataModel? post;
  bool loading=false;

  getPostData()async{
    loading=true;

    post=(await getSinglePostData())!;
    loading=false;
    notifyListeners();

  }
}