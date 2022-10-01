import 'package:admin_dashboard/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:admin_dashboard/providers/sidemenu_provider.dart';

import 'package:admin_dashboard/router/router.dart';

import 'package:admin_dashboard/services/navigation_service.dart';

import 'package:admin_dashboard/ui/shared/widgets/menu.dart';
import 'package:admin_dashboard/ui/shared/widgets/logo.dart';
import 'package:admin_dashboard/ui/shared/widgets/text_separator.dart';


class Sidebar extends StatelessWidget {
 

  void navigateTo( String routeName ) {
    NavigationService.replaceTo( routeName );
    SideMenuProvider.closeMenu();
  }

  @override
  Widget build(BuildContext context) {

    final sideMenuProvider = Provider.of<SideMenuProvider>(context);

    return Container(
      width: 200,
      height: double.infinity,
      decoration: buildBoxDecoration(),
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [

          Logo(),

          SizedBox( height: 50 ),

          TextSeparator( text: 'main' ),

          Menu(
            text: 'Dashboard',
            icon: Icons.compass_calibration_outlined,
            onPressed: () => navigateTo( Flurorouter.dashboardRoute ),
            isActive: sideMenuProvider.currentPage == Flurorouter.dashboardRoute,
          ),

          Menu( text: 'Orders', icon: Icons.shopping_cart_outlined, onPressed: (){}),
          Menu( text: 'Analytic', icon: Icons.show_chart_outlined, onPressed: (){}),

          Menu(
            text: 'Categories', 
            icon: Icons.layers_outlined, 
            onPressed: () => navigateTo( Flurorouter.categoriesRoute ),
            isActive: sideMenuProvider.currentPage == Flurorouter.categoriesRoute,
          ),

          Menu( text: 'Products', icon: Icons.dashboard_outlined, onPressed: (){}),
          Menu( text: 'Discount', icon: Icons.attach_money_outlined, onPressed: (){})
          ,
          Menu(
            text: 'Users', 
            icon: Icons.people_alt_outlined, 
            onPressed: () => navigateTo( Flurorouter.usersRoute ),
            isActive: sideMenuProvider.currentPage == Flurorouter.usersRoute,
          ),

          SizedBox( height: 30 ),

          TextSeparator( text: 'UI Elements' ),

          Menu(
            text: 'Icons',
            icon: Icons.list_alt_outlined, 
            onPressed: () => navigateTo( Flurorouter.iconsRoute ),
            isActive: sideMenuProvider.currentPage == Flurorouter.iconsRoute,
          ),

          Menu( text: 'Marketing', icon: Icons.mark_email_read_outlined, onPressed: (){}),
          Menu( text: 'Campaign', icon: Icons.note_add_outlined, onPressed: (){}),
          Menu(
            text: 'Black', 
            icon: Icons.post_add_outlined, 
            onPressed: () => navigateTo( Flurorouter.blankRoute ),
            isActive: sideMenuProvider.currentPage == Flurorouter.blankRoute,
          ),

          SizedBox( height: 50 ),
          TextSeparator( text: 'Exit' ),
          Menu(
            text: 'Logout', 
            icon: Icons.exit_to_app_outlined, 
            onPressed: (){
              Provider.of<AuthProvider>(context, listen: false)
                .logout();
            }),
        ],
      ),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
    gradient: LinearGradient(
      colors: [
        Color( 0xff092044 ),
        Color( 0xff092042 ),
      ]
    ),
    boxShadow: [
      BoxShadow(
        color: Colors.black26,
        blurRadius: 10
      )
    ]
  );
}