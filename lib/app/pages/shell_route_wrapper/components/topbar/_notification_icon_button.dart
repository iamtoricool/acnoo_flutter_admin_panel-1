part of '_topbar.dart';

class NotificationIconButton extends StatelessWidget {
  const NotificationIconButton({
    super.key,
    this.notificationCount = 0,
  });

  final int notificationCount;

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return LayoutBuilder(
      builder: (ctx, constraints) {
        final _size = constraints.biggest;
        return IconButton(
          onPressed: () {},
          icon: SizedBox.square(
            dimension: _size.height / 2,
            child: Stack(
              children: [
                const Center(
                  child: Icon(
                    Icons.notifications_none_sharp,
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  height: _size.height / 3.74,
                  width: _size.height / 3.74,
                  child: Container(
                    alignment: Alignment.center,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                    child: Text(
                      notificationCount.toString(),
                      style: _theme.textTheme.bodySmall?.copyWith(
                        fontSize: 10,
                        color: _theme.colorScheme.onError,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
