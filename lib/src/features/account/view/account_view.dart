import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/src/features/account/logic/account_bloc.dart';
import 'package:myapp/src/features/account/widget/account_nouser_cart.dart';
import 'package:myapp/src/features/account/widget/account_user_card.dart';
import 'package:myapp/widgets/appbar/large_title_appbar.dart';
import 'package:myapp/widgets/card/card.dart';
import 'package:myapp/widgets/card/card_section.dart';

@RoutePage()
class AccountHomeView extends StatelessWidget {
  const AccountHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final space = SizedBox(height: 15);
    return BlocBuilder<AccountBloc, AccountState>(
        builder: (context, AccountState state) {
      return Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              LargeTitleAppBar('Account', paddingTop: 0),
              SliverPadding(
                padding: EdgeInsets.all(8),
                sliver: SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      if (state.isLogin) ...[
                        AccountUserCard(user: state.user),
                      ] else ...[
                        AccountNoUserCard(),
                      ],
                      space,
                      XCard(
                        padding: EdgeInsets.zero,
                        child: XCardSectionButton(
                          title: 'Policy',
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
