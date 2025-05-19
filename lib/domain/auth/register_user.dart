import 'package:hmi_core/hmi_core.dart';
import 'package:hmi_networking/hmi_networking.dart';

///
class RegisterUser {
  static const _log = Log('RegisterUser');
  final DataSet<Map<String, dynamic>> _remote;
  final String _group;
  final String _location;
  final String _name;
  final String _phone;
  final String _pass;
  ///
  RegisterUser({
    required DataSet<Map<String, dynamic>> remote,
    required String group,
    required String location,
    required String name,
    required String phone,
    required String pass,
  }) :
    _remote = remote,
    _group = group,
    _location = location,
    _name = name,
    _phone = phone,
    _pass = pass;
  ///
  Future<Response<Map<String, dynamic>>> fetch() async {
    final fieldData = {
      'group': _group,
      'location': _location,
      'name': _name,
      'phone': _phone,
      'pass': _pass,
    };
    return _remote.fetchWith(
      params: {
        'fieldData': fieldData,
      },
    ).then((response) {
      _log.debug('[.fetch()] response: $response');
      return Response(
        errCount: (response.hasError) 
          ? 1
          : 0,
        errDump: (response.hasError) 
          ? 'Ошибка регистрации нового пользователя: ${response.errorMessage}'
          : '',
        data: response.data,
      );
    })
    .onError((error, stackTrace) {
      _log.error('Ошибка в методе .fetchWith(): $error');
      return Response(
        errCount: 1, 
        errDump: 'Ошибка в методе $RegisterUser.fetchWith: $error',
        data: {},
      );
    });
  }
}
