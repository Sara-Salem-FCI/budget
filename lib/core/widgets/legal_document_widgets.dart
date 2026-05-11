import 'package:budget/core/constants/app_styles.dart';
import 'package:flutter/material.dart';

class LegalCard extends StatelessWidget {
  final Widget child;
  final double padding;

  const LegalCard({
    super.key,
    required this.child,
    this.padding = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: child,
    );
  }
}

class LegalSectionTitle extends StatelessWidget {
  final String title;

  const LegalSectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, top: 12),
      child: Text(
        title,
        style: AppStyles.body1.copyWith(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
    );
  }
}

class LegalSectionSubTitle extends StatelessWidget {
  final String title;

  const LegalSectionSubTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6, top: 8),
      child: Text(
        title,
        style: AppStyles.body2.copyWith(
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }
}

class LegalSectionText extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;

  const LegalSectionText({
    super.key,
    required this.text,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        textAlign: textAlign,
        style: AppStyles.body2.copyWith(height: 1.5),
      ),
    );
  }
}

class LegalBulletPoint extends StatelessWidget {
  final String text;

  const LegalBulletPoint({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('• ', style: TextStyle(fontWeight: FontWeight.bold)),
          Expanded(
            child: Text(
              text,
              style: AppStyles.body2.copyWith(height: 1.5),
            ),
          ),
        ],
      ),
    );
  }
}

class LegalEmojiRow extends StatelessWidget {
  final String emoji;
  final String text;

  const LegalEmojiRow({
    super.key,
    required this.emoji,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          Text(emoji),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: AppStyles.body2,
            ),
          ),
        ],
      ),
    );
  }
}
