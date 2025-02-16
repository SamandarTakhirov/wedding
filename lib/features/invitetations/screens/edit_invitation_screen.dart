import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../constants/app_colors.dart';
import '../../../core/extension/date_formatter.dart';
import '../../../core/extension/extension.dart';
import '../../../core/utils/context_utils.dart';
import '../../../core/utils/utils.dart';
import '../../../gen/assets.gen.dart';
import '../data/model/yellow_template.dart';
import '../templates/invitation3100.dart';
import '../widgets/edit_invitation_text_field.dart';

class EditInvitationScreen extends StatefulWidget {
  const EditInvitationScreen({super.key});

  @override
  State<EditInvitationScreen> createState() => _EditInvitationScreenState();
}

class _EditInvitationScreenState extends State<EditInvitationScreen> {
  late TextEditingController mainTextController;
  late TextEditingController husbandNameController;
  late TextEditingController wifeNameController;
  late TextEditingController descriptionController;
  late TextEditingController addressNameController;
  late TextEditingController addressUrlController;
  late TextEditingController imagesController;

  late ValueNotifier<YellowTemplate> templateNotifier;

  @override
  void initState() {
    super.initState();

    templateNotifier = ValueNotifier(
      YellowTemplate(
        mainText: 'The Wedding Day',
        husbandName: 'Temur',
        wifeName: 'Sarvinozxon',
        weddingDate: DateTime(2025, 3, 7),
        weddingTime: const TimeOfDay(hour: 19, minute: 0),
        description:
            'Aziz mehmonimiz, Sizni 19:00 da boshlanadigan Visol oqshomimizga taklif etamiz. Siz bilan ushbu baxtli onlarni baham ko‘rish biz uchun sharaf!',
        addressName: 'Toshkent shahar, Yakkasaroy to\'yxonasi',
        addressUrl: 'https://yandex.uz/maps/org/183122456222/?ll=69.260693%2C41.279370&z=17',
        images: [],
        bottomImage: Assets.images.bottomflowersYellow.image(),
        topImage: Assets.images.topflowersYellow.image(),
        circleCenterImage: Assets.images.centerinvetationflower.image(
          fit: BoxFit.fill,
        ),
      ),
    );

    // Controllerlarni yaratish
    mainTextController = TextEditingController(text: templateNotifier.value.mainText);
    husbandNameController = TextEditingController(text: templateNotifier.value.husbandName);
    wifeNameController = TextEditingController(text: templateNotifier.value.wifeName);
    descriptionController = TextEditingController(text: templateNotifier.value.description);
    addressNameController = TextEditingController(text: templateNotifier.value.addressName);
    addressUrlController = TextEditingController(text: templateNotifier.value.addressUrl);
    imagesController = TextEditingController(text: templateNotifier.value.images?.join(', '));

    // Har bir controller uchun listener qo'shamiz
    mainTextController.addListener(() {
      _updateTemplate(mainText: mainTextController.text);
    });
    husbandNameController.addListener(() {
      _updateTemplate(husbandName: husbandNameController.text);
    });
    wifeNameController.addListener(() {
      _updateTemplate(wifeName: wifeNameController.text);
    });
    descriptionController.addListener(() {
      _updateTemplate(description: descriptionController.text);
    });
    addressNameController.addListener(() {
      _updateTemplate(addressName: addressNameController.text);
    });
    addressUrlController.addListener(() {
      _updateTemplate(addressUrl: addressUrlController.text);
    });
    imagesController.addListener(() {
      final imgs = imagesController.text.split(',').map((e) => e.trim()).where((e) => e.isNotEmpty).toList();
      _updateTemplate(images: imgs);
    });
  }

  @override
  void dispose() {
    mainTextController.dispose();
    husbandNameController.dispose();
    wifeNameController.dispose();
    descriptionController.dispose();
    addressNameController.dispose();
    addressUrlController.dispose();
    imagesController.dispose();
    templateNotifier.dispose();
    super.dispose();
  }

