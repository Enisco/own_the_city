import 'dart:io';

import 'package:cupertino_will_pop_scope/cupertino_will_pop_scope.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:own_the_city/app/resources/app.logger.dart';
import 'package:own_the_city/ui/features/custom_nav_bar/custom_navbar.dart';
import 'package:own_the_city/ui/features/record_screen/controller/record_controller.dart';
import 'package:own_the_city/ui/features/record_screen/model/record_model.dart';
import 'package:own_the_city/ui/shared/custom_appbar.dart';
import 'package:own_the_city/ui/shared/custom_button.dart';
import 'package:own_the_city/ui/shared/custom_textfield.dart';
import 'package:own_the_city/ui/shared/spacer.dart';
import 'package:own_the_city/utils/app_constants/app_colors.dart';
import 'package:own_the_city/utils/app_constants/app_key_strings.dart';
import 'package:own_the_city/utils/app_constants/app_styles.dart';
import 'package:own_the_city/utils/screen_util/screen_util.dart';
import 'package:provider/provider.dart';

var log = getLogger('RecordPageView');

TextEditingController toponymController = TextEditingController();
TextEditingController toponymDescriptionController = TextEditingController();
TextEditingController toponymYearController = TextEditingController();

enum ToponymTypes { Natural, Artificial }

class RecordPageView extends StatefulWidget {
  const RecordPageView({super.key});

  @override
  State<RecordPageView> createState() => _RecordPageViewState();
}

class _RecordPageViewState extends State<RecordPageView> {
  final CameraCaptureController _controller = CameraCaptureController();
  var selectedToponymTypes = ToponymTypes.Natural;

