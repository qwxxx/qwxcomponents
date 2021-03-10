//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <qwxcomponents/qwxcomponents_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) qwxcomponents_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "QwxcomponentsPlugin");
  qwxcomponents_plugin_register_with_registrar(qwxcomponents_registrar);
}
