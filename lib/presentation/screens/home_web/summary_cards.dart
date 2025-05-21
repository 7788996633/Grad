import 'package:flutter/material.dart';

class SummaryCards extends StatelessWidget {
  const SummaryCards({super.key});

  @override
  Widget build(BuildContext context) {
    print("Building SummaryCards...");
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        children: const [
          Expanded(
            child: SummaryCard(
              title: "Revenue",
              amount: "\$4,567.53",
              color: Colors.red,
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: SummaryCard(
              title: "Referral Earning",
              amount: "\$1689.53",
              color: Colors.indigo,
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: SummaryCard(
              title: "Estimated Sales",
              amount: "\$2851.53",
              color: Colors.green,
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: SummaryCard(
              title: "Earning",
              amount: "\$52,567.53",
              color: Colors.purple,
            ),
          ),
        ],
      ),
    );
  }
}

class SummaryCard extends StatelessWidget {
  final String title;
  final String amount;
  final Color color;

  const SummaryCard({
    super.key,
    required this.title,
    required this.amount,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black54,
              )),
          const SizedBox(height: 8),
          Text(
            amount,
            style: TextStyle(
              fontSize: 20,
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
