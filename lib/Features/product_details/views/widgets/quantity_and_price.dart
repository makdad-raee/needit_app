import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:needit_app/Features/Add%20to%20cart/Domain/Entities/cart_entity.dart';
import 'package:needit_app/Features/Add%20to%20cart/presentation/bloc/my_cart_bloc.dart';
import 'package:needit_app/Features/product_details/Domain/Entities/details_entity.dart';
import 'package:needit_app/constant.dart';

class QuantityAndPrice extends StatefulWidget {
  const QuantityAndPrice({super.key, required this.detailsModel});
  final DetailsEntity detailsModel;

  @override
  State<QuantityAndPrice> createState() => _QuantityAndPriceState();
}

class _QuantityAndPriceState extends State<QuantityAndPrice> {
  int _counter = 1;

  void incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void minusCounter() {
    setState(() {
      if (_counter > 1) {
        _counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Quantity',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontSize: 18,
                fontFamily: kSwiss721Bold,

                //color: Colors.black38,
              ),
            ),
            const SizedBox(width: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              height: 37,
              width: 118,
              decoration: BoxDecoration(
                color: const Color(0xffE7E7E7),
                borderRadius: BorderRadius.circular(19),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: minusCounter,
                    child: const Icon(Icons.remove, color: Colors.black),
                  ),
                  Text(
                    '$_counter',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontSize: 12,
                      fontFamily: kSwiss721Black,
                      //color: Colors.black38,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  GestureDetector(
                    onTap: incrementCounter,
                    child: const Icon(Icons.add, color: Colors.black),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 17),
        const Divider(thickness: 1, color: Color(0xffE7E7E7)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Text(
                  'Total price',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 12,
                    fontFamily: kRubikRubikMedium,
                    color: Colors.black38,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  '\$ ${(widget.detailsModel.price * _counter).toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: 22,
                    fontFamily: kSwiss721Black,
                    //color: Colors.black38,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(width: 10),
            Expanded(
              child: Container(
                height: 50,
                //   width: MediaQuery.of(context).size.width * 0.55,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ValueListenableBuilder(
                  valueListenable: colorNotifier,
                  builder:
                      (context, value1, child) => ValueListenableBuilder(
                        valueListenable: sizeNotifier,
                        builder:
                            (context, value, child) => GestureDetector(
                              onTap: () {
                                print('add to cart button');
                                BlocProvider.of<MyCartBloc>(context).add(
                                  AddToCartEvent(
                                    id: widget.detailsModel.id,
                                    cartEntity: CartEntity(
                                      priceOnePiesce: widget.detailsModel.price,
                                      name: widget.detailsModel.name,
                                      totalPRice:
                                          widget.detailsModel.price *
                                          _counter.toDouble(),
                                      quantity: _counter,
                                      color:
                                          value1 == '' ? null : value1, //null,
                                      size: value == '' ? null : value,
                                      imageUrl:
                                          widget.detailsModel.imageUrl ?? '',
                                      id: widget.detailsModel.id,
                                    ),
                                  ),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Row(
                                      children: [
                                        Text(
                                          'Added to cart',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        Icon(
                                          Icons.check_circle_outline_outlined,
                                          color: Colors.green,
                                        ),
                                      ],
                                    ),
                                    backgroundColor: Colors.white,
                                    duration: Duration(seconds: 2),
                                  ),
                                );
                                setState(() {
                                  sizeNotifier.value = '';
                                  colorNotifier.value = '';
                                });
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    'assets/images/lock.svg',
                                    colorFilter: const ColorFilter.mode(
                                      kprimaryColor,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    'Add to Cart',
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodyMedium!.copyWith(
                                      fontSize: 16,
                                      fontFamily: kSwiss721Bold,
                                      //color: Colors.black38,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                      ),
                ),
              ),
            ),
          ],
        ),
        // const SizedBox(
        //   height: 8,
        // )
      ],
    );
  }
}
