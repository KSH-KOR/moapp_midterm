import 'package:flutter/material.dart';
import 'package:midterm/views/drawer/drawer.dart';
import 'package:midterm/theme/appcolors.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constant/routes.dart';
import '../model/hotel.dart';
import '../products_layout/product_gridview.dart';
import '../products_layout/product_listview.dart';

enum ProductListOption { gridview, listview }

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main'),
        actions: [
          IconButton(
            onPressed: () async {
              await Navigator.of(context).pushNamed(searchRoute);
            },
            icon: const Icon(Icons.search),
          ),
          const IconButton(
            onPressed: _launchUrl,
            icon: Icon(Icons.language),
          ),
        ],
      ),
      drawer: const MyDrawer(),
      body: const Center(
        child: ProductView(),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}

class ProductView extends StatefulWidget {
  const ProductView({Key? key}) : super(key: key);

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  final isSelected = <bool>[false, true];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ToggleButtons(
                onPressed: (index) {
                  // Respond to button selection
                  setState(() {
                    for (int i = 0; i < isSelected.length; i++) {
                        isSelected[i] = i == index;
                      }
                  });
                },
                isSelected: isSelected,
                color: Colors.black.withOpacity(0.60),
                selectedColor: AppColors.toggleButtonBGRColor,
                selectedBorderColor: AppColors.toggleButtonBGRColor,
                fillColor: AppColors.toggleButtonBGRColor.withOpacity(0.08),
                splashColor: AppColors.toggleButtonBGRColor.withOpacity(0.12),
                hoverColor: AppColors.toggleButtonBGRColor.withOpacity(0.04),
                borderRadius: BorderRadius.circular(4.0),
                constraints: const BoxConstraints(minHeight: 36.0),
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Icon(Icons.list),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Icon(Icons.grid_view),
                  ),
                ],
              ),
            )
          ],
        ),
        isSelected[1] ? const ProductGridView() : const ProductListView(),
        
      ],
    );
  }
}

final Uri _url = Uri.parse('https://www.handong.edu/');

Future<void> _launchUrl() async {
  if (!await launchUrl(_url)) {
    throw 'Could not launch $_url';
  }
}
