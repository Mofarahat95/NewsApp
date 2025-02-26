import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/core/utils/colors_manager.dart';
import 'package:news/core/utils/fonts_manager.dart';
import 'values_manager.dart';

TextStyle exo22() => GoogleFonts.exo(
  fontSize: AppSize.s22,
  fontWeight: FontWeightManager.normal,
  color: AppColors.whiteColor,
);

TextStyle exo14() => GoogleFonts.exo(
  fontSize: AppSize.s14,
  fontWeight: FontWeightManager.normal,
  color: AppColors.whiteColor,
);


TextStyle poppins() => GoogleFonts.poppins(
      fontSize: AppSize.s22,
      fontWeight: FontWeightManager.bold,
      color: AppColors.titleTextColor,
    );

TextStyle poppins13() => GoogleFonts.poppins(
      fontSize: AppSize.s13,
      fontWeight: FontWeightManager.light,
      color: AppColors.bodyTextColor,
    );

TextStyle poppins14() => GoogleFonts.poppins(
      fontSize: AppSize.s14,
      fontWeight: FontWeightManager.medium,
      color: AppColors.titleTextColor,
    );

TextStyle poppins10() => GoogleFonts.poppins(
      fontSize: AppSize.s10,
      fontWeight: FontWeightManager.normal,
      color: AppColors.bodyGrayColor,
    );
