import 'package:budget/core/constants/app_styles.dart';
import 'package:budget/core/widgets/legal_document_widgets.dart';
import 'package:budget/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TermsAndConditionsPage extends StatelessWidget {
  const TermsAndConditionsPage({super.key});

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
          l10n.terms_conditions,
          style: AppStyles.heading2,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            LegalCard(
              child: LegalSectionText(
                text: l10n.terms_intro,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            LegalCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LegalSectionTitle(title: l10n.terms_section_1_title),
                  LegalSectionText(text: l10n.terms_section_1_desc),
                  
                  LegalSectionTitle(title: l10n.terms_section_2_title),
                  LegalBulletPoint(text: l10n.terms_section_2_item_1),
                  LegalBulletPoint(text: l10n.terms_section_2_item_2),
                  LegalBulletPoint(text: l10n.terms_section_2_item_3),
                  
                  LegalSectionTitle(title: l10n.terms_section_3_title),
                  LegalBulletPoint(text: l10n.terms_section_3_item_1),
                  LegalBulletPoint(text: l10n.terms_section_3_item_2),
                  LegalBulletPoint(text: l10n.terms_section_3_item_3),
                  
                  LegalSectionTitle(title: l10n.terms_section_4_title),
                  LegalBulletPoint(text: l10n.terms_section_4_item_1),
                  LegalBulletPoint(text: l10n.terms_section_4_item_2),
                  LegalBulletPoint(text: l10n.terms_section_4_item_3),
                  LegalBulletPoint(text: l10n.terms_section_4_item_4),
                  
                  LegalSectionTitle(title: l10n.terms_section_5_title),
                  LegalBulletPoint(text: l10n.terms_section_5_item_1),
                  LegalBulletPoint(text: l10n.terms_section_5_item_2),
                  LegalBulletPoint(text: l10n.terms_section_5_item_3),
                  
                  LegalSectionTitle(title: l10n.terms_section_6_title),
                  LegalSectionText(text: l10n.terms_section_6_prohibited),
                  LegalEmojiRow(emoji: '❌', text: l10n.terms_section_6_p_item_1),
                  LegalEmojiRow(emoji: '❌', text: l10n.terms_section_6_p_item_2),
                  LegalEmojiRow(emoji: '❌', text: l10n.terms_section_6_p_item_3),
                  LegalEmojiRow(emoji: '❌', text: l10n.terms_section_6_p_item_4),
                  LegalEmojiRow(emoji: '❌', text: l10n.terms_section_6_p_item_5),
                  const SizedBox(height: 10),
                  LegalSectionText(text: l10n.terms_section_6_rights),
                  LegalEmojiRow(emoji: '✅', text: l10n.terms_section_6_r_item_1),
                  LegalEmojiRow(emoji: '✅', text: l10n.terms_section_6_r_item_2),
                  LegalEmojiRow(emoji: '✅', text: l10n.terms_section_6_r_item_3),
                  
                  LegalSectionTitle(title: l10n.terms_section_7_title),
                  LegalBulletPoint(text: l10n.terms_section_7_item_1),
                  LegalBulletPoint(text: l10n.terms_section_7_item_2),
                  LegalBulletPoint(text: l10n.terms_section_7_item_3),
                  
                  LegalSectionTitle(title: l10n.terms_section_8_title),
                  LegalBulletPoint(text: l10n.terms_section_8_item_1),
                  LegalBulletPoint(text: l10n.terms_section_8_item_2),
                  LegalBulletPoint(text: l10n.terms_section_8_item_3),
                  
                  LegalSectionTitle(title: l10n.terms_section_9_title),
                  LegalSectionText(text: l10n.terms_section_9_desc),
                  
                  LegalSectionTitle(title: l10n.terms_section_10_title),
                  LegalSectionText(text: l10n.terms_section_10_desc),
                  
                  LegalSectionTitle(title: l10n.terms_section_11_title),
                  LegalSectionText(text: l10n.terms_section_11_desc),
                  
                  LegalSectionTitle(title: l10n.terms_section_12_title),
                  LegalSectionText(text: l10n.terms_section_12_desc),
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
