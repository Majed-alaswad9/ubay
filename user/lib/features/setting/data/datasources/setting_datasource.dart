import 'package:injectable/injectable.dart';
import 'package:user/core/api/client.dart';

@injectable
class SettingDataSource {
  final ClientApi clientApi;

  SettingDataSource(this.clientApi);
}
