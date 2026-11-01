import 'package:electronic_ptoject/Features/Cart/Presentation/Cubit/cart_cubit.dart';
import 'package:electronic_ptoject/Features/Cart/Presentation/Cubit/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardItemInfo extends StatelessWidget {
  const CardItemInfo({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.quantity,
    required this.min,
    required this.plus,
    required this.dele,
  });

  final String imageUrl;
  final String title;
  final double price;
  final int quantity;
  final VoidCallback min;
  final VoidCallback plus;
  final VoidCallback dele;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsGeometry.all(10),
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: ShapeDecoration(
        color: Theme.of(context).colorScheme.surface,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: const Color(0xFFEAE6E1)),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: ShapeDecoration(
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.contain,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: AlignmentGeometry.centerLeft,
              margin: EdgeInsetsGeometry.only(left: 5),
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                textAlign: TextAlign.right,
                style: TextStyle(
                  // color: const Color(0xFF1C1917),
                  fontSize: 15,
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),

          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 16,
            children: [
              Text(
                '$price',
                style: TextStyle(
                  color: const Color(0xFFC2410C),
                  fontSize: 20,
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.w800,
                ),
              ),
              Container(
                height: 30,
                padding: const EdgeInsets.symmetric(horizontal: 5),
                decoration: ShapeDecoration(
                  color: const Color(0xFFFAF9F6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 15,
                  children: [
                    InkWell(
                      onTap: min,
                      child: Text(
                        '-',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),

                    Text(
                      '$quantity',
                      style: TextStyle(
                        color: const Color(0xFF1C1917),
                        fontSize: 15,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    InkWell(
                      onTap: plus,
                      child: Text(
                        '+',
                        style: TextStyle(
                          color: const Color(0xFF1C1917),
                          fontSize: 20,
                          fontFamily: 'Cairo',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          IconButton(
            onPressed: dele,
            icon: Icon(Icons.restore_from_trash_outlined),
          ),
        ],
      ),
    );
  }
}
