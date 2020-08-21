import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:user/sanitizer/utilities/categories.dart';
import 'package:user/sanitizer/widgets/appbar_for_sanitizer_and_parlour_screen.dart';
import 'package:user/sanitizer/widgets/loading_bar.dart';
import 'package:user/sanitizer/widgets/vendor_list_item.dart';

class VendorListScreen extends StatelessWidget {
  final Category category;
  VendorListScreen(this.category);
  String collectionName = '';

  @override
  Widget build(BuildContext context) {
    if (category == Category.sanitize)
      collectionName = 'vendorSanitize';
    else if (category == Category.cockroach)
      collectionName = 'vendorCockroach';
    else if (category == Category.mosquito) collectionName = 'vendorMosquito';

    return Scaffold(
      appBar: AppBarForSanitizerAndParlourScreen(context),
      body: FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance.collection(collectionName).get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return LoadingBar();
          else {
            return ListView.builder(
                itemCount: snapshot.data.docs.length == 0
                    ? 0
                    : snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  return VendorListItem(
                      vendorName:
                          snapshot.data.docs[index].data()['vendorName'],
                      location: snapshot.data.docs[index].data()[''],
                      pricePerFeet:
                          snapshot.data.docs[index].data()['pricePerFeet'],
                      category: category);
                });
          }
        },
      ),
    );
  }
}
