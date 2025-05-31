import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopp/Homepage/presentation/view/wedget/choosescreen.dart';
import 'package:shopp/Homepage/presentation/viewModel/screens/screens_cubit.dart';

class HomepageBodyWrapper extends StatelessWidget {
  const HomepageBodyWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ScreensCubit(),
      child: const Choosescreen(),
    );
  }
}
