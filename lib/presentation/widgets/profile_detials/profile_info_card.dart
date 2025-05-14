import 'package:flutter/material.dart';

import 'info_item_model.dart';

class ProfileInfoCard extends StatelessWidget {
  final List<InfoItemModel> items;
  final Widget? actionButton;

  const ProfileInfoCard({
    super.key,
    required this.items,
    this.actionButton,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(25),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                blurRadius: 15,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 20),
              ...items.map((item) => buildInfoTile(item)).toList(),
              if (actionButton != null) ...[
                const SizedBox(height: 30),
                actionButton!,
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInfoTile(InfoItemModel item) {
    return ListTile(
      leading: Icon(item.icon, color: Colors.blueGrey),
      title: Text(item.label, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(item.value),
    );
  }
}
