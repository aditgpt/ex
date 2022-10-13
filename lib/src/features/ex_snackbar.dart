// ignore_for_file: cast_nullable_to_non_nullable, use_named_constants, invalid_null_aware_operator, constant_identifier_names

import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import '../../ex.dart';

/*
 * ExSnackbar
 * Created by Aditya Pratama
 * https://adit.com
 *
 * Copyright (c) 2021 MDVK, LLC. All rights reserved.
 * See LICENSE for distribution and usage details.
 */
mixin ExSnackbar {
  // —————————————————————————————————————————————————————————————————————————————
  // info
  // —————————————————————————————————————————————————————————————————————————————
  static void infoTop(
    String message, {
    String? title,
    double? titleSize,
    Color? titleColor = Colors.black,
    double? messageSize,
    Color? messageColor = Colors.black,
    Color backgroundColor = const Color(0xffF3F6FE),
    IconData? icon = Icons.info,
    Duration duration = const Duration(seconds: 3),
    double radius = 4,
    double margin = 8,
    FlushbarPosition position = FlushbarPosition.TOP,
    bool isDismissible = true,
  }) {
    Flushbar(
      title: title,
      titleSize: titleSize,
      titleColor: titleColor,
      message: message,
      messageSize: messageSize,
      messageColor: messageColor,
      backgroundColor: backgroundColor,
      icon: Icon(icon, color: Color(0xFF22328F)),
      leftBarIndicatorColor: Color(0xFF22328F),
      borderRadius: BorderRadius.circular(radius),
      margin: EdgeInsets.all(margin),
      isDismissible: isDismissible,
      duration: duration,
      flushbarPosition: position,
    ).show(Get.context!);
  }

  // —————————————————————————————————————————————————————————————————————————————
  // danger
  // —————————————————————————————————————————————————————————————————————————————
  static void dangerTop(
    String message, {
    String? title,
    double? titleSize,
    Color? titleColor = Colors.black,
    double? messageSize,
    Color? messageColor = Colors.black,
    Color backgroundColor = const Color(0xFFFFF4F5),
    IconData? icon = Icons.info,
    Duration duration = const Duration(seconds: 3),
    double radius = 4,
    double margin = 4,
    FlushbarPosition position = FlushbarPosition.TOP,
    bool isDismissible = true,
  }) {
    Flushbar(
      title: title,
      titleSize: titleSize,
      titleColor: titleColor,
      message: message,
      messageSize: messageSize,
      messageColor: messageColor,
      backgroundColor: backgroundColor,
      icon: Icon(icon, color: Colors.red[800]),
      leftBarIndicatorColor: Colors.red[800],
      borderRadius: BorderRadius.circular(radius),
      margin: EdgeInsets.all(margin),
      isDismissible: isDismissible,
      duration: duration,
      flushbarPosition: position,
    ).show(Get.context!);
  }

  // —————————————————————————————————————————————————————————————————————————————
  // warning
  // —————————————————————————————————————————————————————————————————————————————
  static void warningTop(
    String message, {
    String? title,
    double? titleSize,
    Color? titleColor = Colors.black,
    double? messageSize,
    Color? messageColor = Colors.black,
    Color backgroundColor = const Color(0xFFFFFDF3),
    IconData? icon = Icons.warning,
    Duration duration = const Duration(seconds: 3),
    double radius = 4,
    double margin = 4,
    FlushbarPosition position = FlushbarPosition.TOP,
    bool isDismissible = true,
  }) {
    Flushbar(
      title: title,
      titleSize: titleSize,
      titleColor: titleColor,
      message: message,
      messageSize: messageSize,
      messageColor: messageColor,
      backgroundColor: backgroundColor,
      icon: Icon(icon, color: Color(0xFFF69348)),
      leftBarIndicatorColor: Color(0xFFF69348),
      borderRadius: BorderRadius.circular(radius),
      margin: EdgeInsets.all(margin),
      isDismissible: isDismissible,
      duration: duration,
      flushbarPosition: position,
    ).show(Get.context!);
  }

  // —————————————————————————————————————————————————————————————————————————————
  // success
  // —————————————————————————————————————————————————————————————————————————————
  static void successTop(
    String message, {
    String? title,
    double? titleSize,
    Color? titleColor = Colors.black,
    double? messageSize,
    Color? messageColor = Colors.black,
    Color backgroundColor = const Color(0xFFE9F5F2),
    IconData? icon = Icons.check_circle,
    Duration duration = const Duration(seconds: 3),
    double radius = 4,
    double margin = 4,
    FlushbarPosition position = FlushbarPosition.TOP,
    bool isDismissible = true,
  }) {
    Flushbar(
      title: title,
      titleSize: titleSize,
      titleColor: titleColor,
      message: message,
      messageSize: messageSize,
      messageColor: messageColor,
      backgroundColor: backgroundColor,
      icon: Icon(icon, color: Colors.green[800]),
      leftBarIndicatorColor: Colors.green[800],
      borderRadius: BorderRadius.circular(radius),
      margin: EdgeInsets.all(margin),
      isDismissible: isDismissible,
      duration: duration,
      flushbarPosition: position,
    ).show(Get.context!);
  }

  // —————————————————————————————————————————————————————————————————————————————
  // action
  // —————————————————————————————————————————————————————————————————————————————
  static void action({
    required String message,
    required Widget button,
    String? title,
    Duration duration = const Duration(seconds: 3),
  }) {
    Flushbar(
      title: title,
      message: message,
      duration: duration,
      mainButton: button,
    ).show(Get.context!);
  }

  static void uploading({
    required String message,
    String? title,
    Duration duration = const Duration(seconds: 3),
    AnimationController? progressIndicatorController,
    Color? progressIndicatorBackgroundColor,
  }) {
    Flushbar(
      title: title,
      message: message,
      icon: Icon(Icons.cloud_upload, color: Colors.blue[300]),
      duration: duration,
      showProgressIndicator: true,
      progressIndicatorController: progressIndicatorController,
      progressIndicatorBackgroundColor: progressIndicatorBackgroundColor,
    ).show(Get.context!);
  }

  // —————————————————————————————————————————————————————————————————————————————
  // ver2 : bottom
  // —————————————————————————————————————————————————————————————————————————————

  static void neutral(String message, {int? duration, bool showIcon = true}) {
    final snackBar = SnackBar(
      content: HStack([
        if (showIcon == true) Icon(Icons.info, color: Colors.white),
        12.widthBox,
        message.text.black.overflow(TextOverflow.ellipsis).maxLines(3).make().expand(),
      ]),
      backgroundColor: Colors.black,
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: duration ?? 2),
    );
    ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
  }

  static void info(String message, {int? duration, bool showIcon = true}) {
    final snackBar = SnackBar(
      content: Container(
        decoration: ExDecorator.commonBoxDecoration(borderColor: Color(0xFF093479)),
        child: HStack([
          if (showIcon == true) Icon(Icons.info, color: Color(0xFF093479)),
          12.widthBox,
          message.text.black.overflow(TextOverflow.ellipsis).maxLines(3).make().expand(),
        ]).p12(),
      ),
      padding: EdgeInsets.all(0),
      backgroundColor: Color(0xFFE8F9FE),
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: duration ?? 2),
    );
    ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
  }

  static void danger(String message, {int? duration, bool showIcon = true}) {
    final snackBar = SnackBar(
      content: Container(
        decoration: ExDecorator.commonBoxDecoration(borderColor: Color(0xFF881135)),
        child: HStack([
          if (showIcon == true) Icon(Icons.info, color: Color(0xFF881135)),
          12.widthBox,
          message.text.black.overflow(TextOverflow.ellipsis).maxLines(3).make().expand(),
        ]).p12(),
      ),
      padding: EdgeInsets.all(0),
      backgroundColor: Color(0xFFFFF4F5),
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: duration ?? 2),
    );
    ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
  }

  static void success(String message, {int? duration, bool showIcon = true}) {
    final snackBar = SnackBar(
      content: Container(
        decoration: ExDecorator.commonBoxDecoration(borderColor: Color(0xFF0E3E33)),
        child: HStack([
          if (showIcon == true) Icon(Icons.check_circle, color: Color(0xFF0E3E33)),
          12.widthBox,
          message.text.black.overflow(TextOverflow.ellipsis).maxLines(3).make().expand(),
        ]).p12(),
      ),
      padding: EdgeInsets.all(0),
      backgroundColor: Color(0xFFE9F5F2),
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: duration ?? 2),
    );
    ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
  }

  static void warning(String message, {int? duration, bool showIcon = true}) {
    final snackBar = SnackBar(
      content: Container(
        decoration: ExDecorator.commonBoxDecoration(borderColor: Color(0xFF93662A)),
        child: HStack([
          if (showIcon == true) Icon(Icons.warning, color: Color(0xFF93662A)),
          12.widthBox,
          message.text.black.overflow(TextOverflow.ellipsis).maxLines(3).make().expand(),
        ]).p12(),
      ),
      padding: EdgeInsets.all(0),
      backgroundColor: Color(0xFFFFFDF3),
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: duration ?? 2),
    );
    ScaffoldMessenger.of(Get.context!).showSnackBar(snackBar);
  }
}

