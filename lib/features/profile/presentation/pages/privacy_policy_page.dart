import 'package:budget/core/constants/app_styles.dart';
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
          style: AppStyles.heading2.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Intro Card
            _buildCard(
              child: Text(
                'نرحب بكم في تطبيق بدجت ، نحن نلتزم بحماية خصوصيتك وضمان أمان بياناتك الشخصية. توضح سياسة الخصوصية هذه كيفية جمع المعلومات، استخدامها، حمايتها، والإفصاح عنها عند استخدامك للتطبيق.',
                textAlign: TextAlign.center,
                style: AppStyles.body1.copyWith(
                  fontWeight: FontWeight.w600,
                  height: 1.6,
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Content Card
            _buildCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionTitle('1. المعلومات التي نقوم بجمعها'),
                  _buildSectionText('قد نقوم بجمع المعلومات التالية عند استخدام التطبيق:'),
                  _buildSubTitle('أ. المعلومات الشخصية:'),
                  _buildBulletPoint('الاسم'),
                  _buildBulletPoint('رقم الهاتف'),
                  _buildBulletPoint('البريد الإلكتروني'),
                  _buildBulletPoint('المدينة أو الموقع'),
                  _buildBulletPoint('معلومات الحساب الشخصي'),
                  
                  _buildSubTitle('ب. معلومات متعلقة باستخدام التطبيق:'),
                  _buildBulletPoint('نوع الجهاز ونظام التشغيل'),
                  _buildBulletPoint('عنوان الـ IP'),
                  _buildBulletPoint('سجل التفاعل داخل التطبيق'),
                  _buildBulletPoint('الصفحات التي تمت زيارتها داخل التطبيق'),
                  
                  _buildSubTitle('ج. بيانات الإعلان (إن وُجدت):'),
                  _buildBulletPoint('صور السيارات المرفوعة من المستخدم'),
                  _buildBulletPoint('وصف السيارة وسعرها ومعلوماتها'),
                  _buildBulletPoint('بيانات التواصل التي يتم إدراجها داخل الإعلان'),
                  
                  _buildSectionTitle('2. كيفية استخدام المعلومات'),
                  _buildSectionText('نستخدم البيانات التي تم جمعها بهدف:'),
                  _buildEmojiRow('✅', 'تحسين تجربة المستخدم داخل التطبيق'),
                  _buildEmojiRow('✅', 'تسهيل التواصل بين البائع والمشتري'),
                  _buildEmojiRow('✅', 'عرض الإعلانات بشكل مناسب وفعّال'),
                  _buildEmojiRow('✅', 'تطوير خدمات التطبيق وإصلاح المشكلات التقنية'),
                  _buildEmojiRow('✅', 'إرسال إشعارات متعلقة بالخدمات أو تحديثات التطبيق'),
                  _buildEmojiRow('✅', 'منع الاحتيال وإساءة الاستخدام'),
                  
                  _buildSectionTitle('3. مشاركة المعلومات مع جهات خارجية'),
                  _buildSectionText('نحن لا نقوم ببيع البيانات الشخصية لأي طرف ثالث، ولكن قد يتم مشاركتها في الحالات التالية فقط:'),
                  _buildEmojiRow('🔹', 'مع شركات تحليل البيانات لتحسين الأداء'),
                  _buildEmojiRow('🔹', 'مع مزودي الخدمات التقنية (الدعم – الاستضافة – الإشعارات)'),
                  _buildEmojiRow('🔹', 'إذا طُلب ذلك رسميًا من الجهات القانونية المختصة'),
                  
                  _buildSectionTitle('4. حماية البيانات'),
                  _buildSectionText('نستخدم تدابير أمنية وتقنيات تشفير لحماية بيانات المستخدم مثل:'),
                  _buildEmojiRow('🔐', 'تشفير البيانات الحساسة'),
                  _buildEmojiRow('🔐', 'حماية الخوادم ضد الاختراق'),
                  _buildEmojiRow('🔐', 'تقييمات دورية لثغرات النظام'),
                  _buildSectionText('ومع ذلك، لا يمكن ضمان الحماية الكاملة بنسبة 100% عبر الإنترنت.'),
                  
                  _buildSectionTitle('5. ملفات تعريف الارتباط (Cookies)'),
                  _buildSectionText('قد يستخدم التطبيق ملفات تعريف الارتباط لتحسين التجربة مثل:'),
                  _buildBulletPoint('حفظ تفضيلات المستخدم'),
                  _buildBulletPoint('تحليل الأداء'),
                  _buildBulletPoint('تخصيص المحتوى المناسب للمستخدم'),
                  _buildSectionText('ويمكن للمستخدم تعطيلها من إعدادات المتصفح إن رغب.'),
                  
                  _buildSectionTitle('6. حقوق المستخدم'),
                  _buildSectionText('يحق للمستخدم:'),
                  _buildEmojiRow('✔', 'طلب حذف حسابه وبياناته من التطبيق'),
                  _buildEmojiRow('✔', 'طلب تعديل بياناته الشخصية'),
                  _buildEmojiRow('✔', 'الاعتراض على تلقي رسائل تسويقية أو إشعارات'),
                  
                  _buildSectionTitle('7. مسؤولية المستخدم'),
                  _buildSectionText('المستخدم مسؤول عن:'),
                  _buildEmojiRow('⚠', 'الحفاظ على سرية بيانات حسابه'),
                  _buildEmojiRow('⚠', 'أي نشاط يتم من خلال حسابه داخل التطبيق'),
                  _buildEmojiRow('⚠', 'إدخال معلومات صحيحة عند التسجيل أو نشر الإعلانات'),
                  
                  _buildSectionTitle('8. استخدام الأطفال للتطبيق'),
                  _buildSectionText('التطبيق غير مخصص للأشخاص دون سن 18 عامًا، وفي حال ثبوت استخدام طفل دون هذا السن، يتم حذف البيانات فورًا.'),
                  
                  _buildSectionTitle('9. التعديلات على سياسة الخصوصية'),
                  _buildSectionText('قد يتم تحديث هذه السياسة من وقت لآخر، وفي حال إجراء تغييرات سيتم:'),
                  _buildEmojiRow('📌', 'تحديث الصفحة'),
                  _buildEmojiRow('📌', 'تغيير تاريخ آخر تحديث'),
                  _buildEmojiRow('📌', 'اعتبار استمرارك في استخدام التطبيق موافقة على التحديثات'),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'باستخدامك للتطبيق فأنت توافق على جميع الشروط والأحكام المذكورة أعلاه.',
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

  Widget _buildCard({required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
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

  Widget _buildSectionTitle(String title) {
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

  Widget _buildSubTitle(String title) {
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

  Widget _buildSectionText(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: AppStyles.body2.copyWith(height: 1.5),
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
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

  Widget _buildEmojiRow(String emoji, String text) {
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
