import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:needit_app/Features/checkout/Domain/entities/address_entity.dart';
import 'package:needit_app/constant.dart';
import 'package:needit_app/core/widgets/comtinue_buttom.dart';
import 'package:needit_app/core/widgets/custom_text_form_field.dart';

class EditAddressView extends StatelessWidget {
  final AddressEntity? address;

  const EditAddressView({super.key, this.address});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Text(
          address == null
              ? 'Add New Address'
              : 'Edit Address', // تغيير العنوان ديناميكياً
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            fontFamily: kRubikRubikMedium,
            fontSize: 18,
          ),
        ),
      ),
      // أزلنا const ومررنا العنوان
      body: EditAddressBody(address: address),
    );
  }
}

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

  @override
  void initState() {
    super.initState();
    _mapController = MapController();

    // 🌟 تهيئة البيانات بناءً على ما إذا كان تعديل أو إضافة
    nameController = TextEditingController(text: widget.address?.title ?? '');
    detailsController = TextEditingController(
      text: widget.address?.addressLine ?? '',
    );

    // تحديد المركز (إذا كان تعديل نأخذ إحداثياته، إذا إضافة نضع افتراضي)
    // ملاحظة: افترضت أن AddressEntity يحتوي على latitude و longitude
    selectedLocation = const LatLng(52.5200, 13.4050);
  }

  @override
  void dispose() {
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
          // 1. قسم الخريطة مع الدبوس الثابت
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.35,
            width: double.infinity,
            child: Stack(
              alignment: Alignment.center, // لجعل الدبوس في المنتصف تماماً
              children: [
                FlutterMap(
                  mapController: _mapController,
                  options: MapOptions(
                    initialCenter: selectedLocation,
                    initialZoom: 14.0,
                    onPositionChanged: (camera, hasGesture) {
                      if (hasGesture) {
                        selectedLocation = camera.center;
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
                // 📍 الدبوس الثابت فوق الخريطة (Overlay)
                const IgnorePointer(
                  // لكي لا يمنع اللمس عن الخريطة
                  child: Padding(
                    padding: EdgeInsets.only(
                      bottom: 35,
                    ), // لضبط سن الدبوس على المركز
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

          // 2. قسم الحقول (بدون تغيير كبير في التصميم)
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
                  text: 'Name Address',
                ),
                const SizedBox(height: 20),
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
                    debugPrint(
                      'Location: ${selectedLocation.latitude}, ${selectedLocation.longitude}',
                    );
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
