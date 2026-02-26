import 'package:hive_ce/hive_ce.dart';
import 'package:taskati1/models/taskmodel.dart';

@GenerateAdapters([AdapterSpec<Taskmodel>()])
part 'hive_adapters.g.dart';
