import 'package:flutter/material.dart';
import 'package:vrouter/vrouter.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key, required this.child,}) : super(key: key);
  final Widget child;

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: VWidgetGuard(
        afterEnter: (context, from, to) {
          if (Scaffold.of(context).isDrawerOpen) {
            Scaffold.of(context).closeDrawer();
            if (from != null) {
              context.vRouter.to(from);
            } else {
              context.vRouter.to('/');
            }
          }
        },
        child: widget.child,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: getCurrentIndex(context),
        onTap: (value) {
          switch (value) {
            case 0:
              context.vRouter.to('/');
              break;
            case 1:
              context.vRouter.to('/explore');
              break;
            default:
              context.vRouter.to('/');
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Explore',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.shopping_cart_outlined),
          //   label: 'Cart',
          // ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.local_offer_outlined),
          //   label: 'Offer',
          // ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.person_outlined),
          //   label: 'Account',
          // ),
        ],
      ),
    );
  }

  int getCurrentIndex(BuildContext context) {
    if (context.vRouter.path.contains('home')) {
      return 0;
    } else if (context.vRouter.path.contains('explore')) {
      return 1;
    }
    return 0;
  }

}
