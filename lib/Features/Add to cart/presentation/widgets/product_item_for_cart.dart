import 'package:flutter/material.dart';
import 'package:needit_app/Features/Add%20to%20cart/Domain/Entities/cart_entity.dart';
import 'package:needit_app/Features/Add%20to%20cart/presentation/widgets/bottom_sheet_widget_for_delete.dart';
import 'package:needit_app/constant.dart';

class ProductItemForCart extends StatefulWidget {
  const ProductItemForCart({super.key, required this.cartList});
  final CartEntity cartList;

  @override
  State<ProductItemForCart> createState() => _ProductItemForCartState();
}

class _ProductItemForCartState extends State<ProductItemForCart> {
  int _counter = 1;

  void incrementCounter({required double price}) {
    setState(() {
      _counter++;

      setState(() {});
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
    int counterOfProducts = widget.cartList.quantity;
    double price = widget.cartList.totalPRice / widget.cartList.quantity;
    int indexOfcrt = cartentityNotifer.value.indexWhere(
      (cartEntity) => cartEntity.id == widget.cartList.id,
    );
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Container(
            height: 152,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(22),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  offset: Offset(0, 0),
                  blurRadius: 20,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  child: Container(
                    height: 117,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      // border: Border.all(color: Colors.grey, width: 1),
                      color: Colors.white,
                    ),
                    child: Image.network(
                      fit: BoxFit.contain,
                      widget.cartList.imageUrl ??
                          'https://img.freepik.com/free-photo/forklift-boxes-arrangement_23-2149853118.jpg?t=st=1723569462~exp=1723573062~hmac=db877b441335a64500852f42152f9220ad73c496720648342b8bb2130bccbafa&w=740',
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 120,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Text(
                                  widget.cartList.name,
                                  //  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                  ),
                                ),
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {
                                _showBottomSheet(context, widget.cartList);
                              },
                              icon: const Icon(Icons.delete),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Row(
                              children: [
                                widget.cartList.color == null
                                    ? const SizedBox()
                                    : CircleAvatar(
                                      radius: 6,
                                      backgroundColor: Color(
                                        int.parse(
                                          '0xff${widget.cartList.color!.substring(1)}',
                                        ),
                                      ),
                                    ),
                                SizedBox(width: 4),
                                widget.cartList.color == null
                                    ? const SizedBox()
                                    : Text(
                                      'color ',
                                      style: Theme.of(
                                        context,
                                      ).textTheme.titleSmall!.copyWith(
                                        fontFamily: kRubikRubikRegular,
                                        fontSize: 12,
                                        color: Colors.grey,
                                      ),
                                    ),
                              ],
                            ),
                            widget.cartList.color == null
                                ? const SizedBox()
                                : const Text(
                                  '|',
                                  style: TextStyle(color: Colors.grey),
                                ),
                            widget.cartList.size == null
                                ? const SizedBox()
                                : Text(
                                  ' Size =${widget.cartList.size}',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.titleSmall!.copyWith(
                                    fontFamily: kRubikRubikRegular,
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.18,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Text(
                                  "${(price * (_counter + counterOfProducts)) //nnote
                                  .toStringAsFixed(2)}\$'",
                                  // '${(widget.cartList.totalPRice).toStringAsFixed(2)} \$',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.bodyLarge!.copyWith(
                                    fontFamily: kRubikBold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 37,
                              width: 100,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(19),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      print(counterOfProducts);
                                      setState(() {});
                                      //note
                                      if (counterOfProducts > 1) {
                                        counterOfProducts--;
                                        cartentityNotifer
                                                .value[indexOfcrt]
                                                .totalPRice =
                                            price * counterOfProducts;
                                        cartentityNotifer
                                            .value[indexOfcrt]
                                            .quantity = cartentityNotifer
                                                .value[indexOfcrt]
                                                .quantity -
                                            1;
                                        print('===============');
                                        print(
                                          cartentityNotifer
                                              .value[indexOfcrt]
                                              .quantity,
                                        );
                                        print('===============');
                                        print(
                                          cartentityNotifer
                                              .value[indexOfcrt]
                                              .quantity,
                                        );
                                        setState(() {});
                                      }
                                    },
                                    child: const Icon(
                                      Icons.remove,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    '$counterOfProducts', //note
                                    style: ktextStyle16,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      print(counterOfProducts);
                                      setState(() {});
                                      //note
                                      if (counterOfProducts > 0) {
                                        counterOfProducts++;
                                        cartentityNotifer
                                                .value[indexOfcrt]
                                                .totalPRice =
                                            price * counterOfProducts;
                                        cartentityNotifer
                                            .value[indexOfcrt]
                                            .quantity = cartentityNotifer
                                                .value[indexOfcrt]
                                                .quantity +
                                            1;
                                        print('===============');
                                        print(
                                          cartentityNotifer
                                              .value[indexOfcrt]
                                              .quantity,
                                        );
                                        print('===============');
                                        print(
                                          cartentityNotifer
                                              .value[indexOfcrt]
                                              .quantity,
                                        );
                                        setState(() {});
                                      }
                                      // incrementCounter(price: price); //note
                                    },
                                    child: const Icon(
                                      Icons.add,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _showBottomSheet(BuildContext context, CartEntity cartDele) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return BottomsheetWidgetForDelete(
          productItemForCart: widget,
          cartList: cartDele,
        );
      },
    );
  }
}
