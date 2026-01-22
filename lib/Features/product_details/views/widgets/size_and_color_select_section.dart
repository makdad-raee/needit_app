import 'package:flutter/material.dart';
import 'package:needit_app/Features/product_details/Domain/Entities/details_entity.dart';
import 'package:needit_app/Features/product_details/views/widgets/color_circle_select.dart';
import 'package:needit_app/Features/product_details/views/widgets/size_circle_select.dart';
import 'package:needit_app/constant.dart';

class SizeAndColorSelectSection extends StatefulWidget {
  const SizeAndColorSelectSection({super.key, required this.detailsModel});
  final DetailsEntity detailsModel;

  @override
  State<SizeAndColorSelectSection> createState() =>
      _SizeAndColorSelectSectionState();
}

class _SizeAndColorSelectSectionState extends State<SizeAndColorSelectSection> {
  List isBlack = [false, false, false];

  void changeColor(int index) {
    setState(() {
      for (int i = 0; i < isBlack.length; i++) {
        isBlack[i] = i == index;
      }
    });
  }

  List isSelected = [false, false, false, false, false, false];
  void changeCheckIcon(int index) {
    setState(() {
      for (int i = 0; i < isBlack.length; i++) {
        isSelected[i] = i == index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Size',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 18,
                  fontFamily: kSwiss721Bold,
                  //color: Colors.black38,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 46,
                width: 120,
                child: ListView.separated(
                  padding: EdgeInsets.zero,
                  separatorBuilder:
                      (context, index) => const SizedBox(width: 4),
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.detailsModel.sizes!.length,
                  itemBuilder:
                      (context, index) => GestureDetector(
                        onTap: () {
                          setState(() {
                            changeColor(index);
                            colorNotifier.value =
                                widget.detailsModel.colors![index].hex;
                          });
                        },
                        child: SizeCircle(
                          color: isBlack[index] ? Colors.black : Colors.white,
                          size:
                              widget
                                  .detailsModel
                                  .sizes![index]
                                  .name
                                  .characters
                                  .first
                                  .toUpperCase(),
                        ),
                      ),
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Color',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: 18,
                  fontFamily: kSwiss721Bold,
                  //color: Colors.black38,
                  //  fontWeight: FontWeight.w400
                ),
              ),
              SizedBox(
                height: 46,
                width: 120,
                child: ListView.separated(
                  padding: EdgeInsets.zero,
                  separatorBuilder:
                      (context, index) => const SizedBox(width: 4),
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.detailsModel.colors!.length,
                  itemBuilder:
                      (context, index) => GestureDetector(
                        onTap: () {
                          changeCheckIcon(index);
                          sizeNotifier.value =
                              widget.detailsModel.sizes![index].name;
                        },
                        child: ColorCircle(
                          isSelected: isSelected[index],
                          color: Color(
                            int.parse(
                              '0xff${widget.detailsModel.colors![index].hex.substring(1)}',
                            ),
                          ),
                        ),
                      ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