// —————————————————————————————————————————————————————————————————————————————
// flushbar
// —————————————————————————————————————————————————————————————————————————————

const String FLUSHBAR_ROUTE_NAME = '/flushbarRoute';

typedef FlushbarStatusCallback = void Function(FlushbarStatus? status);
typedef OnTap = void Function(Flushbar flushbar);

/// A highly customizable widget so you can notify your user when you fell like he needs a beautiful explanation.
// ignore: must_be_immutable
class Flushbar<T> extends StatefulWidget {
  Flushbar(
      {Key? key,
      this.title,
      this.titleColor,
      this.titleSize,
      this.message,
      this.messageSize,
      this.messageColor,
      this.titleText,
      this.messageText,
      this.icon,
      this.shouldIconPulse = true,
      this.maxWidth,
      this.margin = const EdgeInsets.all(0.0),
      this.padding = const EdgeInsets.all(16),
      this.borderRadius,
      this.textDirection = TextDirection.ltr,
      this.borderColor,
      this.borderWidth = 1.0,
      this.backgroundColor = const Color(0xFF303030),
      this.leftBarIndicatorColor,
      this.boxShadows,
      this.backgroundGradient,
      this.mainButton,
      this.onTap,
      this.duration,
      this.isDismissible = true,
      this.dismissDirection = FlushbarDismissDirection.VERTICAL,
      this.showProgressIndicator = false,
      this.progressIndicatorController,
      this.progressIndicatorBackgroundColor,
      this.progressIndicatorValueColor,
      this.flushbarPosition = FlushbarPosition.BOTTOM,
      this.positionOffset = 0.0,
      this.flushbarStyle = FlushbarStyle.FLOATING,
      this.forwardAnimationCurve = Curves.easeOutCirc,
      this.reverseAnimationCurve = Curves.easeOutCirc,
      this.animationDuration = const Duration(seconds: 1),
      FlushbarStatusCallback? onStatusChanged,
      this.barBlur = 0.0,
      this.blockBackgroundInteraction = false,
      this.routeBlur,
      this.routeColor,
      this.userInputForm,
      this.endOffset,
      this.flushbarRoute // Please dont init this
      })
      // ignore: prefer_initializing_formals
      : onStatusChanged = onStatusChanged,
        super(key: key) {
    onStatusChanged = onStatusChanged ?? (status) {};
  }

