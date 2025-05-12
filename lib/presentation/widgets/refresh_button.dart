import 'package:flutter/material.dart';
import 'package:untitled23/constant.dart';

class RefreshButton extends StatelessWidget {
  const RefreshButton({super.key, this.onPressed});
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor:AppColors.darkBlue,
      child: const Icon(
        Icons.refresh,
        color: Colors.white,
      ),
    );
  }
}
