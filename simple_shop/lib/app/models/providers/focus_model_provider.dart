import 'package:get/get.dart';

import '../focus_model_model.dart';

class FocusModelProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) {
      if (map is Map<String, dynamic>) return FocusModel.fromJson(map);
      if (map is List)
        return map.map((item) => FocusModel.fromJson(item)).toList();
    };
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<FocusModel?> getFocusModel(int id) async {
    final response = await get('focusmodel/$id');
    return response.body;
  }

  Future<Response<FocusModel>> postFocusModel(FocusModel focusmodel) async =>
      await post('focusmodel', focusmodel);
  Future<Response> deleteFocusModel(int id) async =>
      await delete('focusmodel/$id');
}
