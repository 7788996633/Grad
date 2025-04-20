import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final IconData iconData;
  final Color buttonColor;

  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.buttonText,
    required this.iconData,
    this.buttonColor = const Color.fromARGB(255, 176, 138, 190), // اللون الافتراضي
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,  // لضبط النص والأيقونة في الوسط
        children: [
          Icon(
            iconData,  // أيقونة التحميل
            color: Colors.white,  // لون الأيقونة
          ),
          SizedBox(width: 10),  // مسافة بين الأيقونة والنص
          Text(buttonText),  // نص الزر
        ],
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        padding: EdgeInsets.symmetric(vertical: 15),
        textStyle: TextStyle(fontSize: 18),
        minimumSize: Size(double.infinity, 50),  // تعيين الزر ليأخذ العرض الكامل
        elevation: 5,  // إضافة ظل للزر
      ),
    );
  }
}
