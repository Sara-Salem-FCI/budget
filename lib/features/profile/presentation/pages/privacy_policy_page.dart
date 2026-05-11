import 'package:budget/core/constants/app_styles.dart';
import 'package:budget/core/widgets/legal_document_widgets.dart';
import 'package:budget/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8F8),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => context.pop(),
        ),
        title: Text(
          l10n.privacy_policy,
          style: AppStyles.heading2,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            LegalCard(
              child: LegalSectionText(
                text: l10n.privacy_intro,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            LegalCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LegalSectionTitle(title: l10n.privacy_section_1_title),
                  LegalSectionText(text: l10n.privacy_section_1_desc),
                  LegalSectionSubTitle(title: l10n.privacy_section_1_sub_a),
                  LegalBulletPoint(text: l10n.privacy_section_1_a_item_1),
                  LegalBulletPoint(text: l10n.privacy_section_1_a_item_2),
                  LegalBulletPoint(text: l10n.privacy_section_1_a_item_3),
                  LegalBulletPoint(text: l10n.privacy_section_1_a_item_4),
                  LegalBulletPoint(text: l10n.privacy_section_1_a_item_5),
                  
                  LegalSectionSubTitle(title: l10n.privacy_section_1_sub_b),
                  LegalBulletPoint(text: l10n.privacy_section_1_b_item_1),
                  LegalBulletPoint(text: l10n.privacy_section_1_b_item_2),
                  LegalBulletPoint(text: l10n.privacy_section_1_b_item_3),
                  LegalBulletPoint(text: l10n.privacy_section_1_b_item_4),
                  
                  LegalSectionSubTitle(title: l10n.privacy_section_1_sub_c),
                  LegalBulletPoint(text: l10n.privacy_section_1_c_item_1),
                  LegalBulletPoint(text: l10n.privacy_section_1_c_item_2),
                  LegalBulletPoint(text: l10n.privacy_section_1_c_item_3),
                  
                  LegalSectionTitle(title: l10n.privacy_section_2_title),
                  LegalSectionText(text: l10n.privacy_section_2_desc),
                  LegalEmojiRow(emoji: '✅', text: l10n.privacy_section_2_item_1),
                  LegalEmojiRow(emoji: '✅', text: l10n.privacy_section_2_item_2),
                  LegalEmojiRow(emoji: '✅', text: l10n.privacy_section_2_item_3),
                  LegalEmojiRow(emoji: '✅', text: l10n.privacy_section_2_item_4),
                  LegalEmojiRow(emoji: '✅', text: l10n.privacy_section_2_item_5),
                  LegalEmojiRow(emoji: '✅', text: l10n.privacy_section_2_item_6),
                  
                  LegalSectionTitle(title: l10n.privacy_section_3_title),
                  LegalSectionText(text: l10n.privacy_section_3_desc),
                  LegalEmojiRow(emoji: '🔹', text: l10n.privacy_section_3_item_1),
                  LegalEmojiRow(emoji: '🔹', text: l10n.privacy_section_3_item_2),
                  LegalEmojiRow(emoji: '🔹', text: l10n.privacy_section_3_item_3),
                  
                  LegalSectionTitle(title: l10n.privacy_section_4_title),
                  LegalSectionText(text: l10n.privacy_section_4_desc),
                  LegalEmojiRow(emoji: '🔐', text: l10n.privacy_section_4_item_1),
                  LegalEmojiRow(emoji: '🔐', text: l10n.privacy_section_4_item_2),
                  LegalEmojiRow(emoji: '🔐', text: l10n.privacy_section_4_item_3),
                  LegalSectionText(text: l10n.privacy_section_4_footer),
                  
                  LegalSectionTitle(title: l10n.privacy_section_5_title),
                  LegalSectionText(text: l10n.privacy_section_5_desc),
                  LegalBulletPoint(text: l10n.privacy_section_5_item_1),
                  LegalBulletPoint(text: l10n.privacy_section_5_item_2),
                  LegalBulletPoint(text: l10n.privacy_section_5_item_3),
                  LegalSectionText(text: l10n.privacy_section_5_footer),
                  
                  LegalSectionTitle(title: l10n.privacy_section_6_title),
                  LegalSectionText(text: l10n.privacy_section_6_desc),
                  LegalEmojiRow(emoji: '✔', text: l10n.privacy_section_6_item_1),
                  LegalEmojiRow(emoji: '✔', text: l10n.privacy_section_6_item_2),
                  LegalEmojiRow(emoji: '✔', text: l10n.privacy_section_6_item_3),
                  
                  LegalSectionTitle(title: l10n.privacy_section_7_title),
                  LegalSectionText(text: l10n.privacy_section_7_desc),
                  LegalEmojiRow(emoji: '⚠', text: l10n.privacy_section_7_item_1),
                  LegalEmojiRow(emoji: '⚠', text: l10n.privacy_section_7_item_2),
                  LegalEmojiRow(emoji: '⚠', text: l10n.privacy_section_7_item_3),
                  
                  LegalSectionTitle(title: l10n.privacy_section_8_title),
                  LegalSectionText(text: l10n.privacy_section_8_desc),
                  
                  LegalSectionTitle(title: l10n.privacy_section_9_title),
                  LegalSectionText(text: l10n.privacy_section_9_desc),
                  LegalEmojiRow(emoji: '📌', text: l10n.privacy_section_9_item_1),
                  LegalEmojiRow(emoji: '📌', text: l10n.privacy_section_9_item_2),
                  LegalEmojiRow(emoji: '📌', text: l10n.privacy_section_9_item_3),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                l10n.legal_consent,
                textAlign: TextAlign.center,
                style: AppStyles.body2.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
