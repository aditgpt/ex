// ignore_for_file: no_default_cases

import 'dart:async';

import 'package:flutter/material.dart';

import '../../ex.dart';

class ExListView extends StatefulWidget {
  const ExListView({
    Key? key,
    required this.itemCount,
    required this.itemBuilder,
    this.headerBuilder,
    this.footerBuilder,
    this.loadMore = false,
    this.onLoadMore,
    this.loadMoreWhenNoData = false,
    this.loadMoreItemBuilder,
    this.dividerBuilder,
    this.physics,
    this.headerSliverBuilder,
    this.controller,
    this.foregroundWidget,
    this.padding,
    this.scrollbarEnable = true,
    this.isSliverMode = false,
    // [Not Recommended]
    // Sliver mode will discard a lot of ListView variables (likes physics, controller),
    // and each of items must be sliver.
    // *Sliver mode will build all items when inited. (ListView item is built by lazy)*
  }) : super(key: key);

  final int itemCount;
  final WidgetBuilder? headerBuilder;
  final WidgetBuilder? footerBuilder;
  final WidgetBuilder? loadMoreItemBuilder;
  final IndexedWidgetBuilder itemBuilder;
  final IndexedWidgetBuilder? dividerBuilder;
  final bool loadMore;
  final bool loadMoreWhenNoData;
  final bool scrollbarEnable;
  final VoidCallback? onLoadMore;
  final ScrollPhysics? physics;
  final ScrollController? controller;
  final NestedScrollViewHeaderSliversBuilder? headerSliverBuilder;
  final Widget? foregroundWidget;
  final EdgeInsetsGeometry? padding;
  final bool isSliverMode;

  @override
  State<StatefulWidget> createState() => ExListViewState();
}

enum ItemType { header, footer, loadMore, data, dividerData }

class ExListViewState extends State<ExListView> {
  bool get isNested => widget.headerSliverBuilder != null;

  @override
  Widget build(BuildContext context) => isNested
      ? NestedScrollView(
          headerSliverBuilder: widget.headerSliverBuilder!,
          physics: widget.physics,
          controller: widget.controller,
          body: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: _buildList(),
          ),
        )
      : _buildList();

  Widget _itemBuilder(context, int index) {
    final headerCount = _headerCount();
    final totalItemCount = _dataItemCount() + headerCount + _footerCount();
    switch (_itemType(index, totalItemCount)) {
      case ItemType.header:
        return widget.headerBuilder!(context);
      case ItemType.footer:
        return widget.footerBuilder!(context);
      case ItemType.loadMore:
        return _buildLoadMoreItem();
      case ItemType.dividerData:
        return _buildDividerWithData(index, index - headerCount);
      case ItemType.data:
      default:
        return widget.itemBuilder(context, index - headerCount);
    }
  }

  Stack _buildList() {
    final headerCount = _headerCount();
    final totalItemCount = _dataItemCount() + headerCount + _footerCount();
    final listView = widget.isSliverMode
        ? CustomScrollView(
            slivers: List.generate(
              totalItemCount,
              (index) => _itemBuilder(context, index),
            ),
          )
        : ListView.builder(
            physics: isNested ? null : widget.physics,
            controller: isNested ? null : widget.controller,
            padding: widget.padding,
            itemCount: totalItemCount,
            itemBuilder: _itemBuilder,
          );

    // ignore: omit_local_variable_types
    final List<Widget> children = widget.scrollbarEnable ? [Scrollbar(child: listView)] : [listView];
    if (widget.foregroundWidget != null) {
      children.add(widget.foregroundWidget!);
    }
    return Stack(children: children);
  }

  ItemType _itemType(itemIndex, totalItemCount) {
    if (_isHeader(itemIndex)) {
      return ItemType.header;
    } else if (_isLoadMore(itemIndex, totalItemCount)) {
      return ItemType.loadMore;
    } else if (_isFooter(itemIndex, totalItemCount)) {
      return ItemType.footer;
    } else if (_hasDivider()) {
      return ItemType.dividerData;
    } else {
      return ItemType.data;
    }
  }

  Widget _buildLoadMoreItem() {
    if ((widget.loadMoreWhenNoData || (!widget.loadMoreWhenNoData && widget.itemCount > 0)) && widget.onLoadMore != null) {
      Timer(Duration(milliseconds: 50), widget.onLoadMore!);
    }
    return widget.loadMoreItemBuilder != null
        ? widget.loadMoreItemBuilder!(context)
        : widget.isSliverMode
            ? SliverList(delegate: SliverChildListDelegate([_defaultLoadMore]))
            : _defaultLoadMore;
  }

  Widget _buildDividerWithData(int index, int dataIndex) => index.isEven
      ? widget.dividerBuilder != null
          ? widget.dividerBuilder!(context, dataIndex ~/ 2)
          : widget.isSliverMode
              ? SliverList(delegate: SliverChildListDelegate([_defaultDivider]))
              : _defaultDivider
      : widget.itemBuilder(context, dataIndex ~/ 2);

  bool _isHeader(itemIndex) => _hasHeader() && itemIndex == 0;

  bool _isLoadMore(int itemIndex, int total) => widget.loadMore && itemIndex == total - 1;

  bool _isFooter(int itemIndex, int total) => _hasFooter() && itemIndex == total - 1;

  int _headerCount() => _hasHeader() ? 1 : 0;

  int _footerCount() => (_hasFooter() || widget.loadMore) ? 1 : 0;

  int _dataItemCount() => _hasDivider() ? widget.itemCount * 2 - 1 : widget.itemCount;

  bool _hasDivider() => widget.dividerBuilder != null;

  bool _hasHeader() => widget.headerBuilder != null;

  bool _hasFooter() => widget.footerBuilder != null;

  final _defaultLoadMore = Container(
    padding: const EdgeInsets.all(8),
    child: Center(
      child: LoadingAnimationWidget.discreteCircle(color: Colors.grey, size: 24),
    ),
  );

  final _defaultDivider = const Divider(color: Colors.grey);
}
