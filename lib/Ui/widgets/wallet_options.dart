import 'package:flutter/material.dart';
import 'package:keywa_test_application/constant/colors.dart';

class WalletOptions extends StatelessWidget {
  const WalletOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const WalletOptionCard(
          icon: Icons.add_circle,
          label: 'ایجاد کیف پول هوشمند',
          subtitle: 'کیف پول دارم',
        ),
        const SizedBox(width: 15),
        Container(
            margin: const EdgeInsets.only(top: 14),
            width: 1.5,
            height: 155,
            color: CustomColor.grey),
        const SizedBox(width: 15),
        const WalletOptionCard(
          icon: Icons.add_circle,
          label: 'ایجاد کیف پول شخصی',
          subtitle: 'بازیابی کیف پول',
        ),
      ],
    );
  }
}

class WalletOptionCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String subtitle;

  const WalletOptionCard({
    super.key,
    required this.icon,
    required this.label,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 120,
          width: 180,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: const Color.fromARGB(255, 43, 42, 42),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              Icon(icon, color: CustomColor.yellow, size: 30),
              const SizedBox(height: 7),
              Text(label, style: Theme.of(context).textTheme.bodyMedium),
            ],
          ),
        ),
        const SizedBox(height: 5),
        Text(
          subtitle,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(decoration: TextDecoration.underline),
        ),
      ],
    );
  }
}
