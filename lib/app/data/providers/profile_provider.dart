import 'package:get/get_connect/http/src/multipart/form_data.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:sims_ppob/app/data/providers/base_provider.dart';

class ProfileProvider extends BaseProvider {
  Future<Response> uploadFile(FormData form) async => await put(
        '/profile/image',
        form,
      );

  Future<Response> updateProfile(var data) async => await put(
        '/profile/update',
        data,
      );
}
