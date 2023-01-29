import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

import 'package:flutter_boilerplate/client.dart';
import 'package:flutter_boilerplate/core/constants/app_strings.dart';
import 'package:flutter_boilerplate/core/exceptions/null_exception.dart';
import 'package:flutter_boilerplate/core/exceptions/surname_exception.dart';
import 'package:flutter_boilerplate/locator.dart';
import 'package:flutter_boilerplate/store/user/model/user_info.dart';
import 'package:flutter_boilerplate/store/user/viewmodel/user_store.dart';

part 'personal_details_viewmodel.g.dart';

// ignore: library_private_types_in_public_api
class PersonalDetailsViewModel = _PersonalDetailsViewModelBase
    with _$PersonalDetailsViewModel;

abstract class _PersonalDetailsViewModelBase with Store {
  final userStore = locator<UserStore>();

  String? name;
  String? surname;
  String? tcno;

  @observable
  String nameAndSurname = "";
  @observable
  String email = "";

  bool isEditing = false;
  @observable
  bool showErrorMessageTcNo = false;
  @observable
  bool showErrorMessageEmail = false;
  @observable
  bool showErrorMessageNameAndSurname = false;

  // @action
  // isPressedEdit() {
  //   isEditing = !isEditing;
  // }

  setNameAndSurname() {
    List<String> splitedNameAndSurname;
    String trimmedNameAndSurname = nameAndSurname.trim();
    if (trimmedNameAndSurname.contains(" ")) {
      splitedNameAndSurname = trimmedNameAndSurname.split(" ");
      name = splitedNameAndSurname.first;
      surname = splitedNameAndSurname.last;
    } else {
      throw SurnameException();
    }
  }

  Future<bool> updateUserInfo() async {
    bool isSuccess = false;
    if (nameAndSurname.isNotEmpty&& email.isNotEmpty) {
      setNameAndSurname();
      UserInfo updatedUserInfo = UserInfo(
          id: userStore.userInfo.id,
          appUserId: userStore.userInfo.appUserId,
          name: name ?? userStore.userInfo.name,
          surname: surname ?? userStore.userInfo.surname,
          tcno: userStore.userInfo.tcno,
          email: email);
      try {
        var response = await dioClient.put(
            AppStrings.USERS_INFO_PATH + userStore.userInfoId,
            data: updatedUserInfo.toMap());
        if (response.statusCode == 200) {
          // userStore.userInfo = UserInfo.fromMap(updatedUserInfo);
          userStore.userInfo = updatedUserInfo;
          debugPrint("güncelleme başariyla yapildi");
          isSuccess = true;
        }
      } catch (error) {
        debugPrint(error.toString());
        return Future.error(error);
      }
    } else {
      throw NullException();
    }
    return isSuccess;
  }
}
