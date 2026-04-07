import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:needit_app/Features/Profile/Presentation/View/widgets/create_pin_for_profile.dart';
import 'package:needit_app/Features/Profile/Presentation/View/widgets/gender_drop_button.dart';
import 'package:needit_app/Features/Profile/Presentation/View/widgets/profile_picture.dart';
import 'package:needit_app/core/widgets/comtinue_buttom.dart';
import 'package:needit_app/core/widgets/custom_text_form_field.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  // 2. تعريف الـ Controllers لكل حقل
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  late TextEditingController dobController;
  late TextEditingController emailController;
  late TextEditingController phoneController;

  @override
  void initState() {
    super.initState();
    // 3. تهيئة الـ Controllers
    // ملاحظة: لو كنا نريد وضع قيم مبدئية (مثلاً اسم المستخدم الحالي)، نضعها هنا:
    // firstNameController = TextEditingController(text: 'Makdad');
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    dobController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
  }

  // دالة لإظهار الـ Date Picker
  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000), // التاريخ الافتراضي عند فتح التقويم
      firstDate: DateTime(1950), // أقدم تاريخ ممكن اختياره
      lastDate: DateTime.now(), // أحدث تاريخ (اليوم)
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary:
                  Theme.of(context).primaryColor, // لون الرأس (الأصفر تبعك)
              onPrimary: Colors.black, // لون النص فوق الأصفر
              onSurface: Colors.black, // لون التواريخ
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        // تحويل التاريخ لنص وتخزينه في الـ Controller
        // تنسيق YYYY-MM-DD
        dobController.text =
            "${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}";
      });
    }
  }

  @override
  void dispose() {
    // 4. إغلاق الـ Controllers لتنظيف الذاكرة (خطوة هامة جداً!)
    firstNameController.dispose();
    lastNameController.dispose();
    dobController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50),
            const ProfilePicture(),
            const SizedBox(height: 20),
            CustomTextFormField(
              controller: firstNameController, // 👈 ربط الـ Controller هنا
              text: 'First Name',
              prefixIcon: SvgPicture.asset(
                'assets/images/namesvg.svg',
                fit: BoxFit.scaleDown,
                height: 15,
              ),
            ),
            const SizedBox(height: 20),
            CustomTextFormField(
              controller: lastNameController, // 👈 الربط
              text: 'Last Name',
              prefixIcon: SvgPicture.asset(
                'assets/images/namesvg.svg',
                fit: BoxFit.scaleDown,
                height: 15,
              ),
            ),
            const SizedBox(height: 20),
            CustomTextFormField(
              controller: dobController, // 👈 الربط
              text: 'Date of Birth',
              readOnly: true,
              onTap:
                  () => _selectDate(context), // فتح الـ Date Picker عند الضغط
              prefixIcon: SvgPicture.asset(
                'assets/images/datesvg.svg',
                fit: BoxFit.scaleDown,
                height: 15,
              ),
            ),
            const SizedBox(height: 20),
            CustomTextFormField(
              controller: emailController, // 👈 الربط
              text: 'Email',
              prefixIcon: SvgPicture.asset(
                'assets/images/emailsvg.svg',
                fit: BoxFit.scaleDown,
                height: 15,
              ),
            ),
            const SizedBox(height: 20),
            CustomTextFormField(
              controller: phoneController, // 👈 الربط
              text: 'Phone Number',
              prefixIcon: SvgPicture.asset(
                'assets/images/flagsvg.svg',
                colorFilter: const ColorFilter.mode(
                  Colors.black26,
                  BlendMode.softLight,
                ),
                fit: BoxFit.scaleDown,
                height: 15,
              ),
            ),
            const SizedBox(height: 20),
            const GenderDropdownButton(),
            const SizedBox(height: 40),
            ContinueBottom(
              text: 'Save',
              onTap: () {
                // تجربة طباعة البيانات في الكونسول للتأكد من نجاح الربط
                debugPrint('First Name: ${firstNameController.text}');
                debugPrint('Email: ${emailController.text}');

                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const CreatePinForProfile(),
                  ),
                );
              },
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
