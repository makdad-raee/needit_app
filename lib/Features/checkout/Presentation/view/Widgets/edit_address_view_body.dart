import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:needit_app/Features/checkout/Domain/entities/address_entity.dart';
import 'package:needit_app/Features/checkout/Presentation/Bloc/bloc/checkout_bloc.dart';
import 'package:needit_app/Features/checkout/Presentation/Bloc/bloc/checkout_event.dart';
import 'package:needit_app/constant.dart';
import 'package:needit_app/core/widgets/comtinue_buttom.dart';
import 'package:needit_app/core/widgets/custom_text_form_field.dart';

import 'dart:async'; // 👈 ضروري للـ Timer
import 'dart:convert'; // 👈 ضروري لتحويل البيانات
import 'package:http/http.dart' as http;
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class EditAddressBody extends StatefulWidget {
  final AddressEntity? address; // استقبال البيانات هنا
  const EditAddressBody({super.key, this.address});

  @override
  State<EditAddressBody> createState() => _EditAddressBodyState();
}

class _EditAddressBodyState extends State<EditAddressBody> {
  late TextEditingController nameController;
  late TextEditingController detailsController;
  late MapController _mapController;
  late LatLng selectedLocation;
  bool isDefaultAddress = false;

  Timer? _debounce; // ⏳ المؤقت السحري لمنع حظر السيرفر

  @override
  void initState() {
    super.initState();
    _mapController = MapController();

    nameController = TextEditingController(text: widget.address?.title ?? '');
    detailsController = TextEditingController(
      text: widget.address?.addressLine ?? '',
    );
    isDefaultAddress = widget.address?.isSelected ?? false;

    // 🌟 السحر هنا: قراءة الموقع المحفوظ
    if (widget.address != null) {
      // حالة التعديل: نأخذ إحداثيات العنوان القديم
      selectedLocation = LatLng(
        widget.address!.latitude,
        widget.address!.longitude,
      );
    } else {
      // حالة الإضافة الجديدة: نضع مكان افتراضي (مثلاً برلين) ونجلب اسمه
      selectedLocation = const LatLng(52.5200, 13.4050);
      _fetchAddressFromCoordinates(selectedLocation);
    }
  }

  // 🌐 الدالة المسؤولة عن جلب العنوان من الإنترنت
  Future<void> _fetchAddressFromCoordinates(LatLng position) async {
    setState(() {
      detailsController.text = 'Loading address...'; // نص يظهر أثناء التحميل
    });

    try {
      // رابط الـ API المجاني من OpenStreetMap
      final url = Uri.parse(
        'https://nominatim.openstreetmap.org/reverse?format=json&lat=${position.latitude}&lon=${position.longitude}&zoom=18&addressdetails=1',
      );

      final response = await http.get(
        url,
        headers: {
          'User-Agent': 'com.example.needit_app', // مهم جداً لكي لا يتم حظرك
        },
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        // استخراج العنوان بصيغة مقروءة
        final displayName = data['display_name'] ?? 'Unknown location';

        setState(() {
          detailsController.text = displayName; // وضع العنوان في الحقل
        });
      } else {
        setState(() => detailsController.text = 'Failed to load address');
      }
    } catch (e) {
      setState(() => detailsController.text = 'No internet connection');
    }
  }

  @override
  void dispose() {
    _debounce?.cancel(); // إيقاف المؤقت عند الخروج من الشاشة
    nameController.dispose();
    detailsController.dispose();
    _mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.35,
            width: double.infinity,
            child: Stack(
              alignment: Alignment.center,
              children: [
                FlutterMap(
                  mapController: _mapController,
                  options: MapOptions(
                    initialCenter: selectedLocation,
                    initialZoom: 14.0,
                    onPositionChanged: (camera, hasGesture) {
                      if (hasGesture) {
                        selectedLocation = camera.center;
                        // ⏳ تطبيق فكرة الـ Debounce
                        if (_debounce?.isActive ?? false) _debounce!.cancel();
                        _debounce = Timer(const Duration(milliseconds: 800), () {
                          // يتم استدعاء هذه الدالة فقط إذا توقف المستخدم عن التحريك لمدة 800 جزء من الثانية
                          _fetchAddressFromCoordinates(selectedLocation);
                        });
                      }
                    },
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName: 'com.example.needit_app',
                    ),
                  ],
                ),
                // 📍 الدبوس الثابت
                const IgnorePointer(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 35),
                    child: Icon(
                      Icons.location_on,
                      size: 45,
                      color: kprimaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // قسم الحقول
          Container(
            transform: Matrix4.translationValues(0.0, -20.0, 0.0),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                Text(
                  'Address Details',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontFamily: kRubikRubikMedium,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  controller: nameController,
                  text: 'Name Address', // (مثلاً: بيتي، العمل)
                ),
                const SizedBox(height: 20),
                // حقل التفاصيل الذي يتحدث تلقائياً 🌟
                CustomTextFormField(
                  controller: detailsController,
                  text: 'Address Details',
                  prefixIcon: const Icon(
                    Icons.location_on,
                    color: Colors.black87,
                    size: 20,
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Checkbox(
                      value: isDefaultAddress,
                      activeColor: kprimaryColor,
                      onChanged:
                          (value) =>
                              setState(() => isDefaultAddress = value ?? false),
                    ),
                    const Text('Make this as the default address'),
                  ],
                ),
                const SizedBox(height: 35),
                ContinueBottom(
                  text: widget.address == null ? 'Save' : 'Update',
                  onTap: () {
                    // 1. التحقق من أن الحقول غير فارغة
                    if (nameController.text.isEmpty ||
                        detailsController.text.isEmpty) {
                      // يفضل مستقبلاً إظهار رسالة خطأ (SnackBar) هنا
                      return;
                    }

                    // 2. تجميع بيانات العنوان الجديد في Entity
                    final newAddress = AddressEntity(
                      // ننشئ ID عشوائي مؤقت (لاحقاً السيرفر بيعطيه ID)
                      id:
                          widget.address?.id ??
                          DateTime.now().millisecondsSinceEpoch.toString(),
                      title: nameController.text,
                      addressLine: detailsController.text,
                      latitude: selectedLocation.latitude,
                      longitude: selectedLocation.longitude,
                      isSelected: isDefaultAddress,
                    );
                    // 3. إرسال الحدث للـ Bloc لحفظ العنوان
                    context.read<CheckoutBloc>().add(
                      SaveAddressEvent(newAddress),
                    );
                    // 4. إغلاق شاشة الخريطة والعودة لشاشة العناوين
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
