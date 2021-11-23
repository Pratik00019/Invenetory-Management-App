import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase/supabase.dart';

class SupabaseManager {
  static String supabaseUrl = dotenv.env['supabaseUrl'].toString();
  static String supabaseKey = dotenv.env['supabaseKey'].toString();

  final client = SupabaseClient(supabaseUrl, supabaseKey);

  getData(String tableName, {String columns = '*'}) async {
    var temp;
    var response = await client.from(tableName).select(columns).execute();
    if (response.error == null) {
      temp = response.data;
      return temp;
    }
  }

  addData(String tableName, var json) async {
    var response = await client.from(tableName).insert([json]).execute();
    if (response.error == null) {
      print('add data error is ' + response.error.toString());
      print('response.data: ${response.data}');
      return response;
    }
  }

  deleteData(String tableName, var id) async {
    var response = await client.from(tableName).delete().eq('id', id).execute();
    if (response.error == null) {
      print('deleted $id from $tableName');
      return response;
    }
  }

  updateData(String tableName, var id, Map json) async {
    var response =
        await client.from(tableName).update(json).eq('id', id).execute();
    print(response.status);
    if (response.status == 200) {
      print('updated data of id $id');
    }
  }

  searchData(String tableName, String pattern, {String columns = '*'}) async {
    var temp;
    var response = await client
        .from(tableName)
        .select(columns)
        .ilike('name', pattern)
        .execute();
    if (response.error == null) {
      print(response);
      print('searching $pattern in table $tableName ');
      temp = response.data;
      return temp;
    }
  }
}
