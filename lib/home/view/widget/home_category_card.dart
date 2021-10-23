import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mhh_shop/app_theme/app_theme.dart';

class HomeCategoryCard extends StatefulWidget {
  final String categoryName;
  const HomeCategoryCard({Key? key, required this.categoryName})
      : super(key: key);

  @override
  _HomeCategoryCardState createState() => _HomeCategoryCardState();
}

class _HomeCategoryCardState extends State<HomeCategoryCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        //padding: EdgeInsets.symmetric(horizontal: 20),
        width: 80,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(color: AppTheme.lightGrey)),
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Icon(
                  Icons.category_outlined,
                  size: 35,
                  color: AppTheme.colorPrimary,
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "${widget.categoryName}",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(fontSize: 12),
            )
          ],
        ),
      ),
    );
  }
}
