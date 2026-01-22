import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:needit_app/Features/Add%20to%20cart/Domain/Entities/cart_entity.dart';
import 'package:needit_app/Features/Shopping/domain/Entities/product_entity_category.dart';
import 'package:needit_app/Features/checkout/Domain/entities/location_entity.dart';
import 'package:needit_app/Features/checkout/Domain/entities/promo_entity.dart';
import 'package:needit_app/Features/checkout/Domain/entities/shipping_type_entity.dart';

const limit = 10;
ValueNotifier<ShippingTypeEntity?> shippingTypeEntityNotifier =
    ValueNotifier<ShippingTypeEntity?>(null);
ValueNotifier<LocationEntity?> locationNotifier =
    ValueNotifier<LocationEntity?>(null);
ValueNotifier<PromoEntity?> promoEntityNotifier = ValueNotifier<PromoEntity?>(
  null,
);
ValueNotifier<int> imortantindex = ValueNotifier<int>(0);
//ValueNotifier<double> totalPRice = ValueNotifier<double>(0);
double kTotalPrice = 0.0;
ValueNotifier<List<CartEntity>> cartentityNotifer =
    ValueNotifier<List<CartEntity>>([]);
ValueNotifier<List<ProductEntityCategory>> bagsEntityNotifer =
    ValueNotifier<List<ProductEntityCategory>>([]);
ValueNotifier<List<ProductEntityCategory>> productsEntityNotifer =
    ValueNotifier<List<ProductEntityCategory>>([]);
ValueNotifier<String> sizeNotifier = ValueNotifier<String>('');
ValueNotifier<String> colorNotifier = ValueNotifier<String>('');
ValueNotifier<File?> imagePiced = ValueNotifier<File?>(null);

const Color kprimaryColor = Color(0xFF101010);
// Color(0xFFFFCC06);
const TextStyle ktextStyle19 = TextStyle(
  fontSize: 19,
  fontWeight: FontWeight.w600,
);

//
const TextStyle ktextStyle20 = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w700,
  color: Colors.white,
);

const TextStyle ktextStyle20BlackW800 = TextStyle(
  color: Colors.black,
  fontSize: 20,
  fontWeight: FontWeight.w800,
);
const TextStyle kTitletextStyle30 = TextStyle(
  fontSize: 30,
  fontWeight: FontWeight.w700,
);
const TextStyle ktextStyle12 = TextStyle(
  color: Colors.black,
  fontSize: 12,
  fontWeight: FontWeight.w400,
);
const TextStyle ktextStyle12w500 = TextStyle(
  color: Colors.black,
  fontSize: 12,
  fontWeight: FontWeight.w500,
);
const TextStyle ktextStyle12w600 = TextStyle(
  color: Colors.black,
  fontSize: 12,
  fontWeight: FontWeight.w600,
);
const TextStyle ktextStyle14w500 = TextStyle(
  color: Colors.black,
  fontSize: 12,
  fontWeight: FontWeight.w500,
);
const TextStyle ktextStyle14w500White = TextStyle(
  fontSize: 12,
  fontWeight: FontWeight.w500,
);
const TextStyle ktextStyle18 = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w700,
);
const TextStyle ktextStyle36 = TextStyle(
  fontSize: 36,
  fontWeight: FontWeight.w700,
);
const TextStyle ktextStyle40 = TextStyle(
  fontSize: 40,
  fontWeight: FontWeight.w600,
);
const TextStyle ktextStyle15 = TextStyle(
  fontSize: 15,
  fontWeight: FontWeight.w700,
);
const TextStyle ktextStyle15White500 = TextStyle(
  fontSize: 15,
  fontWeight: FontWeight.w500,
  color: Colors.white,
);
const TextStyle ktextStyle15White = TextStyle(
  fontSize: 15,
  fontWeight: FontWeight.w700,
  color: Colors.white,
);
const TextStyle ktextStyle16 = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w700,
);
const TextStyle ktextStyle28 = TextStyle(
  fontSize: 28,
  fontWeight: FontWeight.w500,
  fontFamily: 'Rubik',
);
const TextStyle ktextStyle30 = TextStyle(
  fontSize: 30,
  fontWeight: FontWeight.w700,
);
const TextStyle ktextStyle10 = TextStyle(
  fontSize: 10,
  fontWeight: FontWeight.w400,
);
const TextStyle ktextStyle22 = TextStyle(
  fontSize: 22,
  fontWeight: FontWeight.w500,
);
const TextStyle ktextStyle13 = TextStyle(
  fontSize: 13,
  fontWeight: FontWeight.w300,
);
List<BottomNavigationBarItem> bottomNavigationBarItems(BuildContext context) =>
    [
      BottomNavigationBarItem(
        activeIcon: SvgPicture.asset(
          'assets/images/homesvgnav.svg',
          colorFilter: ColorFilter.mode(
            Theme.of(context).primaryColor,
            BlendMode.srcIn,
          ),
        ),
        icon: SvgPicture.asset(
          'assets/images/homesmall.svg',
          colorFilter: const ColorFilter.mode(kprimaryColor, BlendMode.srcATop),
        ),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        activeIcon: SvgPicture.asset(
          'assets/images/cartsvg.svg',
          colorFilter: ColorFilter.mode(
            Theme.of(context).primaryColor,
            BlendMode.srcIn,
          ),
        ),
        icon: SvgPicture.asset('assets/images/cartsvg.svg'),
        label: 'Cart',
      ),
      BottomNavigationBarItem(
        activeIcon: SvgPicture.asset(
          'assets/images/walletsvg.svg',
          colorFilter: ColorFilter.mode(
            Theme.of(context).primaryColor,
            BlendMode.srcIn,
          ),
        ),
        icon: SvgPicture.asset('assets/images/walletsvg.svg'),
        label: 'Orders',
      ),
      BottomNavigationBarItem(
        activeIcon: SvgPicture.asset(
          'assets/images/acountsvg.svg',
          colorFilter: ColorFilter.mode(
            Theme.of(context).primaryColor,
            BlendMode.srcIn,
          ),
        ),
        icon: SvgPicture.asset('assets/images/acountsvg.svg'),
        label: 'Account',
      ),
    ];