  void _updateTemplate({
    String? mainText,
    String? husbandName,
    String? wifeName,
    DateTime? weddingDate,
    TimeOfDay? weddingTime,
    String? description,
    String? addressName,
    String? addressUrl,
    List<String>? images,
  }) {
    templateNotifier.value = templateNotifier.value.copyWith(
      mainText: mainText,
      husbandName: husbandName,
      wifeName: wifeName,
      weddingDate: weddingDate,
      weddingTime: weddingTime,
      description: description,
      addressName: addressName,
      addressUrl: addressUrl,
      images: images,
    );
  }

  Future<void> _pickImage() async {
    var result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: true,
      withData: kIsWeb, // Web uchun faylning bytes ni olamiz
    );

    if (result != null) {
      var selectedImages = <String>[];

      if (kIsWeb) {
        // Web platforma uchun base64 formatga o‘tkazamiz
        selectedImages = result.files.map((file) => base64Encode(file.bytes!)).toList();
      } else {
        // Mobile uchun fayl yo‘llarini olish
        selectedImages = result.paths.whereType<String>().toList();
      }

      _updateTemplate(images: [...templateNotifier.value.images!, ...selectedImages]);
    }
  }

  Future<void> _selectWeddingDate() async {
    var selectedDate = templateNotifier.value.weddingDate;
    await showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text('Sana tanlash'),
        content: SizedBox(
          height: 250,
          child: CupertinoDatePicker(
            minimumDate: DateTime.now(),
            mode: CupertinoDatePickerMode.date,
            initialDateTime: selectedDate,
            onDateTimeChanged: (newDate) {
              selectedDate = newDate;
            },
          ),
        ),
        actions: [
          CupertinoDialogAction(
            textStyle: context.textTheme.bodyLarge?.copyWith(color: AppColors.black),
            onPressed: () => Navigator.pop(context),
            child: const Text('Bekor qilish'),
          ),
          CupertinoDialogAction(
            textStyle: context.textTheme.bodyLarge?.copyWith(color: AppColors.black),
            onPressed: () {
              _updateTemplate(weddingDate: selectedDate);
              Navigator.pop(context);
            },
            child: const Text('Tanlash'),
          ),
        ],
      ),
    );
  }

  Future<void> _selectWeddingTime() async {
    var selectedTime = templateNotifier.value.weddingTime;
    await showCupertinoDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: const Text('Soat tanlash'),
        content: SizedBox(
          height: 200,
          child: CupertinoDatePicker(
            use24hFormat: true,
            mode: CupertinoDatePickerMode.time,
            initialDateTime: DateTime(0).add(Duration(
              hours: selectedTime.hour,
              minutes: selectedTime.minute,
            )),
            onDateTimeChanged: (newTime) {
              selectedTime = TimeOfDay(hour: newTime.hour, minute: newTime.minute);
            },
          ),
        ),
        actions: [
          CupertinoDialogAction(
            textStyle: context.textTheme.bodyLarge?.copyWith(color: AppColors.black),
            onPressed: () => Navigator.pop(context),
            child: const Text('Bekor qilish'),
          ),
          CupertinoDialogAction(
            textStyle: context.textTheme.bodyLarge?.copyWith(color: AppColors.black),
            onPressed: () {
              _updateTemplate(weddingTime: selectedTime);
              Navigator.pop(context);
            },
            child: const Text('Tanlash'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: AppColors.white,
        body: LayoutBuilder(
          builder: (context, constraints) {
            final isCompact = constraints.maxWidth < 600;
            return Row(
              children: [
                Expanded(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 24),
                      child: SizedBox(
                        width: context.height * .5,
                        height: context.height,
                        child: DecoratedBox(
                          decoration: const BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.shadowColor,
                                blurRadius: 100,
                                offset: Offset(40, 20),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: ValueListenableBuilder<YellowTemplate>(
                              valueListenable: templateNotifier,
                              builder: (context, template, child) => SizedBox(
                                width: context.height * .5,
                                height: context.height * .98,
                                child: Container(
                                  padding: const EdgeInsets.all(5),
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(30)),
                                  ),
                                  child: Invitation3100(yellowTemplate: template),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                AnimatedSize(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  child: Container(
                    width: isCompact ? 100 : 500,
                    height: double.infinity,
                    decoration: const BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        topLeft: Radius.circular(30),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.shadowColor,
                          blurRadius: 100,
                          offset: Offset(0, 20),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(16),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            isCompact ? '#3100' : '#3100 Taklifnoma taxrirlash',
                            style: context.textTheme.titleLarge?.copyWith(
                              color: AppColors.black,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          EditInvitationTextField(label: 'Asosiy Matn', controller: mainTextController),
                          EditInvitationTextField(label: 'Kuyovning ismi', controller: husbandNameController),
                          EditInvitationTextField(label: 'Kelinning ismi', controller: wifeNameController),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Sana',
                                style: context.textTheme.bodyMedium?.copyWith(
                                  color: AppColors.grey,
                                ),
                              ),
                              FilledButton(
                                onPressed: _selectWeddingDate,
                                style: FilledButton.styleFrom(
                                  alignment: Alignment.centerLeft,
                                  backgroundColor: AppColors.white,
                                  fixedSize: const Size(480, 50),
                                  shape: const RoundedRectangleBorder(
                                    side: BorderSide(color: AppColors.grey),
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                  ),
                                ),
                                child: ValueListenableBuilder<YellowTemplate>(
                                  valueListenable: templateNotifier,
                                  builder: (context, template, child) => Text(
                                    template.weddingDate.toFormattedString(),
                                    textAlign: TextAlign.left,
                                    style: context.textTheme.bodyMedium?.copyWith(
                                      color: AppColors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          EditInvitationTextField(
                            label: 'Qoshimcha text',
                            controller: descriptionController,
                            isDescription: true,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Soat',
                                style: context.textTheme.bodyMedium?.copyWith(
                                  color: AppColors.grey,
                                ),
                              ),
                              FilledButton(
                                onPressed: _selectWeddingTime,
                                style: FilledButton.styleFrom(
                                  alignment: Alignment.centerLeft,
                                  backgroundColor: AppColors.white,
                                  fixedSize: const Size(480, 50),
                                  shape: const RoundedRectangleBorder(
                                    side: BorderSide(color: AppColors.grey),
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                  ),
                                ),
                                child: ValueListenableBuilder<YellowTemplate>(
                                  valueListenable: templateNotifier,
                                  builder: (context, template, child) => Text(
                                    style: context.textTheme.bodyMedium?.copyWith(
                                      color: AppColors.black,
                                    ),
                                    '${template.weddingTime.hour.toString().padLeft(2, '0')}:${template.weddingTime.minute.toString().padLeft(2, '0')}',
                                  ),
                                ),
                              ),
                            ],
                          ),
                          AppUtils.kGap8,
                          Text(
                            'Rasmlar',
                            style: context.textTheme.bodyMedium?.copyWith(
                              color: AppColors.grey,
                            ),
                          ),
                          AppUtils.kGap8,
                          ValueListenableBuilder<YellowTemplate>(
                            valueListenable: templateNotifier,
                            builder: (context, template, child) => Wrap(
                              spacing: 10,
                              runSpacing: 10,
                              children: [
                                ...template.images!.map((imagePath) => kIsWeb
                                    ? ClipRRect(
                                        borderRadius: const BorderRadius.all(Radius.circular(15)),
                                        child: Image.memory(
                                          base64Decode(imagePath),
                                          width: 100,
                                          height: 100,
                                          fit: BoxFit.cover,
                                        ),
                                      )
                                    : ClipRRect(
                                        borderRadius: const BorderRadius.all(Radius.circular(15)),
                                        child: Image.file(
                                          File(imagePath),
                                          width: 100,
                                          height: 100,
                                          fit: BoxFit.cover,
                                        ),
                                      )),
                                SizedBox(
                                  width: 100,
                                  height: 100,
                                  child: FilledButton(
                                    style: FilledButton.styleFrom(
                                      alignment: Alignment.center,
                                      backgroundColor: AppColors.white,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(15)),
                                        side: BorderSide(
                                          color: AppColors.grey,
                                        ),
                                      ),
                                    ),
                                    onPressed: _pickImage,
                                    child: const Icon(Icons.image, color: AppColors.black),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          EditInvitationTextField(label: 'Manzil nomi', controller: addressNameController),
                          EditInvitationTextField(label: 'Address URL', controller: addressUrlController),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      );
}