  /// A callback for you to listen to the different Flushbar status
  final FlushbarStatusCallback? onStatusChanged;

  /// The title displayed to the user
  final String? title;

  /// The title text size displayed to the user
  final double? titleSize;

  /// Color title displayed to the user ? default is black
  final Color? titleColor;

  /// The message displayed to the user.
  final String? message;

  /// The message text size displayed to the user.
  final double? messageSize;

  /// Color message displayed to the user ? default is black
  final Color? messageColor;

  /// Replaces [title]. Although this accepts a [Widget], it is meant to receive [Text] or [RichText]
  final Widget? titleText;

  /// Replaces [message]. Although this accepts a [Widget], it is meant to receive [Text] or  [RichText]
  final Widget? messageText;

  /// Will be ignored if [backgroundGradient] is not null
  final Color backgroundColor;

  /// If not null, shows a left vertical bar to better indicate the humor of the notification.
  /// It is not possible to use it with a [Form] and I do not recommend using it with [LinearProgressIndicator]
  final Color? leftBarIndicatorColor;

  /// [boxShadows] The shadows generated by Flushbar. Leave it null if you don't want a shadow.
  /// You can use more than one if you feel the need.
  /// Check (this example)[https://github.com/flutter/flutter/blob/master/packages/flutter/lib/src/material/shadows.dart]
  final List<BoxShadow>? boxShadows;

  /// Makes [backgroundColor] be ignored.
  final Gradient? backgroundGradient;

  /// You can use any widget here, but I recommend [Icon] or [Image] as indication of what kind
  /// of message you are displaying. Other widgets may break the layout
  final Widget? icon;

  /// An option to animate the icon (if present). Defaults to true.
  final bool shouldIconPulse;

  /// Use if you need an action from the user. [TextButton] is recommended here
  final Widget? mainButton;

  /// A callback that registers the user's click anywhere. An alternative to [mainButton]
  final OnTap? onTap;

  /// How long until Flushbar will hide itself (be dismissed). To make it indefinite, leave it null.
  final Duration? duration;

  /// True if you want to show a [LinearProgressIndicator].
  /// If [progressIndicatorController] is null, an infinite progress indicator will be shown
  final bool showProgressIndicator;

  /// An optional [AnimationController] when you want to control the progress of your [LinearProgressIndicator].
  /// You are responsible for controlling the progress
  final AnimationController? progressIndicatorController;

  /// A [LinearProgressIndicator] configuration parameter.
  final Color? progressIndicatorBackgroundColor;

  /// A [LinearProgressIndicator] configuration parameter.
  final Animation<Color>? progressIndicatorValueColor;

  /// Determines if the user can swipe or click the overlay (if [routeBlur] > 0) to dismiss.
  /// It is recommended that you set [duration] != null if this is false.
  /// If the user swipes to dismiss or clicks the overlay, no value will be returned.
  final bool isDismissible;

  /// Used to limit Flushbar width (usually on large screens)
  final double? maxWidth;

  /// Adds a custom margin to Flushbar
  final EdgeInsets margin;

  /// Adds a custom padding to Flushbar
  /// The default follows material design guide line
  final EdgeInsets padding;

  /// Adds a radius to corners specified of Flushbar. Best combined with [margin].
  /// I do not recommend using it with [showProgressIndicator] or [leftBarIndicatorColor].
  final BorderRadius? borderRadius;

  /// [TextDirection.ltr] by default
  /// added to support rtl languages
  final TextDirection textDirection;

  // Adds a border to every side of Flushbar
  /// I do not recommend using it with [showProgressIndicator] or [leftBarIndicatorColor].
  final Color? borderColor;

  /// Changes the width of the border if [borderColor] is specified
  final double borderWidth;

  /// Flushbar can be based on [FlushbarPosition.TOP] or on [FlushbarPosition.BOTTOM] of your screen.
  /// [FlushbarPosition.BOTTOM] is the default.
  final FlushbarPosition flushbarPosition;

  final double positionOffset;

  /// [FlushbarDismissDirection.VERTICAL] by default.
  /// Can also be [FlushbarDismissDirection.HORIZONTAL] in which case both left and right dismiss are allowed.
  final FlushbarDismissDirection dismissDirection;

  /// Flushbar can be floating or be grounded to the edge of the screen.
  /// If grounded, I do not recommend using [margin] or [borderRadius]. [FlushbarStyle.FLOATING] is the default
  /// If grounded, I do not recommend using a [backgroundColor] with transparency or [barBlur]
  final FlushbarStyle flushbarStyle;

  /// The [Curve] animation used when show() is called. [Curves.easeOut] is default
  final Curve forwardAnimationCurve;

  /// The [Curve] animation used when dismiss() is called. [Curves.fastOutSlowIn] is default
  final Curve reverseAnimationCurve;

  /// Use it to speed up or slow down the animation duration
  final Duration animationDuration;

  /// Default is 0.0. If different than 0.0, blurs only Flushbar's background.
  /// To take effect, make sure your [backgroundColor] has some opacity.
  /// The greater the value, the greater the blur.
  final double barBlur;

  /// Determines if user can interact with the screen behind it
  /// If this is false, [routeBlur] and [routeColor] will be ignored
  final bool blockBackgroundInteraction;

  /// Default is 0.0. If different than 0.0, creates a blurred
  /// overlay that prevents the user from interacting with the screen.
  /// The greater the value, the greater the blur.
  /// It does not take effect if [blockBackgroundInteraction] is false
  final double? routeBlur;

  /// Default is [Colors.transparent]. Only takes effect if [routeBlur] > 0.0.
  /// Make sure you use a color with transparency here e.g. Colors.grey[600].withOpacity(0.2).
  /// It does not take effect if [blockBackgroundInteraction] is false
  final Color? routeColor;