const String kClothesSvgPath = 'assets/images/clothes3.svg';
const String kjewelrySvgPath = 'assets/images/jewelry.svg';

const String kElectonicsSvgPath = 'assets/images/Electronics.svg';
const String kKitchenSvgPath = 'assets/images/kitchen.svg';
const String kbagsSvgPath = 'assets/images/bags.svg';
const String kToysSvgPath = 'assets/images/bags.svg';
const String kwatchSvgPath = 'assets/images/watch.svg';
const String kShoesSvgPath = 'assets/images/watch.svg';
const String kClothes = 'Clothes';
const String kjewelry = 'jewelry';
const String kElectonics = 'Electonics';
const String kKitchen = 'Kitchen';
const String kbags = 'bags';
const String kToys = 'Toys';
const String kwatch = 'watch';
const String kShoes = 'Shoes';
const String konbording1 = 'assets/images/onbording1.svg';
const String konbording2 = 'assets/images/onbording2.svg';
const String konbording3 = 'assets/images/onbording3.svg';
const String konbording4 = 'assets/images/onbording4.svg';
const String kHeartSvgPath = 'assets/images/heart2.svg';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: const Color(0xFFFFCC06),
  buttonTheme: const ButtonThemeData(buttonColor: Colors.blue),
  textTheme: TextTheme(
    bodyLarge: const TextTheme(
      bodyLarge: TextStyle(),
    ).bodyLarge!.copyWith(color: Colors.black, fontSize: 28),
    bodyMedium: const TextTheme(
      bodyLarge: TextStyle(),
    ).bodyLarge!.copyWith(color: Colors.black, fontSize: 18),
    bodySmall: const TextTheme(
      bodyLarge: TextStyle(),
    ).bodyLarge!.copyWith(color: Colors.black, fontSize: 12),
  ),
  // Define other light theme properties
);
List<String> photos = [
  'https://img.freepik.com/free-photo/shoes_1203-8154.jpg?t=st=1734953579~exp=1734957179~hmac=39f21acad9446b4e89b2dca1898f80889a702aa571f996050a8d0959f2e6b4dd&w=740',
  'https://img.freepik.com/free-photo/men-shoes_1203-8652.jpg?t=st=1734897670~exp=1734901270~hmac=76e523bf76970ba600c7e20ef12e1f00fc798f80cc28b4ba471ee8dd8e5e1bf8&w=740',
  'https://img.freepik.com/free-vector/hand-drawn-pantry_23-2148708473.jpg?t=st=1734952252~exp=1734955852~hmac=45fc98544e054a6b46b6af2f84b426737544f9a2cbceeafb7dbdf8c4b2ba2c6a&w=740',
  'https://img.freepik.com/free-vector/fitness-supplements-bottles-composition_1284-23337.jpg?t=st=1734952268~exp=1734955868~hmac=410fafcc8de2989105a6bc6b9bbb39d7750b7584cecf19be8a1d42c17dba9338&w=740',
  'https://img.freepik.com/free-photo/selfcare-products-arrangement-still-life_23-2149249573.jpg?t=st=1734952331~exp=1734955931~hmac=601b5829f7b55e7cbbadb8fb35b6472fe84fc1e624cb4bc1c7a7e15b6c77b067&w=360',
  'https://img.freepik.com/free-vector/hand-drawn-pantry_23-2148708473.jpg?t=st=1734952252~exp=1734955852~hmac=45fc98544e054a6b46b6af2f84b426737544f9a2cbceeafb7dbdf8c4b2ba2c6a&w=740',
];

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: const Color(0xFFFFCC06),
  buttonTheme: const ButtonThemeData(buttonColor: Colors.blueGrey),
  textTheme: TextTheme(
    bodyLarge: const TextTheme(
      bodyLarge: TextStyle(),
    ).bodyLarge!.copyWith(color: Colors.white, fontSize: 28),
    bodyMedium: const TextTheme(
      bodyLarge: TextStyle(),
    ).bodyLarge!.copyWith(color: Colors.white, fontSize: 18),
    bodySmall: const TextTheme(
      bodyLarge: TextStyle(),
    ).bodyLarge!.copyWith(color: Colors.white, fontSize: 12),
  ),
  // Define other dark theme properties
);
const String kRubikBlack = 'Rubik';
const String kRubikBlackItalic = 'RubikBlackItalic';
const String kRubikBold = 'RubikBold';
const String kRubikBoldItalic = 'RubikBoldItalic';
const String kRubikRubikLight = 'RubikLight';
const String kRubikRubikLightItalic = 'RubikLightItalic';
const String kRubikRubikMediumItalic = 'RubikMediumItalic';
const String kRubikRubikRegular = 'RubikRegular';
const String kRubikRubikMedium = 'RubikMedium';
const String kSwiss721Black = 'Swiss721Black';
const String kSwiss721Bold = 'Swiss721Bold';
  // final ImagePicker picker = ImagePicker();
  // File? profileimage;
  // Future<void> pickProfileImage() async {
  //   final pickedImage = await picker.pickImage(source: ImageSource.gallery);
  //   if (pickedImage != null) {
  //     profileimage = File(pickedImage.path);
  //     emit(SocialPickedProfileImageSuccesState());
  //   } else {
  //     print('No  Image Selected');
  //     emit(SocialPickedProfileImageSuccesState());
  //   }
  // }





