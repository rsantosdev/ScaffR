using System;
using $rootnamespace$.Core.Eventing;
using $rootnamespace$.Handlers;
using $rootnamespace$.Models;

[assembly: WebActivator.PreApplicationStartMethod(typeof($rootnamespace$.App_Start.MVCToolsStart), "PreStart")]

namespace $rootnamespace$.App_Start {
    public static class MVCToolsStart {
        public static void PreStart() {
            MessageBus.Instance.Subscribe(NotificationHandler.Instance);
        }
    }
}