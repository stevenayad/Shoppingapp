import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopp/Homepage/presentation/viewModel/screens/screens_cubit.dart';
import '../../../../constant.dart';

class selectsection extends StatefulWidget {
  const selectsection({super.key});

  @override
  State<selectsection> createState() => _selectsectionState();
}

class _selectsectionState extends State<selectsection> {
  List<String> items = ["beauty", "fragrances", "furniture", "groceries"];
  int selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return sectionsitem(index);
        },
      ),
    );
  }

  Widget sectionsitem(int index) {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPaddin / 4),
      child: GestureDetector(
        onTap: () {
          final selectedTab = mapIndexToTabItem(index);
          context.read<ScreensCubit>().seletedtab(selectedTab);
        },
        child: BlocBuilder<ScreensCubit, TabItem>(
          builder: (context, selectedTab) {
            bool isSelected = selectedTab == mapIndexToTabItem(index);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  items[index],
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w400),
                ),
                Container(
                  width: 30,
                  height: 2,
                  color: isSelected ? Colors.red : Colors.transparent,
                )
              ],
            );
          },
        ),
      ),
    );
  }

  TabItem mapIndexToTabItem(int index) {
    switch (index) {
      case 0:
        return TabItem.beauty;
      case 1:
        return TabItem.fragrances;
      case 2:
        return TabItem.furniture;
      case 3:
        return TabItem.groceries;
      default:
        return TabItem.beauty;
    }
  }
}