//   import 'package:flutter/material.dart';  

// void main() => runApp(GenderSelectionApp());  

// class GenderSelectionApp extends StatelessWidget {  
//   @override  
//   Widget build(BuildContext context) {  
//     return MaterialApp(  
//       home: Scaffold(  
//         appBar: AppBar(title: Text('Gender Selection')),  
//         body: GenderSelection(),  
//       ),  
//     );  
//   }  
// }  

// class GenderSelection extends StatefulWidget {  
//   @override  
//   _GenderSelectionState createState() => _GenderSelectionState();  
// }  

// class _GenderSelectionState extends State<GenderSelection> {  
//   String? _gender;  

//   @override  
//   Widget build(BuildContext context) {  
//     return Column(  
//       mainAxisAlignment: MainAxisAlignment.center,  
//       children: <Widget>[  
//         Text('Select Gender:'),  
//         RadioListTile(  
//           title: Text('Male'),  
//           value: 'Male',  
//           groupValue: _gender,  
//           onChanged: (value) {  
//             setState(() {  
//               _gender = value as String?;  
//             });  
//           },  
//         ),  
//         RadioListTile(  
//           title: Text('Female'),  
//           value: 'Female',  
//           groupValue: _gender,  
//           onChanged: (value) {  
//             setState(() {  
//               _gender = value as String?;  
//             });  
//           },  
//         ),  
//         RadioListTile(  
//           title: Text('Other'),  
//           value: 'Other',  
//           groupValue: _gender,  
//           onChanged: (value) {  
//             setState(() {  
//               _gender = value as String?;  
//             });  
//           },  
//         ),  
//       ],  
//     );  
//   }  
// }