  /// A [TextFormField] in case you want a simple user input. Every other widget is ignored if this is not null.
  final Form? userInputForm;

  /// Offset to be added to the end Flushbar position.
  /// Intended to replace [margin] when you need items below Flushbar to be accessible
  final Offset? endOffset;

  FlushbarRoute<T?>? flushbarRoute;

  /// Show the flushbar. Kicks in [FlushbarStatus.IS_APPEARING] state followed by [FlushbarStatus.SHOWING]
  Future<T?> show(BuildContext context) async {
    flushbarRoute = showFlushbar<T>(
      context: context,
      flushbar: this,
    ) as FlushbarRoute<T?>;

    return Navigator.of(context).push(flushbarRoute as Route<T>);
  }

  /// Dismisses the flushbar causing is to return a future containing [result].
  /// When this future finishes, it is guaranteed that Flushbar was dismissed.
  Future<T?> dismiss([T? result]) async {
    // If route was never initialized, do nothing
    if (flushbarRoute == null) {
      return null;
    }

    if (flushbarRoute!.isCurrent) {
      flushbarRoute!.navigator!.pop(result);
      return flushbarRoute!.completed;
    } else if (flushbarRoute!.isActive) {
      // removeRoute is called every time you dismiss a Flushbar that is not the top route.
      // It will not animate back and listeners will not detect FlushbarStatus.IS_HIDING or FlushbarStatus.DISMISSED
      // To avoid this, always make sure that Flushbar is the top route when it is being dismissed
      flushbarRoute!.navigator!.removeRoute(flushbarRoute!);
    }

    return null;
  }

  /// Checks if the flushbar is visible
  bool isShowing() {
    if (flushbarRoute == null) {
      return false;
    }
    return flushbarRoute!.currentStatus == FlushbarStatus.SHOWING;
  }

  /// Checks if the flushbar is dismissed
  bool isDismissed() {
    if (flushbarRoute == null) {
      return false;
    }
    return flushbarRoute!.currentStatus == FlushbarStatus.DISMISSED;
  }

  bool isAppearing() {
    if (flushbarRoute == null) {
      return false;
    }
    return flushbarRoute!.currentStatus == FlushbarStatus.IS_APPEARING;
  }

  bool isHiding() {
    if (flushbarRoute == null) {
      return false;
    }
    return flushbarRoute!.currentStatus == FlushbarStatus.IS_HIDING;
  }

  @override
  State createState() => _FlushbarState<T?>();
}

class _FlushbarState<K extends Object?> extends State<Flushbar<K>> with TickerProviderStateMixin {
  final Duration _pulseAnimationDuration = const Duration(seconds: 1);
  final Widget _emptyWidget = const SizedBox();
  final double _initialOpacity = 1.0;
  final double _finalOpacity = 0.4;

  GlobalKey? _backgroundBoxKey;
  FlushbarStatus? currentStatus;
  AnimationController? _fadeController;
  late Animation<double> _fadeAnimation;
  late bool _isTitlePresent;
  late double _messageTopMargin;
  FocusScopeNode? _focusNode;
  late FocusAttachment _focusAttachment;
  late Completer<Size> _boxHeightCompleter;

  CurvedAnimation? _progressAnimation;

  @override
  void initState() {
    super.initState();

    _backgroundBoxKey = GlobalKey();
    _boxHeightCompleter = Completer<Size>();

    assert(widget.userInputForm != null || ((widget.message != null && widget.message!.isNotEmpty) || widget.messageText != null),
        'A message is mandatory if you are not using userInputForm. Set either a message or messageText');

    _isTitlePresent = widget.title != null || widget.titleText != null;
    _messageTopMargin = _isTitlePresent ? 6.0 : widget.padding.top;

    _configureLeftBarFuture();
    _configureProgressIndicatorAnimation();

    if (widget.icon != null && widget.shouldIconPulse) {
      _configurePulseAnimation();
      _fadeController?.forward();
    }

    _focusNode = FocusScopeNode();
    _focusAttachment = _focusNode!.attach(context);
  }

  @override
  void dispose() {
    _fadeController?.dispose();
    widget.progressIndicatorController?.dispose();

    _focusAttachment.detach();
    _focusNode!.dispose();
    super.dispose();
  }

  void _configureLeftBarFuture() {
    SchedulerBinding.instance?.addPostFrameCallback(
      (_) {
        final keyContext = _backgroundBoxKey!.currentContext;

        if (keyContext != null) {
          final box = keyContext.findRenderObject() as RenderBox;
          _boxHeightCompleter.complete(box.size);
        }
      },
    );
  }

  void _configureProgressIndicatorAnimation() {
    if (widget.showProgressIndicator && widget.progressIndicatorController != null) {
      _progressAnimation = CurvedAnimation(curve: Curves.linear, parent: widget.progressIndicatorController!);
    }
  }

