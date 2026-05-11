import 'package:budget/core/constants/app_styles.dart';
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
                'مرحبًا بك في تطبيق بدجت ، منصة مختصة بعرض وبيع وشراء السيارات وربط البائعين بالمشترين. باستخدامك للتطبيق فإنك تقر بموافقتك الكاملة على الشروط والأحكام المذكورة أدناه، يرجى قراءتها بعناية قبل استخدام خدماتنا.',
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
                  _buildSectionTitle('1. قبول الشروط'),
                  _buildSectionText('باستخدامك للتطبيق أو إنشاء حساب عليه، فأنت توافق بشكل كامل على الالتزام ببنود هذه الشروط. وإذا كنت لا توافق على أي جزء من هذه الشروط، يجب عليك التوقف عن استخدام التطبيق فورًا.'),
                  
                  _buildSectionTitle('2. أهلية الاستخدام'),
                  _buildBulletPoint('يجب أن يكون عمر المستخدم 18 عامًا أو أكثر لاستخدام خدمات التطبيق.'),
                  _buildBulletPoint('يلتزم المستخدم بتقديم معلومات صحيحة ودقيقة عند التسجيل.'),
                  _buildBulletPoint('يتحمل المستخدم مسؤولية الحفاظ على سرية بيانات حسابه وكلمة المرور.'),
                  
                  _buildSectionTitle('3. طبيعة عمل التطبيق'),
                  _buildBulletPoint('التطبيق يوفر منصة لعرض السيارات والتواصل بين البائع والمشتري ولا يعتبر طرفًا في عملية البيع أو الشراء.'),
                  _buildBulletPoint('التطبيق غير مسؤول عن فحص السيارات أو ضمان جودتها أو مطابقتها للمواصفات المعروضة.'),
                  _buildBulletPoint('أي اتفاق يتم بين البائع والمشتري يتم خارج مسؤولية التطبيق.'),
                  
                  _buildSectionTitle('4. التزامات البائع'),
                  _buildBulletPoint('تقديم معلومات صحيحة وواضحة عن السيارة.'),
                  _buildBulletPoint('عدم نشر سيارات مسروقة أو مخالفه للقوانين.'),
                  _buildBulletPoint('الالتزام بعدم التلاعب بالأسعار أو البيانات أو استخدام صور مضللة.'),
                  _buildBulletPoint('تحمل المسؤولية القانونية الكاملة عن صحة بيانات الإعلان.'),
                  
                  _buildSectionTitle('5. التزامات المشتري'),
                  _buildBulletPoint('التأكد من حالة السيارة قبل دفع أي مبلغ.'),
                  _buildBulletPoint('عدم تحميل التطبيق مسؤولية أي عملية احتيال أو خلاف يحدث مع البائع.'),
                  _buildBulletPoint('الالتزام باستخدام التطبيق بشكل قانوني دون إساءة.'),
                  
                  _buildSectionTitle('6. الممنوعات داخل التطبيق'),
                  _buildSectionText('يُحظر على المستخدمين:'),
                  _buildEmojiRow('❌', 'نشر إعلانات مضللة أو غير صحيحة'),
                  _buildEmojiRow('❌', 'استخدام التطبيق لعمليات نصب أو احتيال'),
                  _buildEmojiRow('❌', 'نشر محتوى يخالف القوانين أو الآداب العامة'),
                  _buildEmojiRow('❌', 'الإساءة للمستخدمين أو فريق الدعم'),
                  _buildEmojiRow('❌', 'استخدام حسابات متعددة للتحايل'),
                  const SizedBox(height: 10),
                  _buildSectionText('وفي حال المخالفة يحق للتطبيق:'),
                  _buildEmojiRow('✅', 'حذف الإعلان'),
                  _buildEmojiRow('✅', 'إيقاف الحساب مؤقتًا أو دائمًا'),
                  _buildEmojiRow('✅', 'اتخاذ الإجراءات القانونية اللازمة'),
                  
                  _buildSectionTitle('7. الدفع والعمولات (إن وجدت)'),
                  _buildBulletPoint('قد يفرض التطبيق رسومًا على الإعلانات أو الخدمات المميزة إن تم توضيحها داخل التطبيق.'),
                  _buildBulletPoint('جميع الرسوم غير قابلة للاسترداد بعد الدفع.'),
                  _buildBulletPoint('يتحمل المستخدم أي ضرائب أو رسوم إضافية متعلقة بالخدمة.'),
                  
                  _buildSectionTitle('8. إخلاء المسؤولية'),
                  _buildBulletPoint('التطبيق غير مسؤول عن جودة السيارات أو دقتها أو حالتها الفنية.'),
                  _buildBulletPoint('لا يتحمل التطبيق أي خسائر مالية أو أضرار تنتج عن التعامل بين الأطراف.'),
                  _buildBulletPoint('المستخدم يتحمل مسؤولية التحقق من أوراق السيارة وحالتها قبل الشراء.'),
                  
                  _buildSectionTitle('9. التعديلات على الشروط'),
                  _buildSectionText('يحق لإدارة التطبيق تعديل الشروط في أي وقت، ويعتبر استمرارك في استخدام التطبيق بعد التحديث موافقة تلقائية على التعديلات الجديدة.'),
                  
                  _buildSectionTitle('10. الملكية الفكرية'),
                  _buildSectionText('جميع محتويات التطبيق (الاسم، التصميم، الشعارات، الصور، الأكواد) هي ملك للتطبيق ولا يُسمح باستخدامها أو نسخها دون إذن رسمي.'),
                  
                  _buildSectionTitle('11. إنهاء الخدمة'),
                  _buildSectionText('يحق للتطبيق إيقاف أو تعطيل أي حساب يخالف سياسات الاستخدام دون إشعار مسبق.'),
                  
                  _buildSectionTitle('12. القانون المعمول به'),
                  _buildSectionText('تخضع هذه الشروط للقوانين المعمول بها في المملكة العربية السعودية، وأي نزاع يتم الفصل فيه لدى الجهات القانونية المختصة داخل الدولة.'),
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
