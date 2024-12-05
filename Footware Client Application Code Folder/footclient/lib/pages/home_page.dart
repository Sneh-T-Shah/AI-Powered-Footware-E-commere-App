// import 'package:flutter/material.dart';
// import 'package:footclient/Widgets/multi_selected_drop_down.dart';
// import 'package:footclient/pages/login_page.dart';
// import 'package:footclient/pages/product_description_page.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import '../Controller/home_controller.dart';
// import '../Widgets/drop_down_button.dart';
// import '../Widgets/product_card.dart';
//
// class HomePage extends StatelessWidget {
//   const HomePage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<HomeController>(builder: (ctrl) {
//       return RefreshIndicator(
//
//         onRefresh: () async{
//            await ctrl.fetchProducts();
//         },
//         child: Scaffold(
//           appBar: AppBar(
//             backgroundColor: Colors.blueGrey[50],
//             title: const Center(
//               child: Text(
//                 'XFOOTWARE STORE',
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             // backgroundColor: Colors.blue,
//             actions: [
//               IconButton(
//                 onPressed: () {
//                   GetStorage box = GetStorage();
//                   box.erase();
//                   Get.offAll(LoginPage());
//                 },
//                 icon: Icon(Icons.logout),
//               ),
//             ],
//           ),
//           body: Column(
//             children: [
//               SizedBox(
//                 height: 60,
//                 child: ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: ctrl.products.length,//
//                   itemBuilder: (context, index) {
//                     return Container(
//                       margin: EdgeInsets.all(10),
//                       decoration: BoxDecoration(
//                         color: Colors.blueGrey[50],
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       padding:EdgeInsets.only(left: 12, right: 12, top: 10, bottom: 10),
//                       child: Center(
//                         child: Text(
//                           ctrl.products[index].category ??
//                           'Category',
//                           style: TextStyle(fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//               Row(
//                 children: [
//                   Flexible(
//                       child: MultiSelectedDropDown(
//                         items: ['Puma', 'Adidas', 'Skechers', 'Nike'],
//                         onSelectedChanged: (selectedItems) {},
//                       )),
//                   Flexible(
//                       child: DropDownButton(
//                         items: ['Rs. Low to High', 'Rs. High to Low'],
//                         SelectedItemText: 'Sort by Price',
//                         onSelected: (selected) {},
//                       )),
//                 ],
//               ),
//               Expanded(
//                 child: GridView.builder(
//                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 2,
//                         childAspectRatio: 0.8,
//                         crossAxisSpacing: 8,
//                         mainAxisSpacing: 10),
//                     itemCount: ctrl.products.length,
//                     itemBuilder: (context, index) {
//                       return ProductCard(
//                         name: ctrl.products[index].name ?? 'No name',
//                         imageUrl: ctrl.products[index].image ?? 'url',
//                         price: ctrl.products[index].price ?? 0.0,
//                         offerTag: '20 % off',
//                         onTap: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) =>
//                                       ProductDescriptionPage()));
//                         },
//                       );
//                     }),
//               )
//             ],
//           ),
//         ),
//       );
//     });
//   }
// }



















