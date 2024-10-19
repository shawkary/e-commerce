import 'package:flutter/material.dart';
import 'package:ibrahim_project/core/utiles/cache_helper.dart';
import 'package:ibrahim_project/core/utiles/styles.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../../core/utiles/components.dart';
import '../../../../login/presentation/views/login_view.dart';
import 'boarding_model.dart';


class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController();
    bool isLast = false;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: PageView.builder(
              onPageChanged: (index)
              {
                if(index == 2){
                  CacheHelper.saveData(key: 'isLast', value: true);
                  isLast = true;
                }else{
                  isLast = false;
                }
              },
              controller: controller,
              itemBuilder: (context, index){
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Image(image: AssetImage('assets/images/shopping.png')),
                    const SizedBox(height: 20),
                    Align(alignment: Alignment.bottomLeft,
                      child: Text(lst[index].title,
                        style: Styles.textStyle30),
                    ),
                    Align(alignment: Alignment.bottomLeft,
                        child: Text(lst[index].onBoarding, style: Styles.textStyle20.copyWith(
                          color: Colors.grey,
                        )))
                  ],
                );
              },
              itemCount: lst.length,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SmoothPageIndicator(
                controller: controller,
                count: lst.length,
                effect: const ExpandingDotsEffect(
                  activeDotColor: Colors.blue,
                ),
              ),
              FloatingActionButton(
                backgroundColor: Colors.blue,
                onPressed: ()
                {
                  if(isLast){
                    navigateTo(context, const LoginView());
                  }
                  controller.nextPage(
                      duration: const Duration(milliseconds: 700),
                      curve: Curves.decelerate);
                },
                child: const Icon(Icons.arrow_forward_ios, color: Colors.white,),
              )
            ],
          ),
        ],
      ),
    );
  }
}

