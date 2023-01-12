import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:own_the_city/app/models/demo_model.dart';
import 'package:own_the_city/app/resources/app.logger.dart';

var log = getLogger('CreateContest_bloc');

File? imageFile;

class DemoBloc extends Bloc<DemoEvent, DemoModel> {
  List selectedCategories = [];

  DemoBloc() : super(DemoModel()) {
    on<DemoEvent>(
      (event, emit) {
        emit(
          DemoModel(
              //
              ),
        );
      },
    );

    on<JustDemoEvent>((event, emit) {
      emit(state);
      log.i(state);
    });
  }
}

abstract class DemoEvent extends Equatable {}

class JustDemoEvent extends DemoEvent {
  @override
  List<Object?> get props => [];
}