// import 'package:flutter/material.dart';
// import 'package:footclient/Widgets/multi_selected_drop_down.dart';
// import 'package:footclient/pages/login_page.dart';
// import 'package:footclient/pages/product_description_page.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import '../Controller/home_controller.dart';
// import '../Widgets/drop_down_button.dart';
// import '../Widgets/product_card.dart';
//
// class HomePage extends StatelessWidget {
//   const HomePage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<HomeController>(
//       init: HomeController(),
//       builder: (ctrl) {
//         if (ctrl.products.isEmpty) {
//           return Scaffold(
//             appBar: AppBar(
//               backgroundColor: Colors.blueGrey[50],
//               title: const Center(
//                 child: Text(
//                   'XFOOTWARE STORE',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               actions: [
//                 IconButton(
//                   onPressed: () {
//                     GetStorage box = GetStorage();
//                     box.erase();
//                     Get.offAll(LoginPage());
//                   },
//                   icon: Icon(Icons.logout),
//                 ),
//               ],
//             ),
//             body: Center(child: CircularProgressIndicator()),
//           );
//         } else {
//           return Scaffold(
//             appBar: AppBar(
//               backgroundColor: Colors.blueGrey[50],
//               title: const Center(
//                 child: Text(
//                   'XFOOTWARE STORE',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               actions: [
//                 IconButton(
//                   onPressed: () {
//                     GetStorage box = GetStorage();
//                     box.erase();
//                     Get.offAll(LoginPage());
//                   },
//                   icon: Icon(Icons.logout),
//                 ),
//               ],
//             ),
//             body: Column(
//               children: [
//                 SizedBox(
//                   height: 60,
//                   child: ListView.builder(
//                     scrollDirection: Axis.horizontal,
//                     itemCount: ctrl.products.length,
//                     itemBuilder: (context, index) {
//                       return Container(
//                         margin: EdgeInsets.all(10),
//                         decoration: BoxDecoration(
//                           color: Colors.blueGrey[50],
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                         padding: const EdgeInsets.only(left: 12, right: 12, top: 10, bottom: 10),
//                         child: Center(
//                           child: Text(
//                             ctrl.products[index].category ?? 'Category',
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//                 Row(
//                   children: [
//                     Flexible(
//                       child: MultiSelectedDropDown(
//                         items: ['Puma', 'Adidas', 'Skechers', 'Nike'],
//                         onSelectedChanged: (selectedItems) {},
//                       ),
//                     ),
//                     Flexible(
//                       child: DropDownButton(
//                         items: ['Rs. Low to High', 'Rs. High to Low'],
//                         SelectedItemText: 'Sort by Price',
//                         onSelected: (selected) {},
//                       ),
//                     ),
//                   ],
//                 ),
//                 Expanded(
//                   child: GridView.builder(
//                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,
//                       childAspectRatio: 0.8,
//                       crossAxisSpacing: 8,
//                       mainAxisSpacing: 10,
//                     ),
//                     itemCount: ctrl.products.length,
//                     itemBuilder: (context, index) {
//                       return ProductCard(
//                         name: ctrl.products[index].name ?? 'No name',
//                         imageUrl: ctrl.products[index].image ?? 'url',
//                         price: ctrl.products[index].price ?? 00,
//                         offerTag: '20 % off',
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => ProductDescriptionPage(),
//                             ),
//                           );
//                         },
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           );
//         }
//       },
//     );
//   }
// }



























// import 'package:flutter/material.dart';
// import 'package:footclient/Widgets/multi_selected_drop_down.dart';
// import 'package:footclient/pages/login_page.dart';
// import 'package:footclient/pages/product_description_page.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import '../Controller/home_controller.dart';
// import '../Widgets/drop_down_button.dart';
// import '../Widgets/product_card.dart';
//
// class HomePage extends StatelessWidget {
//   const HomePage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<HomeController>(
//       init: HomeController(),
//       builder: (ctrl) {
//         if (ctrl.products.isEmpty) {
//           return Scaffold(
//             appBar: AppBar(
//               backgroundColor: Colors.blueGrey[50],
//               title: const Center(
//                 child: Text(
//                   'XFOOTWARE STORE',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               actions: [
//                 IconButton(
//                   onPressed: () {
//                     GetStorage box = GetStorage();
//                     box.erase();
//                     Get.offAll(LoginPage());
//                   },
//                   icon: Icon(Icons.logout),
//                 ),
//               ],
//             ),
//             body: Center(child: CircularProgressIndicator()),
//           );
//         } else {
//           return Scaffold(
//             appBar: AppBar(
//               backgroundColor: Colors.blueGrey[50],
//               title: const Center(
//                 child: Text(
//                   'XFOOTWARE STORE',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               actions: [
//                 IconButton(
//                   onPressed: () {
//                     GetStorage box = GetStorage();
//                     box.erase();
//                     Get.offAll(LoginPage());
//                   },
//                   icon: Icon(Icons.logout),
//                 ),
//               ],
//             ),
//             body: Column(
//               children: [
//                 SizedBox(
//                   height: 60,
//                   child: ListView.builder(
//                     scrollDirection: Axis.horizontal,
//                     itemCount: ctrl.products.length,
//                     itemBuilder: (context, index) {
//                       return Container(
//                         margin: EdgeInsets.all(10),
//                         decoration: BoxDecoration(
//                           color: Colors.blueGrey[50],
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                         padding: const EdgeInsets.only(
//                             left: 12, right: 12, top: 10, bottom: 10),
//                         child: Center(
//                           child: Text(
//                             'Category',
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//                 Row(
//                   children: [
//                     Flexible(
//                       child: MultiSelectedDropDown(
//                         items: ['Puma', 'Adidas', 'Skechers', 'Nike'],
//                         onSelectedChanged: (selectedItems) {},
//                       ),
//                     ),
//                     Flexible(
//                       child: DropDownButton(
//                         items: ['Rs. Low to High', 'Rs. High to Low'],
//                         SelectedItemText: 'Sort by Price',
//                         onSelected: (selected) {},
//                       ),
//                     ),
//                   ],
//                 ),
//                 Expanded(
//                   child: GridView.builder(
//                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,
//                       childAspectRatio: 0.8,
//                       crossAxisSpacing: 8,
//                       mainAxisSpacing: 10,
//                     ),
//                     itemCount: ctrl.products.length,
//                     itemBuilder: (context, index) {
//                       return ProductCard(
//                         name: ctrl.products[index].name ?? 'No name',
//                         imageUrl: ctrl.products[index].image ?? 'url',
//                         price: ctrl.products[index].price ?? 0,
//                         offerTag: '20 % off',
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) =>
//                                   ProductDescriptionPage(),
//                             ),
//                           );
//                         },
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           );
//         }
//       },
//     );
//   }
// }