  @override
  void initState() {
    super.initState();
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ConditionalWillPopScope(
        onWillPop: () async {
          if (Platform.isAndroid) {
            SystemNavigator.pop();
          } else if (Platform.isIOS) {
            exit(0);
          }
          return false;
        },
        shouldAddCallback: true,
        child: Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(60),
              child: CustomAppbar(
                title: AppKeyStrings.recordToponym,
              ),
            ),
            backgroundColor: AppColors.plainWhite,
            bottomNavigationBar: CustomNavBar(
              color: AppColors.plainWhite,
            ),
            body: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                  horizontal: screenSize(context).width / 14, vertical: 20),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Provider.of<RecordToponymModel>(context)
                            .imageFilesSelected
                            .isEmpty
                        ? Container(
                            width: screenSize(context).width,
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(15),
                              ),
                              color: Colors.grey[100],
                            ),
                            child: const Center(child: Text("No images yet")),
                          )
                        : Container(
                            width: 300,
                            height: 400,
                            padding: const EdgeInsets.all(1),
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                              border:
                                  Border.all(color: AppColors.kPrimaryColor),
                              color: Colors.grey[100],
                              image: DecorationImage(
                                image: FileImage(File(
                                    Provider.of<RecordToponymModel>(context)
                                        .imageFilesSelected[
                                            Provider.of<RecordToponymModel>(
                                                    context)
                                                .selectedImageIndex]
                                        .path)),
                              ),
                            ),
                          ),
                    Provider.of<RecordToponymModel>(context)
                            .imageFilesSelected
                            .isEmpty
                        ? const SizedBox.shrink()
                        : Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(7)),
                              border:
                                  Border.all(color: AppColors.kPrimaryColor),
                              color: AppColors.lighterGray,
                            ),
                            height: 90,
                            width: 300,
                            padding: const EdgeInsets.all(8.0),
                            margin: const EdgeInsets.all(4.0),
                            child: GridView.builder(
                                itemCount:
                                    Provider.of<RecordToponymModel>(context)
                                        .imageFilesSelected
                                        .length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 4),
                                itemBuilder: (BuildContext context, int index) {
                                  return InkWell(
                                    onTap: () => _controller
                                        .changeSelectedImage(context, index),
                                    child: Container(
                                      width: 90,
                                      // height: 500,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 2),
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(15)),
                                        color: Colors.grey[100],
                                      ),
                                      child: Image.file(
                                        File(Provider.of<RecordToponymModel>(
                                                context)
                                            .imageFilesSelected[index]
                                            .path),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  );
                                }),
                          ),

                    SizedBox(
                      height: Provider.of<RecordToponymModel>(context)
                              .imageFilesSelected
                              .isEmpty
                          ? 30
                          : 20,
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          _controller.uploadfromGallery(context);
                        },
                        child: Text(
                          Provider.of<RecordToponymModel>(context)
                                  .imageFilesSelected
                                  .isEmpty
                              ? "SELECT FROM GALLERY"
                              : "CHOOSE ANOTHER IMAGE",
                        ),
                      ),
                    ),
                    SizedBox(
                        height: Provider.of<RecordToponymModel>(context)
                                .imageFilesSelected
                                .isEmpty
                            ? 20
                            : 5),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          _controller.captureFromCamera(context);
                        },
                        child: Text(
                          Provider.of<RecordToponymModel>(context)
                                  .imageFilesSelected
                                  .isEmpty
                              ? "CAPTURE WITH CAMERA"
                              : "CAPTURE ANOTHER IMAGE",
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        children: [
                          Text(
                            AppKeyStrings.toponym,
                            style: AppStyles.regularStringStyle(
                                18, AppColors.fullBlack),
                          ),
                        ],
                      ),
                    ),
                    CustomTextField(
                      topPadding: 14,
                      fillColor: AppColors.regularBlue,
                      textEditingController: toponymController,
                      labelText: 'What is the name?',
                      textInputAction: TextInputAction.next,
                    ),
                    CustomSpacer(15),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        children: [
                          Text(
                            AppKeyStrings.toponymDesc,
                            style: AppStyles.regularStringStyle(
                                18, AppColors.fullBlack),
                          ),
                        ],
                      ),
                    ),
                    CustomTextField(
                      height: 120,
                      textEditingController: toponymDescriptionController,
                      labelText: 'Give details of the toponym . . .',
                      textInputAction: TextInputAction.next,
                    ),
                    CustomSpacer(15),

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        children: [
                          Text(
                            AppKeyStrings.toponymType,
                            style: AppStyles.regularStringStyle(
                                18, AppColors.fullBlack),
                          ),
                        ],
                      ),
                    ),
                    ListTile(
                      onTap: () => setState(() {
                        log.w(selectedToponymTypes);
                        selectedToponymTypes = ToponymTypes.Natural;
                        log.wtf(selectedToponymTypes);
                      }),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 0),
                      title: Text(ToponymTypes.Natural.name.toString()),
                      leading: Radio(
                        value: ToponymTypes.Natural,
                        groupValue: selectedToponymTypes,
                        onChanged: (natural) {
                          setState(() {
                            log.w(selectedToponymTypes);
                            selectedToponymTypes = ToponymTypes.Natural;
                            log.wtf(selectedToponymTypes);
                          });
                        },
                      ),
                    ),
                    ListTile(
                      onTap: () => setState(() {
                        log.w(selectedToponymTypes);
                        selectedToponymTypes = ToponymTypes.Artificial;
                        log.wtf(selectedToponymTypes);
                      }),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 0),
                      title: Text(ToponymTypes.Artificial.name.toString()),
                      leading: Radio(
                        value: ToponymTypes.Artificial,
                        groupValue: selectedToponymTypes,
                        onChanged: (artificial) {
                          setState(() {
                            log.w(selectedToponymTypes);
                            selectedToponymTypes = ToponymTypes.Artificial;
                            log.wtf(selectedToponymTypes);
                          });
                        },
                      ),
                    ),
                    //
                    CustomSpacer(65),
                    CustomButton(
                      styleBoolValue: true,
                      width: screenSize(context).width * 0.5,
                      color: Colors.amber[600],
                      child: Text(
                        'Upload',
                        style: AppStyles.regularStringStyle(
                            20, AppColors.plainWhite),
                      ),
                      onPressed: () {
                        whenPressed();
                      },
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }
}

void whenPressed() {
  print('Pressed');
}
