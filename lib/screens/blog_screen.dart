// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:markdown_widget/markdown_widget.dart';

import 'package:my_website/app/widgets/widget.dart';
import 'package:my_website/constants/blogs_constant.dart';

class BlogScreen extends StatefulWidget {
  final int blogId;
  const BlogScreen({
    super.key,
    required this.blogId,
  });

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  String? blogData;

  @override
  void initState() {
    _loadBlogAsset(blogId: widget.blogId);

    super.initState();
  }

  /// Loads the markdown data from a file in the assets, and updates [blogData]
  /// with the result.
  void _loadBlogAsset({required int blogId}) {
    final blogPath = bloglist.where((e) => e.id == blogId).first;
    rootBundle.loadString(blogPath.path ?? '').then((value) {
      setState(() {
        blogData = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final config =
        isDark ? MarkdownConfig.darkConfig : MarkdownConfig.defaultConfig;
    return ResponsivePadding(
        child: MarkdownWidget(
      data: blogData ?? '',
      config: config.copy(configs: [
        PreConfig(
            wrapper: (child, code, language) => CodeWrapperWidget(
                  child,
                  code,
                  language,
                ),
            textStyle: theme.textTheme.bodySmall!.copyWith(
              fontFamily: 'Euclid-Regular',
            ),
            decoration: BoxDecoration(
                color:
                    isDark ? const Color(0xff2d2d2d) : const Color(0xffeff1f3),
                borderRadius: const BorderRadius.all(Radius.circular(8.0))))
      ]),
    ));
  }
}
