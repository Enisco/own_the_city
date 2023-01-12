
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:own_the_city/app/models/demo_model.dart';
import 'package:own_the_city/app/resources/app.logger.dart';
import 'package:own_the_city/ui/features/homepage/presentation/bloc/homepage_events.dart';

var log = getLogger('Home_bloc');

class HomepageBloc extends Bloc<HomepageBlocEvent, DemoModel> {
  HomepageBloc() : super(DemoModel());
}
