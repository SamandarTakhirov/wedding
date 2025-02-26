import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../core/extension/extension.dart';
import '../../../core/utils/context_utils.dart';
import '../../../core/utils/utils.dart';
import '../../../gen/assets.gen.dart';
import '../data/models/admin_dashboard_model.dart';
import '../widgets/admin_dashboard_table_widget.dart';
import '../widgets/admin_info_widget.dart';

class SuperAdminDashboard extends StatefulWidget {
  const SuperAdminDashboard({super.key});

  @override
  State<SuperAdminDashboard> createState() => _SuperAdminDashboardState();
}

class _SuperAdminDashboardState extends State<SuperAdminDashboard> {
  late final List<AdminDashboardModel> adminDashboardModel;

  @override
  void initState() {
    adminDashboardModel = [
      AdminDashboardModel(
        userName: 'Kimdir Ismi',
        address: 'Buyuk Ipak Yuli 59',
        addressUrl: 'https://yandex.uz/maps/-/CHuSJW2l',
        phoneNumber: '+998 90 123 45 67',
        isActive: true,
        lastPayment: DateTime.now(),
        paymentInvoiceImage:
            'https://avatars.mds.yandex.net/i?id=9157799295087cbd6fcda0be0a9b4dcb_l-5839308-images-thumbs&n=13',
        userLogin: 'userLogin',
        userPassword: 'userPassword',
      ),
      AdminDashboardModel(
        userName: 'Kimdir ismi 2',
        address: 'Yunsobod AnorPlaza 123',
        addressUrl: 'https://yandex.uz/maps/-/CHuSNByP',
        phoneNumber: '+998 90 765 43 21',
        isActive: false,
        lastPayment: DateTime.now(),
        paymentInvoiceImage:
            'https://avatars.mds.yandex.net/i?id=9157799295087cbd6fcda0be0a9b4dcb_l-5839308-images-thumbs&n=13',
        userLogin: 'userLogin',
        userPassword: 'userPassword',
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          children: [
            Padding(
              padding: const EdgeInsets.all(24),
              child: Text(
                'TaklifnomaVIP Super Admin',
                style: context.textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              width: context.width,
              child: GridView.builder(
                padding: AppUtils.kPaddingHor24,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 500,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 4,
                ),
                itemCount: 3,
                itemBuilder: (context, index) => Center(
                  child: AdminInfoWidget(
                    svg: Assets.svg.user.svg(
                      // ignore: deprecated_member_use_from_same_package
                      color: Colors.green,
                    ),
                    infoText: 'Oylik sof daromat',
                    totalPrice: '1 000 000',
                  ),
                ),
              ),
            ),
            SizedBox(
              width: context.width,
              height: context.height,
              child: Center(
                child: AdminDashboardTableWidget(
                  adminDashboardModel: adminDashboardModel,
                ),
              ),
            ),
          ],
        ),
      );
}
