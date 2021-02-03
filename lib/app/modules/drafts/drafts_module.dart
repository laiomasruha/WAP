import 'package:wapp_reports/app/modules/drafts/grid/draft_images_grid.dart';
import 'package:wapp_reports/app/modules/drafts/grid/draft_set_image.dart';
import 'package:wapp_reports/app/modules/drafts/grid/edit/draft_edit_image.dart';
import 'package:wapp_reports/app/modules/drafts/grid/edit/draft_images_controller.dart';
import 'package:wapp_reports/app/modules/drafts/list/draft_obs_list.dart';
import 'package:wapp_reports/app/modules/drafts/list/draft_service_list.dart';
import 'package:wapp_reports/app/modules/drafts/list/draft_set_list_item.dart';
import 'package:wapp_reports/app/modules/drafts/list/draft_staff_list.dart';
import 'package:wapp_reports/app/modules/drafts/sender/draft_sender_list.dart';
import 'package:wapp_reports/app/modules/drafts/title/draft_set_title.dart';
import 'package:wapp_reports/utils/custom_dio.dart';

import 'repositories/drafts_repository.dart';
import 'drafts_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'drafts_page.dart';

class DraftsModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => DraftImagesController()),
        Bind((i) => DraftsController(repository: i.get<DraftsRepository>())),
        Bind((i) => DraftsRepository(dio: i.get<CustomDio>())),
        Bind((i) => CustomDio()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => DraftsPage()),
        Router("/title", child: (_, args) => DraftSetTitle()),
        Router("/services",
            child: (_, args) => DraftServiceList(controller: args.data)),
        Router("/staff",
            child: (_, args) => DraftStaffList(controller: args.data)),
        Router("/obs", child: (_, args) => DraftObsList(controller: args.data)),
        Router("/images",
            child: (_, args) => DraftImagesGrid(controller: args.data)),
        Router(
          "/set-image/:id",
          child: (_, args) => DraftSetImage(
            controller: args.data,
            index: args.params['id'],
          ),
        ),
        Router("/edit/:item",
            child: (_, args) => DraftSetListItem(item: args.params['item'])),
        Router("/edit/image/:id",
            child: (_, args) =>
                DraftEditImage(index: args.params['id'], image: args.data)),
        Router("/sender", child: (_, args) => DraftSenderList()),
      ];

  static Inject get to => Inject<DraftsModule>.of();
}
