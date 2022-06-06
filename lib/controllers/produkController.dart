import 'package:get/state_manager.dart';
import 'package:kreditplus/models/Produk.dart';
import 'package:kreditplus/services/ProdukApi.dart';

class ProdukController extends GetxController {
  var isLoading = true.obs;
  List produk = <ProdukItemModel>[].obs;

  void fetchUpComing() async {
    try {
      isLoading(true);
      var res = await ProdukApiDB.getdata();
      if (res != null) {
        produk.assignAll(res);
      }
    } finally {
      isLoading(false);
    }
  }
}
