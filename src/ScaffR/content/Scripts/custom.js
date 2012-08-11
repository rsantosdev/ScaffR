/// <reference path="jquery.signalR-0.5.2.js" />
/// <reference path="jquery-1.7.2-vsdoc.js" />
/// <reference path="knockout-2.1.0.debug.js" />

(function ($) {

    $(function () {

        var notifier = $.connection.notifications;

        notifier.notify = function (e) {
            console.log(e);
        };

        $.connection.hub.start();

    });


})(jQuery);