

import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'package:taskati1/models/taskmodel.dart';

class HiveHelper {
 static late Box userbox;
  static late Box <Taskmodel> taskbox;
  static  const String userBoxname = 'user';
  static  const String namekey = 'name';
  static  const String imagekey = 'image';
  static  const String boolkey = 'complete';
  static  const String taskboxname = 'tasks';
  static Future<void> init() async {
    userbox = await Hive.openBox(userBoxname);
    taskbox = await Hive.openBox(taskboxname);
  }
  static Future<void> setUserInfo(String name,String image) async {
    await userbox.put(namekey, name);
    await userbox.put(imagekey, image);
  }
   static dynamic setinfo(String key,dynamic value)  {
     return userbox.put(key,value);
  }
 static dynamic getUserInfo(String key)  {
  return userbox.get(key);
}
 static dynamic settask(String key,Taskmodel value)  {
   return  taskbox.put(key,value);
  }
 static Taskmodel? gettask(String key)  {
  return taskbox.get(key);
}
}
