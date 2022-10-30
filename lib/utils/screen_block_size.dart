import 'package:responsive_builder/responsive_builder.dart';

class ScreenBlockSize{
  double verticalBlockSize;
  double horizontalBlockSize;
  ScreenBlockSize({required SizingInformation screenSizeConfig})
      : this.horizontalBlockSize = screenSizeConfig.screenSize.width / 100,
        this.verticalBlockSize = screenSizeConfig.screenSize.height /100;
}