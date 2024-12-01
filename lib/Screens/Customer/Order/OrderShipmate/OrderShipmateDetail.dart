/// This is a free for use and open source, most complete mobile application for nopCommerce platform based on Flutter and NopSuite front-end API for nopCommerce by NopAdvance LLP.
/// Copyright (C) 2022 - NopAdvance LLP

/// This program is free software: you can redistribute and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License.

/// This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

/// This program is forever free software: you can modify and/or redistribute. One cannot sell or relicense the source code it under the terms of the NopAdvance Public license terms.

/// You should have received a copy of the GNU General Public License along with this program.  If not, see <http://www.gnu.org/licenses/>.

import 'package:flutter/material.dart';
import 'package:nopsuite/Common/CheckInternet.dart';
import 'package:nopsuite/Screens/Customer/Order/OrderShipmate/OrderShipmateDetailProvider.dart';
import 'package:nopsuite/Screens/General/LocalResourceProvider.dart';
import 'package:nopsuite/Themes/Flexo/Screen/Customer/Order/OrderShipmate/OrderShipmateDetail.dart';
import 'package:nopsuite/Utils/Enum/ThemeAttributes.dart';
import 'package:provider/provider.dart';

class OrderShipmateDetail extends StatefulWidget {
  int id;
  OrderShipmateDetail(this.id);

  @override
  _OrderShipmateDetailState createState() => _OrderShipmateDetailState();
}

class _OrderShipmateDetailState extends State<OrderShipmateDetail> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    context.read<LocalResourceProvider>().loadLocalResources();
    if (await CheckConnectivity().checkInternet(context)) {
      context
          .read<OrderShipmateDetailProvider>()
          .pageLoadData(context: context);
      context
          .read<OrderShipmateDetailProvider>()
          .getOrderShipmentDetailsData(context: context, shipmateId: widget.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (selectedTheme == ThemeAttributes.Flexo) {
      return FlexoOrderShipmateDetail();
    } else {
      return FlexoOrderShipmateDetail();
    }
  }
}
