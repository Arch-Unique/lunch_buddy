import 'package:flutter/material.dart';

import '../../../global/ui/ui_barrel.dart';
import '../../../global/ui/widgets/others/containers.dart';
import '../../../src_barrel.dart';

class RankSelector extends StatefulWidget {
  const RankSelector({this.onPressed, super.key});
  final Function(int)? onPressed;

  @override
  State<RankSelector> createState() => _RankSelectorState();
}

class _RankSelectorState extends State<RankSelector> {
  int i = -1;
  @override
  Widget build(BuildContext context) {
    return Ui.padding(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppText.bold("Select Your Rank"),
          Ui.boxHeight(16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
                5,
                (index) => CurvedContainer(
                      color: AppColors.primaryColor,
                      onPressed: () {
                        setState(() {
                          i = index;
                        });
                        widget.onPressed!(i);
                      },
                      border: Border.all(
                        color: i == index
                            ? AppColors.green
                            : AppColors.primaryColorBackground,
                        width: 2,
                      ),
                      padding: EdgeInsets.all(16),
                      child: AppText(
                        (5 - index).toString(),
                        fontSize: 20,
                      ),
                    )),
          ),
          Ui.boxHeight(16),
        ],
      ),
    );
  }
}
