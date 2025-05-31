import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class AwesomeDialogWidget extends StatelessWidget {
  const AwesomeDialogWidget({super.key, required this.Error});

  final String Error;
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        borderSide: const BorderSide(
          color: Colors.red,
          width: 2,
        ),
        title: 'ERROR',
        desc: Error,
        btnOkOnPress: () {},
      ).show();
    });

    return const Scaffold();
  }
}
