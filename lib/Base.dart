import 'package:flutter/material.dart';

abstract class BaseConnector {
  showLoading();

  showMassege(String massege);

  hideDialog();
}

class BaseViewModel<C extends BaseConnector> extends ChangeNotifier {
  C? connector;
}

abstract class BaseView<T extends StatefulWidget, Vm extends BaseViewModel>
    extends State<T> implements BaseConnector {
  late Vm viewModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.connector = this;
  }

  Vm initMyViewModel();

  BaseView() {
    viewModel = initMyViewModel();
  }

  @override
  hideDialog() {
    Navigator.pop(context);
  }

  @override
  showLoading() {
    showDialog(
      context: context,
      builder: (context) => Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  @override
  showMassege(String massege) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Error"),
        content: Text(massege),
      ),
    );
  }
}
