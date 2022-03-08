
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/views/widgets/custom_text.dart';

import '../constance.dart';
import '../core/view_model/home_view_model.dart';
import 'daetilas_view.dart';

class HomeView extends StatelessWidget {
  final List<String> names = <String>[
    'men',
    's',
    's',
    's',
    's',
    's',
    's',
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: Get.find<HomeViewModel>(),
      builder: (controller) => controller.loading.value
          ? const Center(child: CircularProgressIndicator())
          : Scaffold(
              body: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
                  child: Column(
                    children: [
                      _searchTextFormField(),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomText(
                        text: "Categories",
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      _listViewCategory(),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: "Best Selling",
                            fontSize: 18,
                          ),
                          CustomText(
                            text: "See all",
                            fontSize: 16,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      _listViewProducts(),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  Widget _searchTextFormField() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey.shade200,
      ),
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _listViewCategory() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Container(
        height: 100,
        child: ListView.separated(
          itemCount: controller.categoryModel.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey.shade100,
                  ),
                  height: 60,
                  width: 60,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(controller.categoryModel[index].image!),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                CustomText(
                  text: controller.categoryModel[index].image!,
                ),
              ],
            );
          },
          separatorBuilder: (context, index) => SizedBox(
            width: 20,
          ),
        ),
      ),
    );
  }

  Widget _listViewProducts() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Container(
        height: 350,
        child: ListView.separated(
          itemCount: controller.dealModel.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.to(DetailsView(
                  model: controller.dealModel[index],
                ));
              },
              child: Container(
                width: MediaQuery.of(context).size.width * .4,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.grey.shade100,
                      ),
                      child: Container(
                          height: 220,
                          width: MediaQuery.of(context).size.width * .4,
                          child: Image.network(
                            controller.dealModel[index].image!,
                            fit: BoxFit.fill,
                          )),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomText(
                      text: controller.dealModel[index].name!,
                      alignment: Alignment.bottomLeft,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: CustomText(
                        text: controller.dealModel[index].name!,
                        color: Colors.grey,
                        alignment: Alignment.bottomLeft,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomText(
                      text: controller.dealModel[index].name.toString() +
                          " \$",
                      color: primaryColor,
                      alignment: Alignment.bottomLeft,
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => SizedBox(
            width: 20,
          ),
        ),
      ),
    );
  }
}