  void _configurePulseAnimation() {
    _fadeController = AnimationController(vsync: this, duration: _pulseAnimationDuration);
    _fadeAnimation = Tween(begin: _initialOpacity, end: _finalOpacity).animate(
      CurvedAnimation(
        parent: _fadeController!,
        curve: Curves.linear,
      ),
    );

    _fadeController!.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _fadeController!.reverse();
      }
      if (status == AnimationStatus.dismissed) {
        _fadeController!.forward();
      }
    });

    _fadeController!.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      heightFactor: 1.0,
      child: Material(
        color: widget.flushbarStyle == FlushbarStyle.FLOATING ? Colors.transparent : widget.backgroundColor,
        child: SafeArea(
          minimum: widget.flushbarPosition == FlushbarPosition.BOTTOM ? EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom) : EdgeInsets.only(top: MediaQuery.of(context).viewInsets.top),
          // ? EdgeInsets.only(
          //     bottom: (MediaQuery.of(context).padding.bottom +
          //         widget.positionOffset))
          // : EdgeInsets.only(
          //     top: (MediaQuery.of(context).padding.top) +
          //         widget.positionOffset),
          bottom: widget.flushbarPosition == FlushbarPosition.BOTTOM,
          top: widget.flushbarPosition == FlushbarPosition.TOP,
          left: false,
          right: false,
          child: _getFlushbar(),
        ),
      ),
    );
  }

  Widget _getFlushbar() {
    Widget flushbar;

    if (widget.userInputForm != null) {
      flushbar = _generateInputFlushbar();
    } else {
      flushbar = _generateFlushbar();
    }

    return Stack(
      children: [
        FutureBuilder(
          future: _boxHeightCompleter.future,
          builder: (context, AsyncSnapshot<Size> snapshot) {
            if (snapshot.hasData) {
              if (widget.barBlur == 0) {
                //fixes https://github.com/cmdrootaccess/another-flushbar/issues/8
                return _emptyWidget;
              }
              return ClipRRect(
                borderRadius: widget.borderRadius,
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: widget.barBlur, sigmaY: widget.barBlur),
                  child: Container(
                    height: snapshot.data!.height,
                    width: snapshot.data!.width,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: widget.borderRadius,
                    ),
                  ),
                ),
              );
            }
            return _emptyWidget;
          },
        ),
        flushbar,
      ],
    );
  }

  Widget _generateInputFlushbar() {
    return Container(
      key: _backgroundBoxKey,
      constraints: widget.maxWidth != null ? BoxConstraints(maxWidth: widget.maxWidth!) : null,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        gradient: widget.backgroundGradient,
        boxShadow: widget.boxShadows,
        borderRadius: widget.borderRadius,
        border: widget.borderColor != null ? Border.all(color: widget.borderColor!, width: widget.borderWidth) : null,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0, top: 16.0),
        child: FocusScope(
          node: _focusNode,
          autofocus: true,
          child: widget.userInputForm!,
        ),
      ),
    );
  }

  Widget _generateFlushbar() {
    return Container(
      key: _backgroundBoxKey,
      constraints: widget.maxWidth != null ? BoxConstraints(maxWidth: widget.maxWidth!) : null,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        gradient: widget.backgroundGradient,
        boxShadow: widget.boxShadows,
        borderRadius: widget.borderRadius,
        border: widget.borderColor != null ? Border.all(color: widget.borderColor!, width: widget.borderWidth) : null,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildProgressIndicator(),
          Row(
            children: _getAppropriateRowLayout(),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressIndicator() {
    if (widget.showProgressIndicator && _progressAnimation != null) {
      return AnimatedBuilder(
          animation: _progressAnimation!,
          builder: (_, __) {
            return LinearProgressIndicator(
              value: _progressAnimation!.value,
              backgroundColor: widget.progressIndicatorBackgroundColor,
              valueColor: widget.progressIndicatorValueColor,
            );
          });
    }

    if (widget.showProgressIndicator) {
      return LinearProgressIndicator(
        backgroundColor: widget.progressIndicatorBackgroundColor,
        valueColor: widget.progressIndicatorValueColor,
      );
    }

    return _emptyWidget;
  }

  List<Widget> _getAppropriateRowLayout() {
    double buttonRightPadding;
    var iconPadding = 0.0;
    if (widget.padding.right - 12 < 0) {
      buttonRightPadding = 4;
    } else {
      buttonRightPadding = widget.padding.right - 12;
    }

    if (widget.padding.left > 16.0) {
      iconPadding = widget.padding.left;
    }

    if (widget.icon == null && widget.mainButton == null) {
      return [
        _buildLeftBarIndicator(),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              if (_isTitlePresent)
                Padding(
                  padding: EdgeInsets.only(
                    top: widget.padding.top,
                    left: widget.padding.left,
                    right: widget.padding.right,
                  ),
                  child: _getTitleText(),
                )
              else
                _emptyWidget,
              Padding(
                padding: EdgeInsets.only(
                  top: _messageTopMargin,
                  left: widget.padding.left,
                  right: widget.padding.right,
                  bottom: widget.padding.bottom,
                ),
                child: widget.messageText ?? _getDefaultNotificationText(),
              ),
            ],
          ),
        ),
      ];
    } else if (widget.icon != null && widget.mainButton == null) {
      return <Widget>[
        _buildLeftBarIndicator(),
        ConstrainedBox(
          constraints: BoxConstraints.tightFor(width: 42.0 + iconPadding),
          child: _getIcon(),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              if (_isTitlePresent)
                Padding(
                  padding: EdgeInsets.only(
                    top: widget.padding.top,
                    left: 4.0,
                    right: widget.padding.left,
                  ),
                  child: _getTitleText(),
                )
              else
                _emptyWidget,
              Padding(
                padding: EdgeInsets.only(
                  top: _messageTopMargin,
                  left: 4.0,
                  right: widget.padding.right,
                  bottom: widget.padding.bottom,
                ),
                child: widget.messageText ?? _getDefaultNotificationText(),
              ),
            ],
          ),
        ),
      ];
    } else if (widget.icon == null && widget.mainButton != null) {
      return <Widget>[
        _buildLeftBarIndicator(),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              if (_isTitlePresent)
                Padding(
                  padding: EdgeInsets.only(
                    top: widget.padding.top,
                    left: widget.padding.left,
                    right: widget.padding.right,
                  ),
                  child: _getTitleText(),
                )
              else
                _emptyWidget,
              Padding(
                padding: EdgeInsets.only(
                  top: _messageTopMargin,
                  left: widget.padding.left,
                  right: 8.0,
                  bottom: widget.padding.bottom,
                ),
                child: widget.messageText ?? _getDefaultNotificationText(),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: buttonRightPadding),
          child: _getMainActionButton(),
        ),
      ];
    } else {
      return <Widget>[
        _buildLeftBarIndicator(),
        ConstrainedBox(
          constraints: BoxConstraints.tightFor(width: 42.0 + iconPadding),
          child: _getIcon(),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              if (_isTitlePresent)
                Padding(
                  padding: EdgeInsets.only(
                    top: widget.padding.top,
                    left: 4.0,
                    right: 8.0,
                  ),
                  child: _getTitleText(),
                )
              else
                _emptyWidget,
              Padding(
                padding: EdgeInsets.only(
                  top: _messageTopMargin,
                  left: 4.0,
                  right: 8.0,
                  bottom: widget.padding.bottom,
                ),
                child: widget.messageText ?? _getDefaultNotificationText(),
              ),
            ],
          ),
        ),
        if (_getMainActionButton() != null)
          Padding(
            padding: EdgeInsets.only(right: buttonRightPadding),
            child: _getMainActionButton(),
          )
        else
          _emptyWidget,
      ];
    }
  }

  Widget _buildLeftBarIndicator() {
    if (widget.leftBarIndicatorColor != null) {
      return FutureBuilder(
        future: _boxHeightCompleter.future,
        builder: (BuildContext buildContext, AsyncSnapshot<Size> snapshot) {
          if (snapshot.hasData) {
            return Container(
              width: 8.0,
              height: snapshot.data!.height,
              decoration: BoxDecoration(
                borderRadius: widget.borderRadius == null
                    ? null
                    : widget.textDirection == TextDirection.ltr
                        ? BorderRadius.only(topLeft: widget.borderRadius!.topLeft, bottomLeft: widget.borderRadius!.bottomLeft)
                        : BorderRadius.only(topRight: widget.borderRadius!.topRight, bottomRight: widget.borderRadius!.bottomRight),
                color: widget.leftBarIndicatorColor,
              ),
            );
          } else {
            return _emptyWidget;
          }
        },
      );
    } else {
      return _emptyWidget;
    }
  }

  Widget? _getIcon() {
    if (widget.icon != null && widget.icon is Icon && widget.shouldIconPulse) {
      return FadeTransition(
        opacity: _fadeAnimation,
        child: widget.icon,
      );
    } else if (widget.icon != null) {
      return widget.icon;
    } else {
      return _emptyWidget;
    }
  }

  Widget? _getTitleText() {
    return widget.titleText ??
        Text(
          widget.title ?? '',
          style: TextStyle(fontSize: widget.titleSize ?? 16.0, color: widget.titleColor ?? Colors.white, fontWeight: FontWeight.bold),
        );
  }

  Text _getDefaultNotificationText() {
    return Text(
      widget.message ?? '',
      style: TextStyle(fontSize: widget.messageSize ?? 14.0, color: widget.messageColor ?? Colors.white),
    );
  }

  Widget? _getMainActionButton() {
    if (widget.mainButton != null) {
      return widget.mainButton;
    } else {
      return null;
    }
  }
}

