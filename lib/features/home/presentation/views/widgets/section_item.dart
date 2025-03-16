import 'package:admin_quiz/core/functions/get_responsive_size.dart';
import 'package:admin_quiz/core/utilities/app_styles.dart';
import 'package:admin_quiz/core/widgets/custom_card.dart';
import 'package:admin_quiz/features/home/presentation/views/view_model/section_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class SectionItem extends StatelessWidget {
  const SectionItem({
    super.key,
    required this.sectionItemModel
  });
  final SectionItemModel sectionItemModel;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            fit: BoxFit.fill,
            sectionItemModel.image,
            width: getResponsiveSize(context, 60),
            height: getResponsiveSize(context, 60),
          ),
          SizedBox(
            height: getResponsiveSize(context, 10),
          ),
          Text(
            sectionItemModel.text,
            style: AppStyles.semiBoldTextStyle16(context),
          ),
        ],
      ),
    );
  }
}