import 'package:flutter/material.dart';
import 'package:footclient/Widgets/multi_selected_drop_down.dart';
import 'package:footclient/pages/login_page.dart';
import 'package:footclient/pages/product_description_page.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../Controller/home_controller.dart';
import '../Widgets/drop_down_button.dart';
import '../Widgets/product_card.dart';
import 'package:footclient/pages/shoe_classifier_page.dart'; // Import your AI feature page

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) {
      return RefreshIndicator(
        onRefresh: () async {
          await ctrl.fetchProducts();
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueGrey[50],
            title: const Center(
              child: Text(
                'XFOOTWARE STORE',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ShoeClassifierApp()),
                  );
                  // Add functionality for AI feature here
                  Get.snackbar("AI Feature", "AI feature is under development!",
                      snackPosition: SnackPosition.BOTTOM);
                },
                icon: Icon(Icons.smart_toy_outlined, color: Colors.black), // AI Icon
              ),
              IconButton(
                onPressed: () {
                  GetStorage box = GetStorage();
                  box.erase();
                  Get.offAll(LoginPage());
                },
                icon: Icon(Icons.logout),
              ),
            ],
          ),
          body: Column(
            children: [
              SizedBox(
                height: 60,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: ctrl.products.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.blueGrey[50],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.only(
                          left: 12, right: 12, top: 10, bottom: 10),
                      child: Center(
                        child: Text(
                          ctrl.products[index].category ?? 'Category',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Row(
                children: [
                  Flexible(
                    child: MultiSelectedDropDown(
                      items: ['Puma', 'Adidas', 'Skechers', 'Nike'],
                      onSelectedChanged: (selectedItems) {
                        ctrl.filterProductsByBrands(selectedItems);
                      },
                    ),
                  ),
                  Flexible(
                    child: DropDownButton(
                      items: ['Rs. Low to High', 'Rs. High to Low'],
                      SelectedItemText: 'Sort by Price',
                      onSelected: (selected) {
                        ctrl.sortProducts(selected == 'Rs. Low to High');
                      },
                    ),
                  ),
                ],
              ),
              // ElevatedButton(
              //   onPressed: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(builder: (context) => ShoeClassifierApp()),
              //     );
              //   },
              //   child: Text(
              //     "AI Features",
              //     style: TextStyle(fontWeight: FontWeight.bold),
              //   ),
              //   style: ElevatedButton.styleFrom(
              //     foregroundColor: Colors.white,
              //     backgroundColor: Colors.blue,
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(12),
              //     ),
              //   ),
              // ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.8,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: ctrl.products.length,
                  itemBuilder: (context, index) {
                    return ProductCard(
                      name: ctrl.products[index].name ?? 'No name',
                      imageUrl: ctrl.products[index].image ?? 'url',
                      price: ctrl.products[index].price ?? 0.0,
                      offerTag: '20 % off',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDescriptionPage()),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