/// Indicates if flushbar is going to start at the [TOP] or at the [BOTTOM]
enum FlushbarPosition { TOP, BOTTOM }

/// Indicates if flushbar will be attached to the edge of the screen or not
enum FlushbarStyle { FLOATING, GROUNDED }

/// Indicates the direction in which it is possible to dismiss
/// If vertical, dismiss up will be allowed if [FlushbarPosition.TOP]
/// If vertical, dismiss down will be allowed if [FlushbarPosition.BOTTOM]
enum FlushbarDismissDirection { HORIZONTAL, VERTICAL }

/// Indicates the animation status
/// [FlushbarStatus.SHOWING] Flushbar has stopped and the user can see it
/// [FlushbarStatus.DISMISSED] Flushbar has finished its mission and returned any pending values
/// [FlushbarStatus.IS_APPEARING] Flushbar is moving towards [FlushbarStatus.SHOWING]
/// [FlushbarStatus.IS_HIDING] Flushbar is moving towards [] [FlushbarStatus.DISMISSED]
enum FlushbarStatus { SHOWING, DISMISSED, IS_APPEARING, IS_HIDING }

// —————————————————————————————————————————————————————————————————————————————
// flushbar_route
// —————————————————————————————————————————————————————————————————————————————

class FlushbarRoute<T> extends OverlayRoute<T> {
  FlushbarRoute({
    required this.flushbar,
    RouteSettings? settings,
  })  : _builder = Builder(builder: (BuildContext innerContext) {
          return GestureDetector(
            onTap: flushbar.onTap != null ? () => flushbar.onTap!(flushbar) : null,
            child: flushbar,
          );
        }),
        _onStatusChanged = flushbar.onStatusChanged,
        super(settings: settings) {
    _configureAlignment(flushbar.flushbarPosition);
  }

  final Flushbar flushbar;
  final Builder _builder;
  final Completer<T> _transitionCompleter = Completer<T>();
  final FlushbarStatusCallback? _onStatusChanged;

  Animation<double>? _filterBlurAnimation;
  Animation<Color?>? _filterColorAnimation;
  Alignment? _initialAlignment;
  Alignment? _endAlignment;
  bool _wasDismissedBySwipe = false;
  Timer? _timer;
  T? _result;
  FlushbarStatus? currentStatus;

  void _configureAlignment(FlushbarPosition flushbarPosition) {
    switch (flushbar.flushbarPosition) {
      case FlushbarPosition.TOP:
        {
          _initialAlignment = const Alignment(-1.0, -2.0);
          if (flushbar.endOffset != null) {
            _endAlignment = const Alignment(-1.0, -1.0) + Alignment(flushbar.endOffset!.dx, flushbar.endOffset!.dy);
          } else {
            _endAlignment = const Alignment(-1.0, -1.0);
          }
          break;
        }
      case FlushbarPosition.BOTTOM:
        {
          _initialAlignment = const Alignment(-1.0, 2.0);
          _endAlignment = flushbar.endOffset != null ? const Alignment(-1.0, 1.0) + Alignment(flushbar.endOffset!.dx, flushbar.endOffset!.dy) : const Alignment(-1.0, 1.0);
          break;
        }
    }
  }

