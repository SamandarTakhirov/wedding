import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../constants/app_colors.dart';
import '../../../core/extension/extension.dart';
import '../../../core/utils/context_utils.dart';
import '../../../core/utils/utils.dart';
import '../data/model/dashboard_template_model.dart';
import 'editor_table_widget.dart';

class DashboardTableWidget extends StatefulWidget {
  const DashboardTableWidget({
    required this.dashboardTemplateModel,
    super.key,
  });

  final List<DashboardTemplateModel> dashboardTemplateModel;

  @override
  State<DashboardTableWidget> createState() => _DashboardTableWidgetState();
}

class _DashboardTableWidgetState extends State<DashboardTableWidget> {
  final ValueNotifier<int> _editingIndex = ValueNotifier<int>(-1);
  late final List<ValueNotifier<double>> _customPricesNotifier;

  @override
  void initState() {
    super.initState();
    _customPricesNotifier =
        widget.dashboardTemplateModel.map((model) => ValueNotifier<double>(model.customPrice)).toList();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen = screenWidth < 700;

    return Padding(
      padding: AppUtils.kPaddingAll24,
      child: Center(
        child: SizedBox(
          width: screenWidth < 1500 ? screenWidth : 1500,
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
              padding: const EdgeInsets.all(20),
              child: LayoutBuilder(builder: (context, constraints) {
                final containerWidth = constraints.maxWidth * 0.9;
                final fontSize = containerWidth * 0.05;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Taklifnomalar',
                          style: context.textTheme.headlineLarge?.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: fontSize,
                          ),
                        ),
                        if (isSmallScreen)
                          IconButton(
                            icon: Icon(
                              CupertinoIcons.search,
                              color: AppColors.blue,
                              size: fontSize * .5,
                            ),
                            onPressed: () {},
                          )
                        else
                          SizedBox(
                            width: containerWidth * 0.3,
                            height: containerWidth * 0.05,
                            child: TextField(
                              cursorColor: AppColors.blue,
                              decoration: InputDecoration(
                                contentPadding: AppUtils.kPadding0,
                                prefixIcon: Icon(
                                  CupertinoIcons.search,
                                  size: fontSize * .3,
                                ),
                                hintText: 'Search',
                                hintStyle: TextStyle(
                                  fontSize: fontSize * .3,
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide(color: AppColors.blue, width: 2),
                                ),
                                enabledBorder: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide(color: AppColors.grey),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                    _buildDataTable(
                      fontSize: fontSize,
                      containerWidth: containerWidth,
                      dashboardTemplateModel: widget.dashboardTemplateModel,
                    ),
                  ],
                );
              }),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDataTable({
    required double fontSize,
    required double containerWidth,
    required List<DashboardTemplateModel> dashboardTemplateModel,
  }) {
    final textStyle = context.textTheme.bodySmall?.copyWith(
      fontSize: fontSize * .3,
      color: AppColors.grey,
    );
    final textStyleChild = context.textTheme.bodySmall?.copyWith(
      fontSize: fontSize * .3,
      color: AppColors.black,
      fontWeight: FontWeight.bold,
    );
    final linkStyle = context.textTheme.bodySmall?.copyWith(
      fontSize: fontSize * .3,
      color: AppColors.blue,
      fontWeight: FontWeight.bold,
    );

    return SizedBox(
      width: containerWidth * 1.1,
      child: DataTable(
        headingRowColor: WidgetStateProperty.all(AppColors.white),
        border: TableBorder.all(color: AppColors.white),
        columns: [
          DataColumn(label: Text('Code', style: textStyle)),
          DataColumn(label: Text('Example', style: textStyle)),
          DataColumn(label: Text('Taklifnoma VIP narx', style: textStyle)),
          DataColumn(label: Text('Sotuvdagi narx', style: textStyle)),
          DataColumn(label: Text('Foyda', style: textStyle)),
        ],
        rows: List.generate(
          dashboardTemplateModel.length,
          (index) {
            final item = dashboardTemplateModel[index];
            return DataRow(
              cells: [
                DataCell(
                  Text(
                    '#${item.templateCode}',
                    style: textStyleChild,
                  ),
                ),
                DataCell(
                  TextButton(
                    child: Text(
                      item.templateScreenUrl,
                      style: linkStyle,
                    ),
                    onPressed: () {
                      context.go(
                        '/view_invitation/${item.templateCode.replaceAll("#", "")}/${item.template.template.husbandName}/${item.template.template.wifeName}',
                        extra: item.template,
                      );
                    },
                  ),
                ),
                DataCell(
                  Text('${item.taklifnomaVipPrice.formattedPrice} so\'m', style: textStyleChild),
                ),
                DataCell(
                  ValueListenableBuilder<int>(
                    valueListenable: _editingIndex,
                    builder: (context, editingIndex, _) => EditablePriceCell(
                      isEditing: editingIndex == index,
                      onStartEditing: () => _editingIndex.value = index,
                      onStopEditing: () => _editingIndex.value = -1,
                      onPriceChanged: (newPrice) {
                        if (newPrice >= item.taklifnomaVipPrice) {
                          _customPricesNotifier[index].value = newPrice;
                        }
                      },
                      priceNotifier: _customPricesNotifier[index],
                      minPrice: item.taklifnomaVipPrice,
                      textStyle: textStyleChild!,
                      editingTextStyle: textStyleChild,
                    ),
                  ),
                ),
                DataCell(
                  ValueListenableBuilder<double>(
                    valueListenable: _customPricesNotifier[index],
                    builder: (context, price, _) {
                      final profit = price - item.taklifnomaVipPrice;
                      return Text('${profit.formattedPrice} so\'m', style: textStyleChild);
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
