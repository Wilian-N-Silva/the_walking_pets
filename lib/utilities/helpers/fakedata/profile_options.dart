import 'package:flutter/material.dart';
import 'package:the_walking_pets/model/profile_options.dart';
import 'package:the_walking_pets/screens/user/my_adoptions/adoption_list.dart';
import 'package:the_walking_pets/screens/user/my_data.dart';
import 'package:the_walking_pets/screens/user/my_donations/donation_list.dart';
import 'package:the_walking_pets/screens/user/my_locals/my_locals.dart';
import 'package:the_walking_pets/screens/user/my_pets/my_pets.dart';
import 'package:the_walking_pets/screens/user/user_profile.dart';

List<ProfileSettings> profileOptions = [
  ProfileSettings(
    title: 'Meus Dados',
    icon: Icons.person,
    route: const MyData(),
  ),
  ProfileSettings(
    title: 'Meus Pets',
    icon: Icons.pets,
    route: const MyPets(
      postInsert: false,
      adoption: false,
    ),
  ),
  ProfileSettings(
    title: 'Endereços',
    subtitle: 'Meus endereços',
    icon: Icons.pin_drop,
    route: const MyLocals(),
  ),
  ProfileSettings(
    title: 'Adoção',
    subtitle: 'Acompanhe o progresso do pedido de adoção',
    icon: Icons.favorite,
    route: const AdoptionList(),
  ),
  ProfileSettings(
    title: 'Doação',
    icon: Icons.home,
    route: const MyDonations(),
  ),
  ProfileSettings(
    title: 'Achados e Perdidos',
    icon: Icons.screen_search_desktop_outlined,
    route: const UserProfile(),
  ),
];
