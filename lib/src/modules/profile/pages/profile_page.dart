import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:vrouter/vrouter.dart';
import '../providers/profile_provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProfileProvider(context),
      child: const _ProfilePage(),
    );
  }
}

class _ProfilePage extends StatelessWidget {
  const _ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ProfileProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Color(0xFF223263),
          ),
        ),
      ),
      body: provider.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              children: [
                const Divider(
                  color: Color(0xFFEBF0FF),
                ),
                ListTile(
                  leading: const CircleAvatar(
                    radius: 36,
                  ),
                  minVerticalPadding: 24,
                  title: Text(
                    '${provider.profileDetail.firstName} ${provider.profileDetail.lastName}',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  subtitle: Text(
                    provider.profileDetail.username,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: const Color(0xFF9098B1)),
                  ),
                  onTap: () => context.vRouter.to(
                    'change_name',
                    historyState: {
                      "first_name": provider.profileDetail.firstName,
                      "last_name": provider.profileDetail.lastName,
                    },
                  ),
                ),
                ListTile(
                  onTap: () => context.vRouter.to(
                    'gender',
                    historyState: {
                      "gender": provider.profileDetail.gender,
                    },
                  ),
                  leading: SvgPicture.asset('assets/icons/Gender.svg'),
                  minVerticalPadding: 16,
                  title: Row(
                    children: <Widget>[
                      Text(
                        'Gender',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      Expanded(child: Container()),
                      Text(
                        provider.profileDetail.gender,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Color(0xFF9098B1)),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      SvgPicture.asset('assets/icons/Right.svg')
                    ],
                  ),
                ),
                ListTile(
                    leading: SvgPicture.asset('assets/icons/Date.svg'),
                    minVerticalPadding: 16,
                    title: Row(children: <Widget>[
                      Text(
                        'birthday',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      Expanded(child: Container()),
                      Text(
                        provider.profileDetail.birthDate.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Color(0xFF9098B1)),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      SvgPicture.asset('assets/icons/Right.svg')
                    ],
                    ),
                  onTap: () => context.vRouter.to(
                    'birth_date',
                    historyState: {
                      "birth_date": provider.profileDetail.birthDate.toString(),
                    },
                  ),
                ),
                ListTile(
                  leading: SvgPicture.asset('assets/icons/Message.svg'),
                  minVerticalPadding: 16,
                  title: Row(children: <Widget>[
                    Text(
                      'Email',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    Expanded(child: Container()),
                    Text(
                      provider.profileDetail.email.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Color(0xFF9098B1)),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    SvgPicture.asset('assets/icons/Right.svg')
                  ],
                  ),
                  onTap: () => context.vRouter.to(
                    'email',
                    historyState: {
                      "email": provider.profileDetail.email.toString(),
                    },
                  ),
                ),
                ListTile(
                  leading: SvgPicture.asset('assets/icons/Phone.svg'),
                  minVerticalPadding: 16,
                  title: Row(children: <Widget>[
                    Text(
                      'PhoneNumber',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    Expanded(child: Container()),
                    Text(
                      provider.profileDetail.phoneNumber.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Color(0xFF9098B1)),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    SvgPicture.asset('assets/icons/Right.svg')
                  ],
                  ),
                  onTap: () => context.vRouter.to(
                    'phone_number',
                    historyState: {
                      "phone_number": provider.profileDetail.phoneNumber.toString(),
                    },
                  ),
                ),

                ListTile(
                  leading: SvgPicture.asset('assets/icons/Password.svg'),
                  minVerticalPadding: 16,
                  title: Row(children: <Widget>[
                    Text(
                      'Change Password',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    Expanded(child: Container()),
                    Text(
                      '..........',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Color(0xFF9098B1),
                          ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    SvgPicture.asset('assets/icons/Right.svg')
                  ],
                  ),
                  onTap: () => context.vRouter.to(
                    'change_password',
                  ),
                ),
              ],
            ),
    );
  }
}
