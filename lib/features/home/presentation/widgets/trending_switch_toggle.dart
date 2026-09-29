import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_verse/features/home/presentation/cubit/trending_tab_cubit.dart';
import 'package:movie_verse/core/theme/app_colors.dart';

class TrendingTabSwitchToggle extends StatelessWidget {
  final VoidCallback today;
  final VoidCallback weak;
  const TrendingTabSwitchToggle({
    super.key,
    required this.today,
    required this.weak,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrendingTabCubit, int>(
      builder: (context, itemCount) {
        return Container(
          height: 29,
          decoration: BoxDecoration(
            color: AppColors.midNight,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.secondary),
          ),
        
          child: Stack(
            children: [
              AnimatedAlign(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInOut,
                alignment: itemCount == 0
                    ? Alignment.centerLeft
                    : Alignment.centerRight,
                child: FractionallySizedBox(
                  widthFactor: 0.5,
                  heightFactor: 1.0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.purple,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
        
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: today,
                      child: _textItem(
                        text: "Today",
                        color: itemCount == 0 ? Colors.white : AppColors.primaryOverlay,
                      ),
                    ),
                  ),
        
                  Expanded(
                    child: GestureDetector(
                      onTap: weak,
                      child: _textItem(
                        text: "This Week",
                        color: itemCount == 1 ? Colors.white : AppColors.primaryOverlay
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _textItem({required String text, Color? color}) {
    return Center(
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontSize: 15,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