  Future<T> get completed => _transitionCompleter.future;
  bool get opaque => false;

  @override
  Future<RoutePopDisposition> willPop() {
    if (!flushbar.isDismissible) {
      return Future.value(RoutePopDisposition.doNotPop);
    }

    return Future.value(RoutePopDisposition.pop);
  }

  @override
  Iterable<OverlayEntry> createOverlayEntries() {
    final overlays = <OverlayEntry>[];

    if (flushbar.blockBackgroundInteraction) {
      overlays.add(
        OverlayEntry(
            builder: (BuildContext context) {
              return Listener(
                onPointerDown: flushbar.isDismissible ? (_) => flushbar.dismiss() : null,
                child: _createBackgroundOverlay(),
              );
            },
            opaque: opaque),
      );
    }

    overlays.add(
      OverlayEntry(
          builder: (BuildContext context) {
            final Widget annotatedChild = Semantics(
              focused: false,
              container: true,
              explicitChildNodes: true,
              child: AlignTransition(
                alignment: _animation!,
                child: flushbar.isDismissible ? _getDismissibleFlushbar(_builder) : _getFlushbar(),
              ),
            );
            return annotatedChild;
          },
          opaque: opaque),
    );

    return overlays;
  }

  Widget _createBackgroundOverlay() {
    if (_filterBlurAnimation != null && _filterColorAnimation != null) {
      return AnimatedBuilder(
        animation: _filterBlurAnimation!,
        builder: (context, child) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: _filterBlurAnimation!.value, sigmaY: _filterBlurAnimation!.value),
            child: Container(
              constraints: const BoxConstraints.expand(),
              color: _filterColorAnimation!.value,
            ),
          );
        },
      );
    }

    if (_filterBlurAnimation != null) {
      return AnimatedBuilder(
        animation: _filterBlurAnimation!,
        builder: (context, child) {
          return BackdropFilter(
            filter: ImageFilter.blur(sigmaX: _filterBlurAnimation!.value, sigmaY: _filterBlurAnimation!.value),
            child: Container(
              constraints: const BoxConstraints.expand(),
              color: Colors.transparent,
            ),
          );
        },
      );
    }

    if (_filterColorAnimation != null) {
      AnimatedBuilder(
        animation: _filterColorAnimation!,
        builder: (context, child) {
          return Container(
            constraints: const BoxConstraints.expand(),
            color: _filterColorAnimation!.value,
          );
        },
      );
    }

    return Container(
      constraints: const BoxConstraints.expand(),
      color: Colors.transparent,
    );
  }

  /// This string is a workaround until Dismissible supports a returning item
  String dismissibleKeyGen = '';

  Widget _getDismissibleFlushbar(Widget child) {
    return Dismissible(
      direction: _getDismissDirection(),
      resizeDuration: null,
      confirmDismiss: (_) {
        if (currentStatus == FlushbarStatus.IS_APPEARING || currentStatus == FlushbarStatus.IS_HIDING) {
          return Future.value(false);
        }
        return Future.value(true);
      },
      key: Key(dismissibleKeyGen),
      onDismissed: (_) {
        dismissibleKeyGen += '1';
        _cancelTimer();
        _wasDismissedBySwipe = true;

        if (isCurrent) {
          navigator!.pop();
        } else {
          navigator!.removeRoute(this);
        }
      },
      child: _getFlushbar(),
    );
  }

  DismissDirection _getDismissDirection() {
    if (flushbar.dismissDirection == FlushbarDismissDirection.HORIZONTAL) {
      return DismissDirection.horizontal;
    } else {
      if (flushbar.flushbarPosition == FlushbarPosition.TOP) {
        return DismissDirection.up;
      } else {
        return DismissDirection.down;
      }
    }
  }

  Widget _getFlushbar() {
    return Container(
      margin: flushbar.margin,
      child: _builder,
    );
  }

  @override
  bool get finishedWhenPopped => _controller!.status == AnimationStatus.dismissed;

  /// The animation that drives the route's transition and the previous route's
  /// forward transition.
  Animation<Alignment>? get animation => _animation;
  Animation<Alignment>? _animation;

  /// The animation controller that the route uses to drive the transitions.
  ///
  /// The animation itself is exposed by the [animation] property.
  @protected
  AnimationController? get controller => _controller;
  AnimationController? _controller;

  /// Called to create the animation controller that will drive the transitions to
  /// this route from the previous one, and back to the previous route from this
  /// one.
  AnimationController createAnimationController() {
    assert(!_transitionCompleter.isCompleted, 'Cannot reuse a $runtimeType after disposing it.');
    assert(flushbar.animationDuration >= Duration.zero);
    return AnimationController(
      duration: flushbar.animationDuration,
      debugLabel: debugLabel,
      vsync: navigator!,
    );
  }

  /// Called to create the animation that exposes the current progress of
  /// the transition controlled by the animation controller created by
  /// [createAnimationController()].
  Animation<Alignment> createAnimation() {
    assert(!_transitionCompleter.isCompleted, 'Cannot reuse a $runtimeType after disposing it.');
    assert(_controller != null);
    return AlignmentTween(begin: _initialAlignment, end: _endAlignment).animate(
      CurvedAnimation(
        parent: _controller!,
        curve: flushbar.forwardAnimationCurve,
        reverseCurve: flushbar.reverseAnimationCurve,
      ),
    );
  }

  Animation<double>? createBlurFilterAnimation() {
    if (flushbar.routeBlur == null) {
      return null;
    }

    return Tween(begin: 0.0, end: flushbar.routeBlur).animate(
      CurvedAnimation(
        parent: _controller!,
        curve: const Interval(
          0.0,
          0.35,
          curve: Curves.easeInOutCirc,
        ),
      ),
    );
  }

  Animation<Color?>? createColorFilterAnimation() {
    if (flushbar.routeColor == null) {
      return null;
    }

    return ColorTween(begin: Colors.transparent, end: flushbar.routeColor).animate(
      CurvedAnimation(
        parent: _controller!,
        curve: const Interval(
          0.0,
          0.35,
          curve: Curves.easeInOutCirc,
        ),
      ),
    );
  }

  //copy of `routes.dart`
  void _handleStatusChanged(AnimationStatus status) {
    switch (status) {
      case AnimationStatus.completed:
        currentStatus = FlushbarStatus.SHOWING;
        if (_onStatusChanged != null) {
          _onStatusChanged!(currentStatus);
        }
        if (overlayEntries.isNotEmpty) {
          overlayEntries.first.opaque = opaque;
        }

        break;
      case AnimationStatus.forward:
        currentStatus = FlushbarStatus.IS_APPEARING;
        if (_onStatusChanged != null) {
          _onStatusChanged!(currentStatus);
        }
        break;
      case AnimationStatus.reverse:
        currentStatus = FlushbarStatus.IS_HIDING;
        if (_onStatusChanged != null) {
          _onStatusChanged!(currentStatus);
        }
        if (overlayEntries.isNotEmpty) {
          overlayEntries.first.opaque = false;
        }
        break;
      case AnimationStatus.dismissed:
        assert(!overlayEntries.first.opaque);
        // We might still be the current route if a subclass is controlling the
        // the transition and hits the dismissed status. For example, the iOS
        // back gesture drives this animation to the dismissed status before
        // popping the navigator.
        currentStatus = FlushbarStatus.DISMISSED;
        if (_onStatusChanged != null) {
          _onStatusChanged!(currentStatus);
        }

        if (!isCurrent) {
          navigator!.finalizeRoute(this);
          if (overlayEntries.isNotEmpty) {
            overlayEntries.clear();
          }
          assert(overlayEntries.isEmpty);
        }
        break;
    }
    changedInternalState();
  }

  @override
  void install() {
    assert(!_transitionCompleter.isCompleted, 'Cannot install a $runtimeType after disposing it.');
    _controller = createAnimationController();
    assert(_controller != null, '$runtimeType.createAnimationController() returned null.');
    _filterBlurAnimation = createBlurFilterAnimation();
    _filterColorAnimation = createColorFilterAnimation();
    _animation = createAnimation();
    assert(_animation != null, '$runtimeType.createAnimation() returned null.');
    super.install();
  }

  @override
  TickerFuture didPush() {
    assert(_controller != null, '$runtimeType.didPush called before calling install() or after calling dispose().');
    assert(!_transitionCompleter.isCompleted, 'Cannot reuse a $runtimeType after disposing it.');
    _animation!.addStatusListener(_handleStatusChanged);
    _configureTimer();
    super.didPush();
    return _controller!.forward();
  }

  @override
  void didReplace(Route<dynamic>? oldRoute) {
    assert(_controller != null, '$runtimeType.didReplace called before calling install() or after calling dispose().');
    assert(!_transitionCompleter.isCompleted, 'Cannot reuse a $runtimeType after disposing it.');
    if (oldRoute is FlushbarRoute) {
      _controller!.value = oldRoute._controller!.value;
    }
    _animation!.addStatusListener(_handleStatusChanged);
    super.didReplace(oldRoute);
  }

  @override
  bool didPop(T? result) {
    assert(_controller != null, '$runtimeType.didPop called before calling install() or after calling dispose().');
    assert(!_transitionCompleter.isCompleted, 'Cannot reuse a $runtimeType after disposing it.');

    _result = result;
    _cancelTimer();

    if (_wasDismissedBySwipe) {
      Timer(const Duration(milliseconds: 200), () {
        _controller!.reset();
      });

      _wasDismissedBySwipe = false;
    } else {
      _controller!.reverse();
    }

    return super.didPop(result);
  }

  void _configureTimer() {
    if (flushbar.duration != null) {
      if (_timer != null && _timer!.isActive) {
        _timer!.cancel();
      }
      _timer = Timer(flushbar.duration!, () {
        if (isCurrent) {
          navigator!.pop();
        } else if (isActive) {
          navigator!.removeRoute(this);
        }
      });
    } else {
      if (_timer != null) {
        _timer!.cancel();
      }
    }
  }

  void _cancelTimer() {
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel();
    }
  }

  /// Whether this route can perform a transition to the given route.
  ///
  /// Subclasses can override this method to restrict the set of routes they
  /// need to coordinate transitions with.
  bool canTransitionTo(FlushbarRoute<dynamic> nextRoute) => true;

  /// Whether this route can perform a transition from the given route.
  ///
  /// Subclasses can override this method to restrict the set of routes they
  /// need to coordinate transitions with.
  bool canTransitionFrom(FlushbarRoute<dynamic> previousRoute) => true;

  @override
  void dispose() {
    assert(!_transitionCompleter.isCompleted, 'Cannot dispose a $runtimeType twice.');
    _controller?.dispose();
    _transitionCompleter.complete(_result);
    super.dispose();
  }

  /// A short description of this route useful for debugging.
  String get debugLabel => '$runtimeType';

  @override
  String toString() => '$runtimeType(animation: $_controller)';
}

FlushbarRoute showFlushbar<T>({
  required BuildContext context,
  required Flushbar flushbar,
}) {
  return FlushbarRoute<T>(
    flushbar: flushbar,
    settings: const RouteSettings(name: FLUSHBAR_ROUTE_NAME),
  );
}
