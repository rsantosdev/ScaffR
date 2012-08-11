using System;
using $rootnamespace$.Core.Interfaces.Eventing;
using $rootnamespace$.Models;
using SignalR;

namespace $rootnamespace$.Handlers
{
    public partial class NotificationHandler : Handles<UserNotification>
    {
        private static object mLock = new object();
        private static NotificationHandler _instance;
        public static NotificationHandler Instance
        {
            get
            {
                if (_instance == null)
                {
                    lock (mLock)
                    {
                        _instance = new NotificationHandler();
                    }
                }
                return _instance;
            }
        }

        public void OnEvent(UserNotification e)
        {
            var context = GlobalHost.ConnectionManager.GetHubContext("notifications");
            context.Clients.notify(e);
        }
    }
}