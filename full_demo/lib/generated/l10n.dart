// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `beta`
  String get beta {
    return Intl.message(
      'beta',
      name: 'beta',
      desc: '',
      args: [],
    );
  }

  /// `Coming Soon`
  String get comingSoon {
    return Intl.message(
      'Coming Soon',
      name: 'comingSoon',
      desc: '',
      args: [],
    );
  }

  /// `Alert`
  String get alert {
    return Intl.message(
      'Alert',
      name: 'alert',
      desc: '',
      args: [],
    );
  }

  /// `Avatar`
  String get avatar {
    return Intl.message(
      'Avatar',
      name: 'avatar',
      desc: '',
      args: [],
    );
  }

  /// `Avatar Group`
  String get avatarGroup {
    return Intl.message(
      'Avatar Group',
      name: 'avatarGroup',
      desc: '',
      args: [],
    );
  }

  /// `Badge`
  String get badge {
    return Intl.message(
      'Badge',
      name: 'badge',
      desc: '',
      args: [],
    );
  }

  /// `Breadcrumb`
  String get breadcrumb {
    return Intl.message(
      'Breadcrumb',
      name: 'breadcrumb',
      desc: '',
      args: [],
    );
  }

  /// `Button`
  String get button {
    return Intl.message(
      'Button',
      name: 'button',
      desc: '',
      args: [],
    );
  }

  /// `Button Group`
  String get buttonGroup {
    return Intl.message(
      'Button Group',
      name: 'buttonGroup',
      desc: '',
      args: [],
    );
  }

  /// `Button Toolbar`
  String get buttonToolbar {
    return Intl.message(
      'Button Toolbar',
      name: 'buttonToolbar',
      desc: '',
      args: [],
    );
  }

  /// `Calender`
  String get calender {
    return Intl.message(
      'Calender',
      name: 'calender',
      desc: '',
      args: [],
    );
  }

  /// `Carousel`
  String get carousel {
    return Intl.message(
      'Carousel',
      name: 'carousel',
      desc: '',
      args: [],
    );
  }

  /// `Collapse`
  String get collapse {
    return Intl.message(
      'Collapse',
      name: 'collapse',
      desc: '',
      args: [],
    );
  }

  /// `Dropdown`
  String get dropdown {
    return Intl.message(
      'Dropdown',
      name: 'dropdown',
      desc: '',
      args: [],
    );
  }

  /// `Embed`
  String get embed {
    return Intl.message(
      'Embed',
      name: 'embed',
      desc: '',
      args: [],
    );
  }

  /// `Image`
  String get image {
    return Intl.message(
      'Image',
      name: 'image',
      desc: '',
      args: [],
    );
  }

  /// `List Group`
  String get listGroup {
    return Intl.message(
      'List Group',
      name: 'listGroup',
      desc: '',
      args: [],
    );
  }

  /// `Media Object`
  String get mediaObject {
    return Intl.message(
      'Media Object',
      name: 'mediaObject',
      desc: '',
      args: [],
    );
  }

  /// `Modal`
  String get modal {
    return Intl.message(
      'Modal',
      name: 'modal',
      desc: '',
      args: [],
    );
  }

  /// `Nav`
  String get nav {
    return Intl.message(
      'Nav',
      name: 'nav',
      desc: '',
      args: [],
    );
  }

  /// `Overlay`
  String get overlay {
    return Intl.message(
      'Overlay',
      name: 'overlay',
      desc: '',
      args: [],
    );
  }

  /// `Pagination`
  String get pagination {
    return Intl.message(
      'Pagination',
      name: 'pagination',
      desc: '',
      args: [],
    );
  }

  /// `Pill`
  String get pill {
    return Intl.message(
      'Pill',
      name: 'pill',
      desc: '',
      args: [],
    );
  }

  /// `Popover`
  String get popover {
    return Intl.message(
      'Popover',
      name: 'popover',
      desc: '',
      args: [],
    );
  }

  /// `Progress`
  String get progress {
    return Intl.message(
      'Progress',
      name: 'progress',
      desc: '',
      args: [],
    );
  }

  /// `Sidebar`
  String get sidebar {
    return Intl.message(
      'Sidebar',
      name: 'sidebar',
      desc: '',
      args: [],
    );
  }

  /// `Spinner`
  String get spinner {
    return Intl.message(
      'Spinner',
      name: 'spinner',
      desc: '',
      args: [],
    );
  }

  /// `Tab`
  String get tab {
    return Intl.message(
      'Tab',
      name: 'tab',
      desc: '',
      args: [],
    );
  }

  /// `Table`
  String get table {
    return Intl.message(
      'Table',
      name: 'table',
      desc: '',
      args: [],
    );
  }

  /// `Time`
  String get time {
    return Intl.message(
      'Time',
      name: 'time',
      desc: '',
      args: [],
    );
  }

  /// `Toast`
  String get toast {
    return Intl.message(
      'Toast',
      name: 'toast',
      desc: '',
      args: [],
    );
  }

  /// `Timeline`
  String get timeline {
    return Intl.message(
      'Timeline',
      name: 'timeline',
      desc: '',
      args: [],
    );
  }

  /// `Tooltip`
  String get tooltip {
    return Intl.message(
      'Tooltip',
      name: 'tooltip',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
